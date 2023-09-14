codeunit 50111 "Copy"
{

    procedure CallWebService()
    var
        Setup: Record "BANK API Setup";
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Headers: HttpHeaders;
        //QueryString: Text;
        //XMLtxt: Text;
        JsonObject1: JsonObject;
        JsonObject2: JsonObject;
        JsonToken1: JsonToken;
        JsonToken2: JsonToken;
        JsonArray1: JsonArray;
        TxtOut: Text;
        Output1: Text;
        Output2: Text;
        temp: Text;
        BankApiMgt: Codeunit "Bank JSON Mgt";

        json_Array: JsonArray; //[]
        Json_Object: JsonObject; //{}
        Json_Value: JsonValue;
        i: Integer;
        Api: Record "Bank Best Sellers Theme";
        BaseCalender: Record "Base Calendar Change";
        id: Integer;
        json_Token: JsonToken;
        valueJToken: JsonToken;

    begin
        //Read Last ID if ID is Last ID +1 
        //if ID null give = 1
        BaseCalender.Reset();
        // if Api.FindLast() then
        //     id := Api.ID + 1
        // else
        //     id := 1;

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
                JsonObject1.ReadFrom(TxtOut);
                JsonObject1.Get('result', JsonToken1);

                if JsonToken1.IsObject then begin
                    JsonToken1.WriteTo(Output1);
                    JsonObject2.ReadFrom(Output1);
                    JsonObject2.Get('data', json_Token);
                    //Message(Output1);
                    if json_Token.IsArray then begin
                        json_Array := json_Token.AsArray();
                        for i := 0 to json_Array.Count - 1 do begin
                            //Get the first Record from the Array result that is an object
                            json_Array.Get(i, json_Token);

                            if json_Token.IsObject then begin
                                //Convert JsonToken to JsonObject to read actual values
                                Json_Object := json_Token.AsObject();

                                BaseCalender.Reset();
                                BaseCalender.Init();

                                if GetResultJsonValue(Json_Object, 'DateThai', Json_Value) then begin
                                    Evaluate(BaseCalender.Date, Json_Value.AsText());
                                end;


                                if BaseCalender.Insert() then
                                    id += 1;


                            end;
                        end;
                    end;
                end;
            end else
                error('Bank Of Thailand web service call failed (status code %1)', Response.HttpStatusCode());
        end else
            error('Cannot contact Bank Of Thailand, connection error!');
    end;


    local procedure GetResultJsonValue(jObj: JsonObject; KeyName: Text; var jValue: JsonValue): Boolean
    var
        json_Token: JsonToken;
    begin
        if not jObj.Get(KeyName, json_Token) then exit;
        jValue := json_Token.AsValue();
        exit(true);
    end;
}