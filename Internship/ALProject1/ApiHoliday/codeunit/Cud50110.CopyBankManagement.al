codeunit 50110 "Copy Bank Management"
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

        ApiMgt: Codeunit "Copy Bank Management";
        Str: Text[200];
        Position: Integer;
        Length: Integer;
        NewStr: Text[30];
    begin
        //Read Last ID if ID is Last ID +1 
        //if ID null give = 1
        Api.Reset();
        // if Api.FindLast() then
        //     id := Api.ID + 1
        // else
        //     id := 1;
        api.DeleteAll();
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
                // Message(Format(JsonToken1));
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

                                Api.Reset();
                                Api.Init();
                                // Api.ID := id;

                                if Json_Object.Get('HolidayWeekDay', valueJToken) then begin
                                    if valueJToken.IsValue then begin
                                        //Message(valueJToken.AsValue().AsText());
                                        Api.HolidayWeekDay := valueJToken.AsValue().AsText();
                                    end;
                                end;

                                if GetResultJsonValue(Json_Object, 'HolidayWeekDayThai', Json_Value) then
                                    //Message(Json_Value.AsText());
                                    Api.HolidayWeekDayThai := Json_Value.AsText();
                                if GetResultJsonValue(Json_Object, 'Date', Json_Value) then begin
                                    Api."Date" := Json_Value.AsDate();
                                    // BaseCalender.Date := Json_Value.AsDate();
                                end;
                                if GetResultJsonValue(Json_Object, 'DateThai', Json_Value) then
                                    Api.DateThai := Json_Value.AsText();
                                //Evaluate(BaseCalender.Date, Json_Value.AsText());
                                if GetResultJsonValue(Json_Object, 'HolidayDescription', Json_Value) then begin
                                    // Api.HolidayDescription := Json_Value.AsText();
                                    Str := Json_Value.AsText();
                                    Position := 1;
                                    Length := 30;
                                    NewStr := CopyStr(Str, Position, Length);
                                    //Message(NewStr);
                                    // Evaluate(BaseCalender.Description, NewStr);
                                    Api.HolidayDescription := NewStr;

                                end;

                                if GetResultJsonValue(Json_Object, 'HolidayDescriptionThai', Json_Value) then
                                    Api.HolidayDescriptionThai := Json_Value.AsText();

                                if Api.Insert() then
                                    id += 1;
                                // Evaluate(BaseCalender."Base Calendar Code", '2023');

                                // if BaseCalender.Insert() then
                                //     id += 1;


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

    procedure confirme()
    var
        Api: Record "Bank Best Sellers Theme";
        BaseCalender: Record "Base Calendar Change";
    begin


        if Api.Findset() then
            repeat
                BaseCalender."Date" := Api.Date;
                BaseCalender.Description := Api.HolidayDescription;
                BaseCalender."Base Calendar Code" := '2023';
                BaseCalender.Insert();
            // APi.ConvertJson2();
            until Api.Next() = 0;

        // Xmlport.Run(50100, false, false);
    end;



}