page 50106 PageListB
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = B;

    layout
    {
        area(Content)
        {
            repeater(Input)
            {
                Caption = 'ItemB';
                field(Oid; Rec.Oid)
                {
                    ApplicationArea = All;

                }
                field(Dat; Rec.Dat)
                {
                    ApplicationArea = All;

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