/* Helper file to process and store vector embeddings in HANA Cloud */

const cds = require('@sap/cds');
const { INSERT, DELETE, SELECT, UPDATE } = cds.ql;
const { RecursiveCharacterTextSplitter } = require("langchain/text_splitter");
const fs = require('fs');
const { PDFDocument } = require('pdf-lib');
const { PDFLoader } = require('langchain/document_loaders/fs/pdf');
const { setMaxIdleHTTPParsers } = require('http');


// Helper method to convert embeddings to buffer for insertion
let array2VectorBuffer = (data) => {
  const sizeFloat = 4;
  const sizeDimensions = 4;
  const bufferSize = data.length * sizeFloat + sizeDimensions;

  const buffer = Buffer.allocUnsafe(bufferSize);
  // write size into buffer
  buffer.writeUInt32LE(data.length, 0);
  data.forEach((value, index) => {
    buffer.writeFloatLE(value, index * sizeFloat + sizeDimensions);
  });
  return buffer;
};

// Helper method to delete file if it already exists
const deleteIfExists = (filePath) => {
  try {
    fs.unlink(filePath, (err) => {
      if (err) {
        if (err.code === 'ENOENT') {
          console.log('File does not exist');
        } else {
          console.error('Error deleting file:', err);
        }
      } else {
        console.log('File deleted successfully');
      }
    });
  } catch (unlinkErr) {
    console.error('Error occurred while attempting to delete file:', unlinkErr);
  }
};


module.exports = function () {

  this.on('storeEmbeddings', async (req) => {
    try {
      const { uuid } = req.data;
      const db = await cds.connect.to('db');
      const { Files, DocumentChunk, DoxContent } = this.entities;
      const capllmplugin = await cds.connect.to("cap-llm-plugin");
      let textChunkEntries = [];
      const embeddingModelName = "text-embedding-ada-002";
      
      // Check if document exists
      const isDocumentPresent = await SELECT.from(Files).where({ ID: uuid });
      if (!isDocumentPresent || isDocumentPresent.length == 0) {
        throw new Error(`Document id : ${uuid} not yet persisted in database!`)
      }

      // Load pdf from HANA and create a temp pdf doc
      const stream = await db.stream(SELECT('content').from(Files, uuid));
      //const doxData = await SELECT('content').from(DoxContent, uuid);

      const fileName = await (SELECT('fileName').from(Files).where({ ID: uuid }));
      const fileNameString = fileName[0].fileName;

      const tempDocLocation = __dirname + `/${fileNameString}`;
      console.log("***********************************************************************************************\n");
      console.log(`Received the request to split the document ${fileNameString} and store it into SAP HANA Cloud!\n`);
      // Create a new PDF document
      const pdfDoc = await PDFDocument.create();
      const pdfBytes = [];

      // Read PDF content and store it in pdfBytes array
      stream.on('data', (chunk) => {
        pdfBytes.push(chunk);
      });

      // Wait for the stream to finish
      await new Promise((resolve, reject) => {
        stream.on('end', () => {
          resolve();
        });
      });

      // Convert pdfBytes array to a single Buffer
      const pdfBuffer = Buffer.concat(pdfBytes);

      // Load PDF data into a document
      const externalPdfDoc = await PDFDocument.load(pdfBuffer);

      // Copy pages from external PDF document to the new document
      const pages = await pdfDoc.copyPages(externalPdfDoc, externalPdfDoc.getPageIndices());
      pages.forEach((page) => {
        pdfDoc.addPage(page);
      });
      
      // pdfDoc.addPage().drawText(JSON.stringify(doxData));

      // Save the PDF document to a new file
      const pdfData = await pdfDoc.save();
      await fs.writeFileSync(tempDocLocation, pdfData);

      console.log('Temporary PDF File restored and saved to:', tempDocLocation);

      // Delete existing embeddings 
      await DELETE.from(DocumentChunk).where({metadata_column: fileNameString});

      // Load the document to langchain text loader
      loader = new PDFLoader(tempDocLocation);
      const document = await loader.load();

      // Split the document into chunks
      console.log("Splitting the document into text chunks.");
      const splitter = new RecursiveCharacterTextSplitter({
        chunkSize: 5000,
        chunkOverlap: 500,
        addStartIndex: true
      });

      const textChunks = await splitter.splitDocuments(document);
      console.log(`Documents split into ${textChunks.length} chunks.`);

      console.log("Leveraging the CAP LLM plugin to generate the vector embeddings for the text chunks.\n");
      // For each text chunk generate the embeddings
      for (const chunk of textChunks) {
        const embeddingModelConfig = cds.env.requires["gen-ai-hub"][embeddingModelName];
        const embeddingResult = await capllmplugin.getEmbeddingWithConfig(embeddingModelConfig, chunk.pageContent);
        let embedding = null;
        //using Azure OpenAI's text-embedding-ada-002 model.
        
        if (embeddingModelName === "text-embedding-ada-002"){
           embedding =  embeddingResult?.data[0]?.embedding;
        }
        //Parse the responses of other embedding models supported by the CAP LLM Plugin
        else{
          throw new Error(`Embedding model ${embeddingModelName} not supported!\n`)
        }
        const entry = {
          "text_chunk": chunk.pageContent,
          "metadata_column": fileNameString,
          "embedding": array2VectorBuffer(embedding)
        };
        textChunkEntries.push(entry);
      }

      console.log("Inserting text chunks with embeddings into SAP HANA Cloud's vector engine!\n");
      // Insert the text chunk with embeddings into db
      const insertStatus = await INSERT.into(DocumentChunk).entries(textChunkEntries);
      if (!insertStatus) {
        throw new Error("Insertion of text chunks into db failed!");
      }
      console.log(`RAG content generation for the document ${fileNameString} completed!\n`);
      // Delete temp document
      deleteIfExists(tempDocLocation);

    }
    catch (error) {
      // Handle any errors that occur during the execution
      console.log('Error while generating and storing vector embeddings:', error);
      throw error;
    }
    return "Embeddings stored successfully!";

  })

  this.on('deleteEmbeddings', async (req) => {
    try {
      const {fileName} = req.data;
      const { DocumentChunk } = this.entities;
      // Check if document exists
      const isDocumentChunkPresent = await SELECT.one.from(DocumentChunk).where({metadata_column: fileName});
      if (!isDocumentChunkPresent || isDocumentChunkPresent.length == 0) {
        throw new Error(`No embeddings to delete in database!`);       
      }
      // Delete any previous records in the table
      await DELETE.from(DocumentChunk).where({metadata_column: fileName});
      return "Success!"
    }
    catch (error) {
      // Handle any errors that occur during the execution
      console.log('Error while deleting the embeddings content in db for file:', error);
      throw error;
    }
  })

  // this.on('storeDoxContent', async (req) => {
  //   try {
  //     const { id, doxContent } = req.data;
  //     const { Files, DoxContent } = this.entities;
  //     //const doxString = '\"This is test\"';
  //     //const blob = new Blob([doxString], { type : 'plain/text' });
  //     // cds.run(
  //     //   `UPDATE sap_contracts_demo_files SET doxContent = ${doxString} WHERE ID = ${id}`
  //     // );
  //     //const updateStatus = UPDATE(Files).set`doxContent = ${doxString}`.where`ID = ${id}`;
  //     //const updateStatus = UPDATE(Conversation).set({TITLE : 'what are dates for RFP submission'}).where({cID : 'febb0b69-2bcf-4ee6-84cb-8503aa061aff'});
  //     //return updateStatus;
  //     const doxRecord = {
  //       "id": id,
  //       "content": doxContent
  //     };
  //     const insertStatus = await INSERT.into(DoxContent).entries([doxRecord]);
  //     return insertStatus;
  //   }
  //   catch (error) {
  //     // Handle any errors that occur during the execution
  //     console.log('Error while updating dox content in db for file:', error);
  //     throw error;
  //   }
  // })

  this.on('checkEmbeddingCompletion', (req) => {
    try {
      const { uuid } = req.data;
      const { Files, DocumentChunk } = this.entities;
      const fileName = (SELECT('fileName').from(Files).where({ ID: uuid }));
      // Check if document exists
      //var isDocumentChunkPresent = await (SELECT.one.from(DocumentChunk).where({ metadata_column: fileName}));
      var isDocumentChunkPresent = (SELECT.one.from(DocumentChunk).where({ metadata_column: fileName}));    
      
      if (!isDocumentChunkPresent || isDocumentChunkPresent.length == 0) {
        console.log(`No embeddings exist for the file in database yet!`);
        return "Not Found";
      }
      return "Found";
    }
    catch (error) {
      // Handle any errors that occur during the execution
      console.log('Error while checking the embeddings content in db:', error);
      throw error;
    }
  })

  this.on('getExtractedInvoiceData', async (req) => {
    try {
      const { id } = req.data;
      const { Files, DocumentChunk, InvoiceDoxContent } = this.entities;
      const extractedData = await SELECT('content').from(InvoiceDoxContent, id);
      var invoiceRecord = {};
      if (extractedData && extractedData.content.length > 0) {
        const extractedFields = JSON.parse(extractedData.content);
        invoiceRecord = extractedFields[0];
        // extractedFields.forEach(function(x) {
          // if (x.name == 'documentNumber') {
          //   invoiceRecord.documentNumber = x.value;
          // }
          // if (x.name == 'purchaseOrderNumber') {
          //   invoiceRecord.purchaseOrderNumber = x.value;
          // }
          // if (x.name == 'deliveryNoteNumber') {
          //   invoiceRecord.deliveryNoteNumber = x.value;
          // }
          // if (x.name == 'documentDate') {
          //   invoiceRecord.documentDate = x.value;
          // }
          // if (x.name == 'deliveryDate') {
          //   invoiceRecord.deliveryDate = x.value;
          // }
          // if (x.name == 'netAmount') {
          //   invoiceRecord.netAmount = x.value;
          // }
          // if (x.name == 'grossAmount') {
          //   invoiceRecord.grossAmount = x.value;
          // }
          // if (x.name == 'taxAmount') {
          //   invoiceRecord.taxAmount = x.value;
          // }
          // if (x.name == 'unitPrice') {
          //   invoiceRecord.unitPrice = x.value;
          // }
          // if (x.name == 'taxId') {
          //   invoiceRecord.taxId = x.value;
          // }
          // if (x.name == 'taxRate') {
          //   invoiceRecord.taxRate = x.value;
          // }
          // if (x.name == 'currencyCode') {
          //   invoiceRecord.currencyCode = x.value;
          // }
          // if (x.name == 'quantity') {
          //   invoiceRecord.quantity = x.value;
          // }
          // if (x.name == 'unitOfMeasure') {
          //   invoiceRecord.unitOfMeasure = x.value;
          // }
          // if (x.name == 'paymentTerms') {
          //   invoiceRecord.paymentTerms = x.value;
          // }
          // if (x.name == 'receiverName') {
          //   invoiceRecord.receiverName = x.value;
          // }
          // if (x.name == 'receiverAddress') {
          //   invoiceRecord.receiverAddress = x.value;
          // }
          // if (x.name == 'receiverCity') {
          //   invoiceRecord.receiverCity = x.value;
          // }
          // if (x.name == 'senderName') {
          //   invoiceRecord.senderName = x.value;
          // }
          // if (x.name == 'senderAddress') {
          //   invoiceRecord.senderAddress = x.value;
          // }
          // if (x.name == 'senderCity') {
          //   invoiceRecord.senderCity = x.value;
          // }
        // }) 
      }
      return invoiceRecord;
    }
    catch (error) {
      // Handle any errors that occur during the execution
      console.log('Error while fetching extracted contents for file:', error);
      throw error;
    }
  })

  this.on('getExtractedContractData', async (req) => {
    try {
      const { id } = req.data;
      const { Files, DocumentChunk, ContractDoxContent } = this.entities;
      const extractedData = await SELECT('content').from(ContractDoxContent, id);
      var contractRecord = {};
      if (extractedData && extractedData.content.length > 0) {
        const extractedFields = JSON.parse(extractedData.content);
        contractRecord = extractedFields[0];
        // extractedFields.forEach(function(x) {
          // if (x.name == 'ContractNumber') {
          //   contractRecord.ContractNumber = x.value;
          // }
          // if (x.name == 'ContractName') {
          //   contractRecord.ContractName = x.value;
          // }
          // if (x.name == 'ValidityStartDate') {
          //   contractRecord.ValidityStartDate = x.value;
          // }
          // if (x.name == 'ValidityEndDate') {
          //   contractRecord.ValidityEndDate = x.value;
          // }
          // if (x.name == 'Country') {
          //   contractRecord.Country = x.value;
          // }
          // if (x.name == 'Location') {
          //   contractRecord.Location = x.value;
          // }
          // if (x.name == 'Supplier') {
          //   contractRecord.Supplier = x.value;
          // }
          // if (x.name == 'CustomerName') {
          //   contractRecord.CustomerName = x.value;
          // }
          // if (x.name == 'TotalContractAmount') {
          //   contractRecord.TotalContractAmount = x.value;
          // }
          // if (x.name == 'UnitPrice') {
          //   contractRecord.UnitPrice = x.value;
          // }
          // if (x.name == 'Currency') {
          //   contractRecord.Currency = x.value;
          // }
          // if (x.name == 'Material') {
          //   contractRecord.Material = x.value;
          // }
        // })
      }
      return contractRecord;
    }
    catch (error) {
      // Handle any errors that occur during the execution
      console.log('Error while fetching extracted contents for file:', error);
      throw error;
    }
  })

  this.on('postSchedulingAgreementToSap', async (req) => {
    try {
      const { contractData } = req.data;
      const api_srv = await cds.connect.to("ZAPI_SCHED_AGRMT_PROCESS_SRV");
      const payload = {
        "CompanyCode": "1010",
        "PurchasingOrganization": "1010",
        "PurchasingGroup": "001",
        "PurchasingDocumentType": "LP",
        "Supplier": "10300001",
        "ValidityStartDate": "\/Date(1737742881000)\/",
        "ValidityEndDate": "\/Date(1767198081000)\/",
        "to_SchedgAgrmtItm": {
            "results": [
                {
                    "CompanyCode": "1010",
                    "Material": "2000000050",
                    "PurchasingDocumentItemCategory": "2",
                    "ManufacturerMaterial": "2000000050",
                    "MaterialGroup": "L002",
                    "Plant": "1010",
                    "OrderQuantityUnit": "PC",
                    "TargetQuantity": "100",
                    "NetPriceAmount": "0.00",
                    "NetPriceQuantity": "1",
                    "OrderPriceUnit": "PC",
                    "StorageLocation": "101A"
                }
            ]
        }
      };
      
      const results = await api_srv.send({
        method: 'POST',
        path: '/A_SchAgrmtHeader',
        data: payload
      });
      return JSON.stringify(results);

    }
    catch (error) {
      // Handle any errors that occur during the execution
      console.log('Error while posting scheduling agreement to SAP:', error);
      throw error;
    }
  })

  this.on('getPurchaseOrderDetailsFromSap', async (req) => {
    try {
      const { purchaseOrder } = req.data;
      const po_srv = await cds.connect.to("ZAPI_PURCHASEORDER_PROCESS_SRV");
      var result;
      if (purchaseOrder === '*') {
        result = await po_srv.run(
          SELECT.from("ZAPI_PURCHASEORDER_PROCESS_SRV.A_PurchaseOrder", (pohdr) => {
            pohdr.PurchaseOrder,
            pohdr.PurchaseOrderDate,
            pohdr.PaymentTerms,
            pohdr.Supplier,
            pohdr.AddressName,
            pohdr.to_PurchaseOrderItem((poitem) => {
              poitem.PurchaseOrderItem,
              poitem.PurchaseOrderItemText,
              poitem.OrderQuantity,
              poitem.PurchaseOrderQuantityUnit,
              poitem.DocumentCurrency,
              poitem.NetPriceAmount,
              poitem.DocumentCurrency;
            });
          })
        );
      } else {
        result = await po_srv.run(
          SELECT.from("ZAPI_PURCHASEORDER_PROCESS_SRV.A_PurchaseOrder", (pohdr) => {
            pohdr.PurchaseOrder,
            pohdr.PurchaseOrderDate,
            pohdr.PaymentTerms,
            pohdr.Supplier,
            pohdr.AddressName,
            pohdr.to_PurchaseOrderItem((poitem) => {
              poitem.PurchaseOrderItem,
              poitem.PurchaseOrderItemText,
              poitem.OrderQuantity,
              poitem.PurchaseOrderQuantityUnit,
              poitem.DocumentCurrency,
              poitem.NetPriceAmount,
              poitem.DocumentCurrency;
            });
          }).where({PurchaseOrder : purchaseOrder})
        );

      }


      return JSON.stringify(result);

    }
    catch (error) {
      // Handle any errors that occur during the execution
      console.log('Error while fetching purchase order data from SAP:', error);
      throw error;
    }
  })
}
