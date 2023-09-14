table 50111 "Rates of Exchange"
{
    Caption = 'Rates of Exchange';
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(20; "api"; Text[100])
        {
            Caption = 'api';
            DataClassification = CustomerContent;
        }
        field(30; "report_name_eng"; Text[100])
        {
            Caption = 'report_name_eng';
            DataClassification = CustomerContent;
        }
        field(40; "rate"; Text[100])
        {
            Caption = 'rate';
            DataClassification = CustomerContent;
        }
        field(50; "last_updated"; Date)
        {
            Caption = 'Date';
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