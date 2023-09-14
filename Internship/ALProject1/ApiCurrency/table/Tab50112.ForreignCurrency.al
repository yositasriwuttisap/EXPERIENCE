table 50112 "Furreign Currency"
{
    Caption = 'Furreign Currency';
    DataClassification = CustomerContent;

    fields
    {
        field(20; "period"; date)
        {
            Caption = 'period';
            DataClassification = CustomerContent;
        }
        field(30; "currency_id"; Text[100])
        {
            Caption = 'currency_id';
            DataClassification = CustomerContent;
        }
        field(40; "buying_sight"; Text[100])
        {
            Caption = 'buying_sight';
            DataClassification = CustomerContent;
        }
        field(50; "buying_transfer"; Text[100])
        {
            Caption = 'buying_transfer';
            DataClassification = CustomerContent;
        }
        field(60; "selling"; Text[100])
        {
            Caption = 'selling';
            DataClassification = CustomerContent;
        }
        field(70; "mid_rate"; Decimal)
        {
            Caption = 'mid_rate';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "period", "currency_id")
        {
            Clustered = true;
        }
    }

}