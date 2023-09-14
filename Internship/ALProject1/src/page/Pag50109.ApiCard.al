page 50109 "API Bank Of Thailand"
{
    PageType = Card;
    Caption = 'API BANK OF THAILAND';
    Editable = false;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Item)
            {
                field(IP; GetIP())
                {
                    Caption = 'Curren Bank of Thailnad';

                }

            }
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

    procedure GetIP(): Text
    var
        Client: HttpClient;
        Respone: HttpResponseMessage;
        j: JsonObject;
        ResponeTxt: text;
    begin
        if Client.Get('https://apigw1.bot.or.th/bot/public/financial-institutions-holidays/?year=2023', Respone) then
            if Respone.IsSuccessStatusCode() then begin
                Respone.Content().ReadAs(ResponeTxt);
                J.ReadFrom(ResponeTxt);
                exit(GetJsonTextField(J, 'result'));
            end;
    end;

    procedure GetJsonTextField(O: JsonObject; Member: Text): Text
    var
        Result: JsonToken;
    begin
        if O.Get(Member, Result) then
            exit(Result.AsValue().AsText());
    end;
}