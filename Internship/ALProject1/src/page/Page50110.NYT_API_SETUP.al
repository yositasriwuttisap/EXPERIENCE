/*page 50110 "NYT API Setup"
{

    Caption = 'Bank Of Thailand Times API Setup';
    PageType = Card;
    SourceTable = "NYT API Setup";
    UsageCategory = Administration;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Base URL"; rec."Base URL")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Base URL';
                }
                field(APIKey; rec."Primary Key")
                {
                    ApplicationArea = All;
                    Caption = 'API Key';
                    ToolTip = 'Specifies the API Key';
                    ExtendedDatatype = Masked;
                    trigger OnValidate()
                    begin
                        rec.SetAPIKey(APIKey);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not rec.Get() then begin
            rec.Init();
            rec.Insert();
        end;
        if rec.GetAPIKey() <> '' then
            APIKey := '********';
    end;

    var
        APIKey: Text;
}*/