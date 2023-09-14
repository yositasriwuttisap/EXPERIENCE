page 50102 CustomersPB
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Cust. Ledger Entry";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                    Caption = 'Ent&ry';

                }

                field("Customer Posting Group"; Rec."Customer Posting Group")
                {

                    ApplicationArea = all;
                }

                field("Document Type"; Rec."Document Type")
                {

                    ApplicationArea = all;
                }

                field("Customer Name"; Rec."Customer Name")
                {

                    ApplicationArea = all;
                }

                field("Amount (LCY)"; Rec."Amount (LCY)")
                {

                    ApplicationArea = all;
                }


            }
        }
        area(Factboxes)
        {


        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}