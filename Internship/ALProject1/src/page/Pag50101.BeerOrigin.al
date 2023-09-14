page 50101 "Beer Origin"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Beer Origin";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }

                field("Last Modified Date Time"; Rec."Last Modified Date Time")
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
            action(SyncBank)
            {
                ApplicationArea = All;
                Caption = 'SyncBank';

                trigger OnAction()
                var
                    NYTApiMgt: Codeunit "Bank Management";
                begin
                    NYTApiMgt.CallWebService();
                    CurrPage.Update(false);
                end;
            }

        }
    }
}