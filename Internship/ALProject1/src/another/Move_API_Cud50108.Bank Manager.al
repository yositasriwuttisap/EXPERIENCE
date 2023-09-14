codeunit 50108 "Bank Management"
{

    procedure CallWebService(): Text
    var
        Setup: Record "BANK API Setup";
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Headers: HttpHeaders;
        //QueryString: Text;
        //XMLtxt: Text;
        J: JsonObject;
        TxtOut: Text;
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
                Response.Content().ReadAs(TxtOut);
                Message(TxtOut);
                exit(GetJsonTextField(J, 'HolidayWeekDay'));
            end else
                error('Bank Of Thailand web service call failed (status code %1)', Response.HttpStatusCode());
        end else
            error('Cannot contact Bank Of Thailand, connection error!');
    end;



    procedure GetJsonTextField(O: JsonObject; Member: Text): Text
    var
        Result: JsonToken;
    begin
        if O.Get(Member, Result) then
            exit(Result.AsValue().AsText());
    end;



}