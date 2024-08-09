page 50100 InvoiceEntry
{
    PageType = NavigatePage;
    // PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    // SourceTable = "Invoice Entry Header";
    Caption = 'Invoice Entry';


    layout
    {
        area(Content)
        {
            usercontrol(InvoiceEntryAddIn; InvoiceEntryAddIn)
            {
                ApplicationArea = All;

                trigger OnControlAddInReady()
                var
                begin
                    GetValuesFromBC();
                end;

                trigger EntrySubmission(Parameter: JsonObject)
                var
                    InvoiceEntryHeader: Record "Invoice Entry Header";
                    JsonTools: Codeunit JsonTools;
                begin
                    InvoiceEntryHeader.Init();
                    InvoiceEntryHeader := JsonTools.JSONToRec(Parameter, InvoiceEntryHeader);
                    InvoiceEntryHeader.EntryNo := GetLastInvoiceEntryNo() + 10000;
                    InvoiceEntryHeader.Insert();
                    Message('%1', Format(InvoiceEntryHeader));
                end;
            }
        }
    }

    local procedure GetValuesFromBC()
    var
        InvoiceEntryHeader: Record "Invoice Entry Header";
        VendorRec: Record Vendor;
        StoreRec: Record Location;
        VendorList: List of [Text];
        Vendor: Text;
        StoreList: List of [Text];
        Store: Text;
        SaleTypeEnum: Enum "Sale Type";
        SaleTypeList: List of [Text];
        SaleType: Text;
        VendorFromAddIn: Text;
    begin
        if VendorRec.FindSet() then
            repeat
                VendorList.Add(VendorRec."No." + ' - ' + VendorRec.Name);
            until VendorRec.Next() = 0;

        if StoreRec.FindSet() then
            repeat
                StoreList.Add(StoreRec."Code" + ' - ' + StoreRec.Name);
            until StoreRec.Next() = 0;

        SaleTypeList := InvoiceEntryHeader.SaleType.Names();

        foreach Vendor in VendorList do
            CurrPage.InvoiceEntryAddIn.getBroker(Vendor);

        foreach Store in StoreList do
            CurrPage.InvoiceEntryAddIn.getStores(Store);

        foreach SaleType in SaleTypeList do
            CurrPage.InvoiceEntryAddIn.getSaleTypes(SaleType);

        CurrPage.InvoiceEntryAddIn.setInvoiceEntrySubmission();
    end;

    local procedure GetLastInvoiceEntryNo(): Integer
    var
        InvoiceEntryHeader: Record "Invoice Entry Header";
    begin
        InvoiceEntryHeader.SetCurrentKey(EntryNo);
        if InvoiceEntryHeader.FindLast() then
            exit(InvoiceEntryHeader.EntryNo)
        else
            exit(0);
    end;
}