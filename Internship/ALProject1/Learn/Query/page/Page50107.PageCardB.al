page 50107 PageCardB
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //RefreshOnActivate = true;
    SourceTable = B;
    Editable = true;

    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(Item)
            {
                Caption = 'Item';
                field("No."; Rec."Oid")
                {
                    ApplicationArea = All;
                    //Importance = Standard;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';

                }
                field(Description; Rec.CUSTOMER_ID)
                {
                    ApplicationArea = All;
                    //ShowMandatory = true;
                    ToolTip = 'Specifies a description of the item.';
                    AboutTitle = 'Describe the product or service';
                    AboutText = 'This appears on the documents you create when buying or selling this item. You can create Extended Texts with additional item description available to insert in the document lines.';

                }


            }
            group(PageCardB)
            {
                field(OID; Rec.OID)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Standard;
                    trigger OnValidate()
                    begin

                    end;

                }
                field(CUSTOMER_ID; Rec.CUSTOMER_ID)
                {
                    ApplicationArea = All;

                }
                field(AMOUNT; Rec.AMOUNT)
                {
                    ApplicationArea = All;

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