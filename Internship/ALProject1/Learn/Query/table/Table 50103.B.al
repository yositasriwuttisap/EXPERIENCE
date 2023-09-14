table 50103 B
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Oid; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; Dat; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(3; CUSTOMER_ID; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(4; AMOUNT; Integer)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; Oid)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    local procedure UpdateLastDateTimeModified()
    begin
        Dat := CurrentDateTime();
    end;


}