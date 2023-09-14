page 50111 "Bank Best Sellers Theme"
{
    Caption = 'Bank Best Sellers Theme';
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

                field("HolidayWeekDay"; rec."HolidayWeekDay")
                {
                    ApplicationArea = All;
                }
                field("HolidayWeekDayThai"; rec."HolidayWeekDayThai")
                {
                    ApplicationArea = All;
                }
                field("Date"; rec."Date")
                {
                    ApplicationArea = All;
                }
                field("DateThai"; rec."DateThai")
                {
                    ApplicationArea = All;
                }
                field("HolidayDescription"; rec."HolidayDescription")
                {
                    ApplicationArea = All;
                }
                field("HolidayDescriptionThai"; rec."HolidayDescriptionThai")
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
                Caption = 'SyncBank';

                trigger OnAction()
                var
                    NYTApiMgt: Codeunit "Copy Bank Management";
                begin
                    NYTApiMgt.CallWebService();
                    CurrPage.Update(false);
                end;
            }

        }



        // area(Processing)
        // {
        //     action(SyncBank)
        //     {
        //         ApplicationArea = All;
        //         Caption = 'SyncBank';

        //         trigger OnAction()
        //         var
        //             NYTApiMgt: Codeunit "Copy Bank Management";
        //         begin
        //             NYTApiMgt.CallWebService();
        //             //CallWebService();
        //             CurrPage.Update(false);
        //         end;
        //     }

        // }


    }
    /*procedure CallWebService(var API: Record "Bank Best Sellers Theme")
    var
        Setup: Record "BANK API Setup";
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Headers: HttpHeaders;
        //QueryString: Text;
        //XMLtxt: Text;
        JsonOb: JsonObject;
        Jtoken: JsonToken;
        TxtOut: Text;
        Output: Text;
        NewJsonObject: JsonObject;
        NewJsonToken: JsonToken;
        BankApiMgt: Codeunit "Bank JSON Mgt";

    begin
        if not Setup.Get() then
            error('Bank Of Thailand is needed, please enter URL and UserID');

        Request.Method := 'GET';
        //QueryString := '?year=' + API;
        Request.GetHeaders(Headers);
        Headers.Add('X-IBM-Client-Id', 'ffb2dbe2-f956-4679-8bb3-9c901919a4dd');
        Request.SetRequestUri(Setup."Base URL");
        if Client.Send(Request, Response) then begin
            if Response.HttpStatusCode() = 200 then begin
                JsonOb.Get('result', Jtoken);
                if NewJsonToken.IsObject then begin
                    NewJsonToken.WriteTo(Output);
                    NewJsonObject.ReadFrom(Output);
                    NewJsonObject.Get('data', NewJsonToken);
                end;
                Response.Content().ReadAs(TxtOut);
                Message(TxtOut);
                JsonOb.Get('HolidayWeekDay', Jtoken);
                API.HolidayWeekDay := Jtoken.AsValue().AsText();
                JsonOb.Get('HolidayWeekDayThai', Jtoken);
                API.HolidayWeekDayThai := Jtoken.AsValue().AsText();
                JsonOb.Get('Date', Jtoken);
                API."Date" := Jtoken.AsValue().AsDate();
                JsonOb.Get('DateThai', Jtoken);
                API.DateThai := Jtoken.AsValue().AsDate();
                JsonOb.Get('HolidayDescription', Jtoken);
                API.HolidayDescription := Jtoken.AsValue().AsText();
                JsonOb.Get('HolidayDescriptionThai', Jtoken);
                API.HolidayDescriptionThai := Jtoken.AsValue().AsText();


            end else
                error('Bank Of Thailand web service call failed (status code %1)', Response.HttpStatusCode());
        end else
            error('Cannot contact Bank Of Thailand, connection error!');
    end;*/

    /*
        procedure GetJsonTextField(O: JsonObject; Member: Text): Text
        var
            Result: JsonToken;
        begin
            if O.Get(Member, Result) then
                Result.AsValue().AsText();
        end;

    */
}