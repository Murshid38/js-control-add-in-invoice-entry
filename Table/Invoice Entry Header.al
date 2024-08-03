table 50100 "Invoice Entry Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; Broker; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Sale Type"; Enum "Sale Type")
        {
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