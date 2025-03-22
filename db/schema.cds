namespace rag.contracts.demo;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Conversation {

    key cID : UUID not null;
    userID: String;
    creation_time: Timestamp;
    last_update_time: Timestamp;
    title: String;
    to_messages: Composition of many Message on to_messages.cID = $self;
}

entity Message {

    key cID: Association to Conversation;
    key mID: UUID not null;
    role: String;
    content: LargeString;
    creation_time: Timestamp;
}

entity DocumentChunk
{
    text_chunk: LargeString;
    metadata_column: String;
    embedding: Vector(1536);
}


entity Files: cuid, managed{
    @Core.MediaType: mediaType @Core.ContentDisposition.Filename: fileName
    content: LargeBinary;
    @Core.IsMediaType: true
    mediaType: String;
    fileName: String;
    size: String;
    category: String;
}

entity ContractDoxContent {
    key id: UUID not null;
    content: LargeString;
    contract: String;
}

entity InvoiceDoxContent {
    key id: UUID not null;
    content: LargeString;
    invoice: String;
}

entity GRDoxContent {
    key id: UUID not null;
    content: LargeString;
    gr: String;
    purchaseorder: String;
}

entity POContent {
    key id: UUID not null;
    content: LargeString;
}
