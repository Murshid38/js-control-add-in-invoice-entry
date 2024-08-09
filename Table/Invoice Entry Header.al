table 50100 "Invoice Entry Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EntryNo; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(2; SaleType; Enum "Sale Type")
        {
            Caption = 'Sale Type';
            DataClassification = ToBeClassified;
        }
        field(3; BrokerCode; Code[20])
        {
            Caption = 'Broker Code';
            DataClassification = ToBeClassified;
        }
        field(4; BrokerName; Text[100])
        {
            Caption = 'Broker Name';
            DataClassification = ToBeClassified;
        }
        field(5; StoreCode; Code[20])
        {
            Caption = 'Store Code';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(6; StoreName; Text[100])
        {
            Caption = 'Store Name';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; EntryNo)
        {
            Clustered = true;
        }
    }
}