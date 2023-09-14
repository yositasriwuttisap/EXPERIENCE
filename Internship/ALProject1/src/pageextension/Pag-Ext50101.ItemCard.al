pageextension 50101 "Item Card" extends "Item Card"
{
    layout
    {
        addafter("Item Category Code")
        {
            field("Beer Origin"; rec."Beer Origin")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}