table 50101 "Beer Origin"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[10])
        {
            DataClassification = ToBeClassified;

        }

        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Last Modified Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        UpdateLastDateTimeModified
    end;

    trigger OnModify()
    begin
        UpdateLastDateTimeModified
    end;

    trigger OnRename()
    begin
        UpdateLastDateTimeModified
    end;


    local procedure UpdateLastDateTimeModified()
    begin
        "Last Modified Date Time" := CurrentDateTime();
    end;

}