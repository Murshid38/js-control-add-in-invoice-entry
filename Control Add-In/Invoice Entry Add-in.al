controladdin InvoiceEntryAddIn
{
    // RequestedHeight = 300;
    MinimumHeight = 600;
    MaximumHeight = 700;
    // RequestedWidth = 700;
    MinimumWidth = 1000;
    // MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    // HorizontalShrink = true;
    Scripts = 'Script/invoiceEntryScript1.js';
    // 'script2.js';
    StyleSheets = 'Stylesheet/InvoiceEntry.css';
    StartupScript = 'Script/startupScriptInvoiceEntry.js';
    // RecreateScript = 'recreateScript.js';
    // RefreshScript = 'refreshScript.js';
    // Images =
    //     'image1.png',
    //     'image2.png';

    event OnControlAddInReady()
    event EntrySubmission()

    procedure getSaleTypes(SaleType: Text)
    procedure getBroker(Vendor: Text)
    procedure getStores(Stores: Text)
    procedure setInvoiceEntrySubmission()
}