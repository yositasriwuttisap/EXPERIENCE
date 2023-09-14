page 50117 "Current"
{
    Caption = 'Current';
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Currency Exchange Rate";
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Current Code"; rec."Currency Code")
                {

                    ApplicationArea = All;
                }
                field("Starting Date"; rec."Starting Date")
                {
                    ApplicationArea = All;
                }
                field("Exchange Rate Amount"; rec."Exchange Rate Amount")
                {
                    ApplicationArea = All;
                }
                field("Adjustment Exch. Rate Amount"; rec."Adjustment Exch. Rate Amount")
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

            action(SyncBankOrExportItem)
            {
                ApplicationArea = All;
                Caption = 'SyncBankOfThailand';
                RunObject = page "Show Current Api";

                trigger OnAction()
                var
                    Setup: Codeunit "Click";
                begin
                    Setup.Connect();
                    // Commit();
                end;
            }

        }



    }




}