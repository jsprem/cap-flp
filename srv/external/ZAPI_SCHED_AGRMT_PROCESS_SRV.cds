/* checksum : 0a3a23ad8d1a802cc7c6ddba3005e51e */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZAPI_SCHED_AGRMT_PROCESS_SRV {};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Account Assignment'
entity ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchAgrmtAcCnt {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Account Assgmt No.'
  @sap.quickinfo : 'Sequential Number of Account Assignment'
  key AccountAssignmentNumber : String(2) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Item Number of Purchasing Document'
  key SchedulingAgreementItem : String(5) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Document'
  @sap.quickinfo : 'Purchasing Document Number'
  key SchedulingAgreement : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cost Center'
  CostCenter : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Asset'
  @sap.quickinfo : 'Main Asset Number'
  MasterFixedAsset : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Network'
  @sap.quickinfo : 'Network Number for Account Assignment'
  ProjectNetwork : String(12);
  @sap.label : 'Order Unit'
  @sap.quickinfo : 'Purchase Order Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  OrderQuantityUnit : String(3);
  @sap.unit : 'OrderQuantityUnit'
  @sap.label : 'Quantity'
  Quantity : Decimal(13, 3);
  @sap.label : 'Distribution (%)'
  @sap.quickinfo : 'Distribution percentage in the case of multiple acct assgt'
  MultipleAcctAssgmtDistrPercent : Decimal(3, 1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  DocumentCurrency : String(5);
  @sap.unit : 'DocumentCurrency'
  @sap.label : 'Net Order Value'
  @sap.quickinfo : 'Net Order Value in PO Currency'
  PurgDocNetAmount : Decimal(14, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Deletion Indicator'
  @sap.quickinfo : 'Deletion Indicator: Purchasing Document Account Assignment'
  IsDeleted : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'G/L Account'
  @sap.quickinfo : 'G/L Account Number'
  GLAccount : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business Area'
  BusinessArea : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'SD Document'
  @sap.quickinfo : 'Sales and Distribution Document Number'
  SalesOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Sales Document Item'
  SalesOrderItem : String(6);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Schedule Line Number'
  SalesOrderScheduleLine : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sub-number'
  @sap.quickinfo : 'Asset Subnumber'
  FixedAsset : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order'
  @sap.quickinfo : 'Order Number'
  OrderID : String(12);
  @sap.label : 'Unloading Point'
  UnloadingPointName : String(25);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Controlling Area'
  ControllingArea : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cost Object'
  CostObject : String(12);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Profitab. Segmt No.'
  @sap.quickinfo : 'Profitability Segment Number (CO-PA)'
  ProfitabilitySegment : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profit Center'
  ProfitCenter : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'WBS Element'
  @sap.quickinfo : 'Work Breakdown Structure Element (WBS Element)'
  WBSElement : String(24);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Opertn task list no.'
  @sap.quickinfo : 'Routing number of operations in the order'
  ProjectNetworkInternalID : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Commitment item'
  @sap.quickinfo : 'Commitment Item'
  CommitmentItem : String(24);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Funds Center'
  FundsCenter : String(16);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Functional Area'
  FunctionalArea : String(16);
  @sap.label : 'Goods Recipient'
  GoodsRecipientName : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Final Invoice'
  @sap.quickinfo : 'Final Invoice Indicator'
  IsFinallyInvoiced : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Real Estate Key'
  @sap.quickinfo : 'Internal Key for Real Estate Object'
  RealEstateObject : String(40);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Internal counter'
  NetworkActivityInternalID : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Partner'
  @sap.quickinfo : 'Partner account number'
  PartnerAccountNumber : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Recovery Indicator'
  JointVentureRecoveryCode : String(2);
  @sap.display.format : 'Date'
  @sap.label : 'Reference date'
  @sap.quickinfo : 'Reference date for settlement'
  SettlementReferenceDate : Date;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Opertn task list no.'
  @sap.quickinfo : 'Routing number of operations in the order'
  OrderInternalID : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Code'
  @sap.quickinfo : 'Tax on sales/purchases code'
  TaxCode : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Jurisdiction'
  TaxJurisdiction : String(15);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Activity Type'
  CostCtrActivityType : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business Process'
  BusinessProcess : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Grant'
  GrantID : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Budget Period'
  BudgetPeriod : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Earmarked Funds'
  @sap.quickinfo : 'Document Number for Earmarked Funds'
  EarmarkedFundsDocument : String(10);
  @sap.display.format : 'Date'
  ValidityDate : Date;
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Purchase Scheduling Agreement'
entity ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchAgrmtHeader {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Document'
  @sap.quickinfo : 'Purchasing Document Number'
  key SchedulingAgreement : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Company Code'
  CompanyCode : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purch. Doc. Category'
  @sap.quickinfo : 'Purchasing Document Category'
  PurchasingDocumentCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Doc. Type'
  @sap.quickinfo : 'Purchasing Document Type'
  PurchasingDocumentType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'User of person who created a purchasing document'
  CreatedByUser : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Created On'
  @sap.quickinfo : 'Creation Date of Purchasing Document'
  CreationDate : Date;
  @sap.label : 'Language Key'
  Language : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purch. Organization'
  @sap.quickinfo : 'Purchasing Organization'
  PurchasingOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Group'
  PurchasingGroup : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  DocumentCurrency : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Incoterms'
  @sap.quickinfo : 'Incoterms (Part 1)'
  IncotermsClassification : String(3);
  @sap.label : 'Incoterms (Part 2)'
  IncotermsTransferLocation : String(28);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Payment Terms'
  @sap.quickinfo : 'Terms of Payment Key'
  PaymentTerms : String(4);
  @sap.label : 'Days 1'
  @sap.quickinfo : 'Cash discount days 1'
  CashDiscount1Days : Decimal(3, 0);
  @sap.label : 'Days 2'
  @sap.quickinfo : 'Cash discount days 2'
  CashDiscount2Days : Decimal(3, 0);
  @sap.label : 'CD Percentage 1'
  @sap.quickinfo : 'Cash Discount Percentage 1'
  CashDiscount1Percent : Decimal(5, 3);
  @sap.label : 'CD Percentage 2'
  @sap.quickinfo : 'Cash Discount Percentage 2'
  CashDiscount2Percent : Decimal(5, 3);
  @sap.label : 'Days Net'
  @sap.quickinfo : 'Net Payment Terms Period'
  NetPaymentDays : Decimal(3, 0);
  @sap.unit : 'DocumentCurrency'
  @sap.label : 'Target Value'
  @sap.quickinfo : 'Target Value for Header Area per Distribution'
  TargetAmount : Decimal(16, 3);
  ExchangeRate : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fixed Exchange Rate'
  @sap.quickinfo : 'Indicator for Fixed Exchange Rate'
  ExchangeRateIsFixed : Boolean;
  @sap.label : 'Incoterms Location 1'
  IncotermsLocation1 : String(70);
  @sap.label : 'Incoterms Location 2'
  IncotermsLocation2 : String(70);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Incoterms Version'
  IncotermsVersion : String(4);
  @sap.label : 'Incoterm Loc. 1 ID'
  @sap.quickinfo : 'Identifier for Incoterm Location 1'
  IncotermsLocation1Identifier : String(20);
  @sap.label : 'Incoterm Location 1'
  @sap.quickinfo : 'Incoterm Location 1 - Place of Destination'
  IncotermsSupChnLoc1AddlUUID : UUID;
  @sap.label : 'Incoterm Loc. 2 ID'
  @sap.quickinfo : 'Identifier for Incoterm Location 2'
  IncotermsLocation2Identifier : String(20);
  @sap.label : 'Incoterm Location 2'
  @sap.quickinfo : 'Incoterm Location 2 - Place of Delivery'
  IncotermsSupChnLoc2AddlUUID : UUID;
  @sap.label : 'Dev. Destination'
  @sap.quickinfo : 'Incoterm - Deviating Place of Destination'
  IncotermsSupChnDvtgLocAddlUUID : UUID;
  @sap.display.format : 'Date'
  @sap.label : 'Document Date'
  @sap.quickinfo : 'Purchasing Document Date'
  PurchasingDocumentOrderDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Rel. documentation'
  @sap.quickinfo : 'Indicator for scheduling agreement release documentation'
  ScheduleAgreementHasReleaseDoc : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Supplier'
  Supplier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Address Number'
  SupplierAddressID : String(10);
  @sap.display.format : 'Date'
  @sap.label : 'Validity Per. Start'
  @sap.quickinfo : 'Start of Validity Period'
  ValidityStartDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Validity Period End'
  @sap.quickinfo : 'End of Validity Period'
  ValidityEndDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Status'
  @sap.quickinfo : 'Status of Purchasing Document'
  PurchasingDocumentOrigin : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Deletion Indicator'
  @sap.quickinfo : 'Deletion Indicator in Purchasing Document'
  PurchasingDocumentDeletionCode : String(1);
  @sap.display.format : 'Date'
  @sap.label : 'Quotation Date'
  @sap.quickinfo : 'Quotation Submission Date'
  QuotationSubmissionDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Quotation'
  @sap.quickinfo : 'Quotation Number'
  SupplierQuotationExternalID : String(10);
  @sap.label : 'Salesperson'
  @sap.quickinfo : 'Responsible Salesperson at Supplier''s Office'
  SupplierRespSalesPersonName : String(30);
  @sap.label : 'Supplier Phone'
  @sap.quickinfo : 'Supplier''s Phone Number'
  SupplierPhoneNumber : String(16);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Invoicing Party'
  @sap.quickinfo : 'Different Invoicing Party'
  InvoicingParty : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Goods Supplier'
  SupplyingSupplier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'VAT Registration No.'
  @sap.quickinfo : 'VAT Registration Number'
  CompanyVATRegistration : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ctry/Rgn Sls Tax No.'
  @sap.quickinfo : 'Country/Region of Sales Tax ID Number'
  VATRegistrationCountry : String(3);
  SchedulingAgreementStatus : String(2);
  to_SchAgrmtPartner : Composition of many ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchAgrmtPartner {  };
  to_SchedgAgrmtHdrNotes : Composition of many ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchedgAgrmtHdrNotes {  };
  to_SchedgAgrmtItm : Composition of many ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchAgrmtItem {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Item'
entity ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchAgrmtItem {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Document'
  @sap.quickinfo : 'Purchasing Document Number'
  key SchedulingAgreement : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Item Number of Purchasing Document'
  key SchedulingAgreementItem : String(5) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Company Code'
  CompanyCode : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purch. Doc. Category'
  @sap.quickinfo : 'Purchasing Document Category'
  PurchasingDocumentCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Item Category'
  @sap.quickinfo : 'Item category in purchasing document'
  PurchasingDocumentItemCategory : String(1);
  @sap.label : 'Short Text'
  PurchasingDocumentItemText : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  Material : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material number'
  ManufacturerMaterial : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Supplier Mat. No.'
  @sap.quickinfo : 'Material Number Used by Supplier'
  SupplierMaterialNumber : String(35);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group'
  MaterialGroup : String(9);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  Plant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Address'
  @sap.quickinfo : 'Number of delivery address'
  ReferenceDeliveryAddressID : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Incoterms'
  @sap.quickinfo : 'Incoterms (Part 1)'
  IncotermsClassification : String(3);
  @sap.label : 'Incoterms (Part 2)'
  IncotermsTransferLocation : String(28);
  @sap.label : 'Incoterms Location 1'
  IncotermsLocation1 : String(70);
  @sap.label : 'Incoterms Location 2'
  IncotermsLocation2 : String(70);
  @sap.label : 'Incoterm Loc. 1 ID'
  @sap.quickinfo : 'Identifier for Incoterm Location 1'
  IncotermsLocation1Identifier : String(20);
  @sap.label : 'Incoterm Location 1'
  @sap.quickinfo : 'Incoterm Location 1 - Place of Destination'
  IncotermsSupChnLoc1AddlUUID : UUID;
  @sap.label : 'Incoterm Loc. 2 ID'
  @sap.quickinfo : 'Identifier for Incoterm Location 2'
  IncotermsLocation2Identifier : String(20);
  @sap.label : 'Incoterm Location 2'
  @sap.quickinfo : 'Incoterm Location 2 - Place of Delivery'
  IncotermsSupChnLoc2AddlUUID : UUID;
  @sap.label : 'Dev. Destination'
  @sap.quickinfo : 'Incoterm - Deviating Place of Destination'
  IncotermsSupChnDvtgLocAddlUUID : UUID;
  @sap.label : 'Order Unit'
  @sap.quickinfo : 'Purchase Order Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  OrderQuantityUnit : String(3);
  @sap.unit : 'OrderQuantityUnit'
  @sap.label : 'Target Quantity'
  TargetQuantity : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchase Requisition'
  @sap.quickinfo : 'Purchase Requisition Number'
  PurchaseRequisition : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item of requisition'
  @sap.quickinfo : 'Item number of purchase requisition'
  PurchaseRequisitionItem : String(5);
  @sap.unit : 'OrderQuantityUnit'
  @sap.label : 'Agr. Cumulative Qty'
  @sap.quickinfo : 'Agreed Cumulative Quantity'
  SchedAgrmtAgreedCumQty : Decimal(13, 3);
  @sap.display.format : 'Date'
  @sap.label : 'Reconciliation Date'
  @sap.quickinfo : 'Reconciliation date for agreed cumulative quantity'
  SchedAgrmtCumQtyReconcileDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Last Transm.'
  @sap.quickinfo : 'Last Transmission'
  ItemLastTransmissionDate : Date;
  @sap.label : '1st Reminder/Exped.'
  @sap.quickinfo : 'Number of Days for First Reminder/Expediter'
  NoDaysReminder1 : Decimal(3, 0);
  @sap.label : '2nd Reminder/Exped.'
  @sap.quickinfo : 'Number of Days for Second Reminder/Expediter'
  NoDaysReminder2 : Decimal(3, 0);
  @sap.label : '3rd Reminder/Exped.'
  @sap.quickinfo : 'Number of Days for Third Reminder/Expediter'
  NoDaysReminder3 : Decimal(3, 0);
  @sap.label : 'Order Acknowledgment'
  @sap.quickinfo : 'Order Acknowledgment Number'
  PurgDocOrderAcknNumber : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Req. Tracking Number'
  @sap.quickinfo : 'Requirement Tracking Number'
  RequirementTracking : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Acknowledgment Reqd.'
  @sap.quickinfo : 'Order Acknowledgment Requirement'
  IsOrderAcknRqd : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Estimated Price'
  @sap.quickinfo : 'Indicator: Estimated Price'
  PurgDocEstimatedPrice : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Print Price'
  @sap.quickinfo : 'Price Printout'
  PriceIsToBePrinted : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Acct Assignment Cat.'
  @sap.quickinfo : 'Account Assignment Category'
  AccountAssignmentCategory : String(1);
  MultipleAcctAssgmtDistribution : String(1);
  PartialInvoiceDistribution : String(1);
  @sap.unit : 'DocumentCurrency'
  @sap.label : 'Net Order Price'
  @sap.quickinfo : 'Net Price in Purchasing Document (in Document Currency)'
  NetPriceAmount : Decimal(12, 3);
  @sap.unit : 'OrderPriceUnit'
  @sap.label : 'Price Unit'
  NetPriceQuantity : Decimal(5, 0);
  @sap.label : 'Order Price Unit'
  @sap.quickinfo : 'Order Price Unit (Purchasing)'
  @sap.semantics : 'unit-of-measure'
  OrderPriceUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Type Group'
  ProductType : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Type'
  MaterialType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Location'
  StorageLocation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  DocumentCurrency : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Info Record Update'
  @sap.quickinfo : 'Indicator: Update Info Record'
  IsInfoRecordUpdated : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing info rec.'
  @sap.quickinfo : 'Number of purchasing info record'
  PurchasingInfoRecord : String(10);
  @sap.label : 'Quantity Conversion'
  @sap.quickinfo : 'Denominator for Conv. of Order Price Unit into Order Unit'
  OrdPriceUnitToOrderUnitDnmntr : Decimal(5, 0);
  @sap.label : 'Quantity Conversion'
  @sap.quickinfo : 'Numerator for Conversion of Order Price Unit into Order Unit'
  OrderPriceUnitToOrderUnitNmrtr : Decimal(5, 0);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Deletion Indicator'
  @sap.quickinfo : 'Deletion Indicator in Purchasing Document'
  PurchasingDocumentDeletionCode : String(1);
  @sap.label : 'Underdel. Tolerance'
  @sap.quickinfo : 'Underdelivery Tolerance'
  UnderdelivTolrtdLmtRatioInPct : Decimal(3, 1);
  @sap.label : 'Overdeliv. Tolerance'
  @sap.quickinfo : 'Overdelivery Tolerance'
  OverdelivTolrtdLmtRatioInPct : Decimal(3, 1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Unltd Overdelivery'
  @sap.quickinfo : 'Unlimited Overdelivery Allowed'
  UnlimitedOverdeliveryIsAllowed : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stock Type'
  StockType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Code'
  @sap.quickinfo : 'Tax on sales/purchases code'
  TaxCode : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Ctry/Reg.'
  @sap.quickinfo : 'Tax Reporting Country/Region'
  TaxCountry : String(3);
  @sap.display.format : 'Date'
  @sap.label : 'Tax Date'
  @sap.quickinfo : 'Date for Determining Tax Rates'
  TaxDeterminationDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Shipping Instr.'
  @sap.quickinfo : 'Shipping Instructions'
  ShippingInstruction : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Info at Registration'
  @sap.quickinfo : 'Indicator: Action at Registration'
  IsInfoAtRegistration : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Goods Receipt'
  @sap.quickinfo : 'Goods Receipt Indicator'
  GoodsReceiptIsExpected : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'GR non-valuated'
  @sap.quickinfo : 'Goods Receipt, Non-Valuated'
  GoodsReceiptIsNonValuated : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Invoice Receipt'
  @sap.quickinfo : 'Invoice Receipt Indicator'
  InvoiceIsExpected : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'GR-Based Inv. Verif.'
  @sap.quickinfo : 'Indicator: GR-Based Invoice Verification'
  InvoiceIsGoodsReceiptBased : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Eval. Receipt Sett.'
  @sap.quickinfo : 'Evaluated Receipt Settlement (ERS)'
  EvaldRcptSettlmtIsAllowed : Boolean;
  @sap.label : 'Min. Rem. Shelf Life'
  @sap.quickinfo : 'Minimum Remaining Shelf Life'
  MinRemainingShelfLife : Decimal(4, 0);
  @sap.display.format : 'UpperCase'
  @sap.label : 'QM Control Key'
  @sap.quickinfo : 'Control Key for Quality Management in Procurement'
  QualityMgmtCtrlKey : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Certificate Type'
  QualityCertificateType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Control Type'
  @sap.quickinfo : 'CQ Control Type'
  SchedAgrmtCumulativeQtyControl : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'No CQ Transmission'
  @sap.quickinfo : 'No Transmission of Cumulative Quantities in SA Release'
  CumulativeQuantityIsNotSent : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Creation Profile'
  @sap.quickinfo : 'Release Creation Profile'
  SchedgAgrmtRelCreationProfile : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'JIT Delivery'
  @sap.quickinfo : 'JIT Delivery Schedules'
  IsRelevantForJITDelivSchedule : String(1);
  @sap.display.format : 'Date'
  @sap.label : 'Next FRC Sched.'
  @sap.quickinfo : 'Next Forecast Delivery Schedule Transmission'
  NextFcstDelivSchedSendingDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Next JIT Sched.'
  @sap.quickinfo : 'Next JIT Delivery Schedule Transmission'
  NextJITDelivSchedSendingDate : Date;
  @sap.label : 'Firm Zone'
  @sap.quickinfo : 'Firm Zone (Go-Ahead for Production)'
  ScheduleLineFirmOrderInDays : Decimal(3, 0);
  @sap.label : 'Trade-Off Zone'
  @sap.quickinfo : 'Trade-Off Zone (Go-Ahead for Materials Procurement)'
  SchedLineSemiFirmOrderInDays : Decimal(3, 0);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Binding on MRP'
  @sap.quickinfo : 'Firm/Trade-Off Zones Binding with Regard to Mat. Planning'
  FirmTradeOffZoneBindMRP : String(1);
  to_SchAgrmtAcCnt : Composition of many ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchAgrmtAcCnt {  };
  to_SchAgrmtSchLine : Composition of many ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchAgrmtSchLine {  };
  to_SchedgAgrmtDeliveryAddress : Composition of ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchedgAgrmtDeliveryAddress {  };
  to_SchedgAgrmtItmNotes : Composition of many ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchedgAgrmtItmNotes {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Partner'
entity ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchAgrmtPartner {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Document'
  @sap.quickinfo : 'Purchasing Document Number'
  key SchedulingAgreement : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Item Number of Purchasing Document'
  key SchedulingAgreementItem : String(5) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purch. Organization'
  @sap.quickinfo : 'Purchasing Organization'
  key PurchasingOrganization : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Supplier Subrange'
  key SupplierSubrange : String(6) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Partner Function'
  key PartnerFunction : String(2) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Partner counter'
  key PartnerCounter : String(3) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Supplier'
  @sap.quickinfo : 'Account Number of Supplier'
  Supplier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Default Partner'
  DefaultPartner : Boolean;
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
@sap.label : 'Schedule Line'
entity ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchAgrmtSchLine {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Document'
  @sap.quickinfo : 'Purchasing Document Number'
  key SchedulingAgreement : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Item Number of Purchasing Document'
  key SchedulingAgreementItem : String(5) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Schedule Line'
  @sap.quickinfo : 'Delivery Schedule Line Counter'
  key ScheduleLine : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Deliv. date category'
  @sap.quickinfo : 'Category of delivery date'
  DelivDateCategory : String(1);
  @sap.display.format : 'Date'
  @sap.label : 'Delivery Date'
  @sap.quickinfo : 'Item Delivery Date'
  ScheduleLineDeliveryDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Stat.-Rel. Del. Date'
  @sap.quickinfo : 'Statistics-Relevant Delivery Date'
  SchedLineStscDeliveryDate : Date;
  @sap.label : 'Time'
  @sap.quickinfo : 'Delivery Date Time-Spot'
  ScheduleLineDeliveryTime : Time;
  @sap.label : 'Order Unit'
  @sap.quickinfo : 'Purchase Order Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  OrderQuantityUnit : String(3);
  @sap.unit : 'OrderQuantityUnit'
  @sap.label : 'Scheduled Quantity'
  ScheduleLineOrderQuantity : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchase Requisition'
  @sap.quickinfo : 'Purchase Requisition Number'
  PurchaseRequisition : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item of requisition'
  @sap.quickinfo : 'Item number of purchase requisition'
  PurchaseRequisitionItem : String(5);
  @sap.unit : 'OrderQuantityUnit'
  @sap.label : 'Quantity Delivered'
  @sap.quickinfo : 'Quantity of Goods Received'
  RoughGoodsReceiptQty : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fixing Indicator'
  @sap.quickinfo : 'Schedule Line is &quot;Fixed&quot;'
  ScheduleLineIsFixed : Boolean;
  @sap.label : 'No. Rem./Expediters'
  @sap.quickinfo : 'No. of Reminders/Expediters for Schedule Line'
  NoOfRemindersOfScheduleLine : Decimal(3, 0);
  @sap.unit : 'OrderQuantityUnit'
  @sap.label : 'Previous Quantity'
  @sap.quickinfo : 'Previous Quantity (Delivery Schedule Lines)'
  PrevDelivQtyOfScheduleLine : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Creation indicator'
  @sap.quickinfo : 'Creation indicator (purchase requisition/schedule lines)'
  SourceOfCreation : String(1);
  to_SchedgAgrmtSubcontrgCompTP : Composition of many ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchedgAgrmtSubcontrgComp {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Delivery Address'
entity ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchedgAgrmtDeliveryAddress {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Document'
  @sap.quickinfo : 'Purchasing Document Number'
  key SchedulingAgreement : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Item Number of Purchasing Document'
  key SchedulingAgreementItem : String(5) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Address'
  @sap.quickinfo : 'Manual address number in purchasing document item'
  DeliveryAddressID : String(10);
  AddressType : String(1);
  PurchasingDeliveryAddressType : String(1);
  @sap.label : 'Full Name'
  @sap.quickinfo : 'Full name of a party (Bus. Partner, Org. Unit, Doc. address)'
  FullName : String(80);
  @sap.label : 'Street'
  StreetName : String(60);
  @sap.label : 'House Number'
  HouseNumber : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Postal Code'
  @sap.quickinfo : 'City postal code'
  PostalCode : String(10);
  @sap.label : 'City'
  CityName : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Telephone'
  @sap.quickinfo : 'Telephone No.: Dialing Code and Number'
  MobileNumber : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Region'
  @sap.quickinfo : 'Region (State, Province, County)'
  Region : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Country/Region Key'
  Country : String(3);
  @sap.label : 'E-Mail Address'
  EmailAddress : String(241);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  Plant : String(4);
  @sap.label : 'Language Key'
  CorrespondenceLanguage : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Telephone'
  @sap.quickinfo : 'Telephone No.: Dialing Code and Number'
  PhoneNumber : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fax'
  @sap.quickinfo : 'First Fax No.: Area Code + Number'
  FaxNumber : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fax'
  @sap.quickinfo : 'First Fax No.: Area Code + Number'
  AddressFaxNumber : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
@sap.label : 'Header Notes'
entity ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchedgAgrmtHdrNotes {
  @sap.label : 'Language Key'
  key Language : String(2) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Text ID'
  key DocumentText : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Text object'
  @sap.quickinfo : 'Texts: application object'
  key TechnicalObjectType : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Text Name'
  @sap.quickinfo : 'Name'
  key ArchObjectNumber : String(70) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Document'
  @sap.quickinfo : 'Purchasing Document Number'
  key SchedulingAgreement : String(10) not null;
  @sap.label : 'Long Text'
  NoteDescription : LargeString;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fixing'
  @sap.quickinfo : '&quot;Fixed&quot; Indicator for Texts'
  FixedIndicator : String(1);
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
@sap.label : 'Item Notes'
entity ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchedgAgrmtItmNotes {
  @sap.label : 'Language Key'
  key Language : String(2) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Text ID'
  key DocumentText : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Text object'
  @sap.quickinfo : 'Texts: application object'
  key TechnicalObjectType : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Text Name'
  @sap.quickinfo : 'Name'
  key ArchObjectNumber : String(70) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Document'
  @sap.quickinfo : 'Purchasing Document Number'
  SchedulingAgreement : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item'
  @sap.quickinfo : 'Item Number of Purchasing Document'
  SchedulingAgreementItem : String(5);
  @sap.label : 'Long Text'
  NoteDescription : LargeString;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fixing'
  @sap.quickinfo : '&quot;Fixed&quot; Indicator for Texts'
  FixedIndicator : String(1);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.content.version : '1'
@sap.label : 'Subcontracting Components'
entity ZAPI_SCHED_AGRMT_PROCESS_SRV.A_SchedgAgrmtSubcontrgComp {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Document'
  key SchedulingAgreement : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Purchasing Document Item'
  key SchedulingAgreementItem : String(5) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Schedule Line'
  @sap.quickinfo : 'Delivery Schedule Line Counter'
  key ScheduleLine : String(4) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Reservation Item'
  key ReservationItem : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Reservation Record Type'
  key RecordType : String(1) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Reservation'
  @sap.quickinfo : 'Number of reservation/dependent requirements'
  Reservation : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  Material : String(40);
  @sap.display.format : 'Date'
  @sap.label : 'Requirement Date'
  @sap.quickinfo : 'Material Component Requirement Date'
  RequirementDate : Date;
  @sap.label : 'Requirement Time'
  @sap.quickinfo : 'Material Component Requirement Time'
  RequirementTime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  Plant : String(4);
  @sap.unit : 'EntryUnit'
  @sap.label : 'Quantity in Unit of Entry'
  QuantityInEntryUnit : Decimal(13, 3);
  @sap.label : 'Unit of Entry'
  @sap.quickinfo : 'Unit of entry'
  @sap.semantics : 'unit-of-measure'
  EntryUnit : String(3);
};

@cds.external : true
type ZAPI_SCHED_AGRMT_PROCESS_SRV.ActionResponse {
  @sap.label : 'Response'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Response : String(120) not null;
};

@cds.external : true
action ZAPI_SCHED_AGRMT_PROCESS_SRV.WithdrawFromApproval(
  @sap.label : 'SchedulingAgreement'
  SchedulingAgreement : String(10)
) returns ZAPI_SCHED_AGRMT_PROCESS_SRV.ActionResponse;

@cds.external : true
action ZAPI_SCHED_AGRMT_PROCESS_SRV.HeaderRelease(
  @sap.label : 'Schediling Agreement Release Date'
  SchedgAgreementStandardRelDate : String(1),
  @sap.label : 'Scope of Selection'
  SchedgAgreementSelectionScope : String(1),
  @sap.label : 'Deactivate Jit Dynamic Stopping'
  SchedgAgreementOffJitDynStop : Boolean,
  @sap.label : 'Deactivate Forecast Dynamic Stopping'
  SchedgAgreementOffFrcDynStop : Boolean,
  @sap.label : 'Move Release Creation Date'
  SchedgAgreementMoveCreateDate : String(2),
  @sap.label : 'Deactivate Jit Tolerance Check'
  SchedgAgreementdeactJitTolChck : Boolean,
  @sap.label : 'Deactivate Forecast Tolearance Check'
  SchedgAgreementDeactFrcTolChck : Boolean,
  @sap.label : 'Create without Schedule Line'
  SchedgAgreementCreateWoutSline : Boolean,
  @sap.label : 'Jit Only'
  SchedgAgreementCreateJitOnly : Boolean,
  @sap.label : 'Forecast Only'
  SchedgAgreementCreateFrcOnly : Boolean,
  @sap.label : 'Forecast And Jit Schedule'
  SchedgAgreementCreateFrcAndJit : Boolean,
  @sap.label : 'Scheduling Agreement Forecast Release Strategy Profile'
  SchedgAgreementWithFrcProfile : Boolean,
  @sap.label : 'Scheduling Agreement Jit Release Strategy Profile'
  SchedgAgreementWithJitProfile : Boolean,
  @sap.label : 'Scheduling Agreement'
  SchedulingAgreement : String(10)
) returns ZAPI_SCHED_AGRMT_PROCESS_SRV.ActionResponse;

@cds.external : true
action ZAPI_SCHED_AGRMT_PROCESS_SRV.ItemRelease(
  @sap.label : 'Scheduling Agreement Release Type'
  SchedulingAgreementReleaseType : String(1),
  @sap.label : 'Scheduling Agreement Item'
  SchedulingAgreementItem : String(5),
  @sap.label : 'Scheduling Agreement'
  SchedulingAgreement : String(10)
) returns ZAPI_SCHED_AGRMT_PROCESS_SRV.ActionResponse;

