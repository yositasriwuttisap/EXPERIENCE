page 50114 "UpdBank Best Sellers Theme"
{
    Caption = 'UpdBank Best Sellers Theme';
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Bank Best Sellers Theme";
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("date"; rec.Date)
                {
                    ApplicationArea = All;
                }
                field("Description"; rec.HolidayDescription)
                {
                    ApplicationArea = All;
                }

            }
        }
    }
    actions
    {


        area(Processing)
        {
            action(SyncBank)
            {
                ApplicationArea = All;
                Caption = 'confirmeBank';
                // Adds an action on the Actions menu of the action bar that opens the page Customer Ledger Entries. 
                // RunObject = page "Base Calendar Changes";
                // Promoted = true;
                trigger OnAction()
                var
                    ApiMgt: Codeunit "Copy Bank Management";

                begin
                    ApiMgt.confirme();

                end;
            }

        }

    }

}