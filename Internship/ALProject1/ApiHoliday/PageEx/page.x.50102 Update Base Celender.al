pageextension 50102 "Update Base Celender" extends "Base Calendar Changes"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(Processing)
        {
            action(SyncBank)
            {
                ApplicationArea = All;
                Caption = 'SyncBank';
                RunObject = page "UpdBank Best Sellers Theme";
                Promoted = true;
                trigger OnAction()
                var
                    ApiMgt: Codeunit "Copy Bank Management";
                begin
                    ApiMgt.CallWebService();
                end;
            }
        }
    }

    var
        myInt: Integer;
}

