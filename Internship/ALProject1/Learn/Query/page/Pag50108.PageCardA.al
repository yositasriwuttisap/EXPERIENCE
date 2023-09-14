page 50108 PageCardA
{
    PageType = Card;
    RefreshOnActivate = true;
    UsageCategory = Administration;
    SourceTable = A;
    Editable = true;

    layout
    {
        area(Content)
        {
            group(Item)
            {
                Caption = 'Item';
                field("No."; Rec."id")
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';

                }
                field(Description; Rec.Name)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies a description of the item.';
                    AboutTitle = 'Describe the product or service';
                    AboutText = 'This appears on the documents you create when buying or selling this item. You can create Extended Texts with additional item description available to insert in the document lines.';

                }


            }
            group(PageCardB)
            {
                field(OID; Rec.ID)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Standard;

                }
                field(CUSTOMER_ID; Rec.Name)
                {
                    ApplicationArea = All;

                }
                field(AMOUNT; Rec.Address)
                {
                    ApplicationArea = All;

                }
                field(Type; Rec.Age)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if the item card represents a physical inventory unit (Inventory), a labor time unit (Service), or a physical unit that is not tracked in inventory (Non-Inventory).';


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
