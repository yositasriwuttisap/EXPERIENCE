page 50115 "Show Current Api"
{
    Caption = 'Show Current Api';
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Furreign Currency";
    // SourceTable = "Current API Setup";
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("period"; rec.period)
                {
                    ApplicationArea = All;
                }
                field("currency_id"; rec.currency_id)
                {
                    ApplicationArea = All;
                }
                field("buying_sight"; rec.buying_sight)
                {
                    ApplicationArea = All;
                }
                field("buying_transfer"; rec."buying_transfer")
                {
                    ApplicationArea = All;
                }
                field("selling"; rec."selling")
                {
                    ApplicationArea = All;
                }
                field("mid_rate"; rec.mid_rate)
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
                Caption = 'ConfirmApiBOT';
                // RunObject = page "Show Current Api";
                // Promoted = true;
                trigger OnAction()
                var
                    Setup: Codeunit "Click";
                begin
                    Setup.confirme();
                    // Commit();
                end;
            }

        }



    }




}