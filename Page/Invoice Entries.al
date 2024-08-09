page 50101 "Invoice Entries"
{
    ApplicationArea = All;
    Caption = 'Invoice Entries';
    PageType = List;
    SourceTable = "Invoice Entry Header";
    UsageCategory = Lists;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the EntryNo field.', Comment = '%';
                }
                field(SaleType; Rec.SaleType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SaleType field.', Comment = '%';
                }
                field(BrokerCode; Rec.BrokerCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BrokerCode field.', Comment = '%';
                }
                field(BrokerName; Rec.BrokerName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BrokerName field.', Comment = '%';
                }
                field(StoreCode; Rec.StoreCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the StoreCode field.', Comment = '%';
                }
                field(StoreName; Rec.StoreName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the StoreName field.', Comment = '%';
                }
            }
        }
    }
}
