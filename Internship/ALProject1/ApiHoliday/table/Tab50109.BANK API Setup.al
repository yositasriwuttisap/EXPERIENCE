table 50109 "BANK API Setup"
{
    Caption = 'BANK OF THAILAND New York Times API Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(20; "Base URL"; Text[100])
        {
            Caption = 'Base URL';
            DataClassification = CustomerContent;
        }
        field(30; "UserID"; Text[100])
        {
            Caption = 'UserID';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

}