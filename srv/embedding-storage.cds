using {rag.contracts.demo as db} from '../db/schema';

service EmbeddingStorageService @(requires: 'authenticated-user') {

  entity DocumentChunk as
    projection on db.DocumentChunk
    excluding {
      embedding
    };

  entity Files as projection on db.Files;
  entity ContractDoxContent as projection on db.ContractDoxContent;
  entity InvoiceDoxContent as projection on db.InvoiceDoxContent;
  entity GRDoxContent as projection on db.GRDoxContent;
  entity POContent as projection on db.POContent;
  type ContractData {
      ContractNumber     : String;
      ContractName            : String;
      ValidityStartDate        : Date;
      ValidityEndDate        : Date;
      Country: String;
      Location: String;
      Supplier: String;
      CustomerName: String;
      TotalContractAmount : Double;
      UnitPrice: Double;
      Currency: String;
      Material: String;
      Quantity: Double;
  };

  type InvoiceData {
      documentNumber     : Integer;
      purchaseOrderNumber: Integer;
      deliveryNoteNumber: Integer;
      documentDate: Date;
      deliveryDate: Date;
      Material: String;
      netAmount: Double;
      grossAmount: Double;
      taxAmount: Double;
      unitPrice: Double;
      taxId: String;
      taxRate: String;
      currencyCode: String;
      quantity: Double;
      unitOfMeasure: String;
      paymentTerms: String;
      receiverName: String;
      receiverAddress: String;
      receiverCity: String;
      Supplier: String;
      senderAddress: String;
      senderCity: String;
  };

  action storeEmbeddings(uuid : String) returns String;
  action deleteEmbeddings(fileName: String) returns String;
  action checkEmbeddingCompletion(uuid : String) returns String;
  //action storeDoxContent(id : String, doxContent: LargeString) returns String;
  action getExtractedInvoiceData(id : String) returns InvoiceData;
  action getExtractedContractData(id : String) returns ContractData;
  action postSchedulingAgreementToSap(contractData: String) returns String;
  action getPurchaseOrderDetailsFromSap(purchaseOrder: String) returns String;
}
