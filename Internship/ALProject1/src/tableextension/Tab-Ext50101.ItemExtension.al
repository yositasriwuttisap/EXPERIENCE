tableextension 50101 "Item Extension" extends "Item"
{
    fields
    {
        field(50000; "Beer Origin"; Code[10])
        {
            TableRelation = "Beer Origin".Code;
        }
    }

    var
        myInt: Integer;
}