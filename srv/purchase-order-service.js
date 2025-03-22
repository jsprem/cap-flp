const cds = require('@sap/cds');

module.exports = async (srv) => 
{        
    // Using CDS API      
    const purchaseOrderService = await cds.connect.to("ZAPI_PURCHASEORDER_PROCESS_SRV"); 
    srv.on('READ', 'A_PurchaseOrder', req => purchaseOrderService.run(req.query)); 
    srv.on('READ', 'A_PurchaseOrderItem', req => purchaseOrderService.run(req.query)); 
}