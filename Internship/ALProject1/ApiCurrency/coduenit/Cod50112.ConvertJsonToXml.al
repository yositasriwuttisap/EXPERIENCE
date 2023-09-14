codeunit 50113 ConvertJsonToXml
{
    procedure ConvertJsonToXml()
    var
        HttpClient: HttpClient;
        Response: HttpResponseMessage;


        Client: HttpClient;
        Request: HttpRequestMessage;
        Headers: HttpHeaders;
        TxtOut: text;
        Result: XmlDocument;
        XmlDocumen: XmlDocument;

        json_Token: jsonToken;
        JsonToken1: JsonToken;
        valueJToken: JsonToken;
        JsonToken2: JsonToken;
        JsonToken3: JsonToken;
        JsonToken4: JsonToken;
        JsonToken5: JsonToken;
        Json_Object: JsonObject;
        JsonObject1: JsonObject;
        JsonObject2: JsonObject;
        JsonObject3: JsonObject;
        JsonObject4: JsonObject;
        JsonObject5: JsonObject;
        JsonObject6: JsonObject;
        JsonToken6: JsonToken;
        Json_Value: JsonValue;
        Json_Value1: JsonValue;
        Output1: text;
        Output2: Text;
        Output3: Text;
        Output4: text;
        Output5: text;
        success: text;
        Api: Record "Rates of Exchange";
        Currentcy: Record "Currency Exchange Rate";
        Setup: Record "Current API Setup";

        i: Integer;
        id: Integer;
        json_Array: JsonArray; //[]


    begin
        Request.Method := 'GET';
        //QueryString := '?year=' + API;
        Request.GetHeaders(Headers);
        Headers.Add('X-IBM-Client-Id', '90235650-2131-44ab-867a-f33460eb8342');
        // Message(Format(WorkDate()));
        Request.SetRequestUri('https://apigw1.bot.or.th/bot/public/Stat-ReferenceRate/v2/DAILY_REF_RATE/?start_period=2017-07-18&end_period=2017-07-17');

        // Request.SetRequestUri('https://apigw1.bot.or.th/bot/public/Stat-ReferenceRate/v2/DAILY_REF_RATE/?start_period=' + Setup."Date" + '&end_period=' + Setup."Date");
        if Client.Send(Request, Response) then begin
            if Response.HttpStatusCode() = 200 then begin
                Response.Content().ReadAs(TxtOut);
                JsonObject1.ReadFrom(TxtOut);
                Message(TxtOut);
                JsonObject1.Get('result', JsonToken1);
                if JsonToken1.IsObject then begin
                    JsonToken1.WriteTo(Output1);
                    JsonObject2.ReadFrom(Output1);
                    if JsonObject2.Get('api', valueJToken) then begin
                        if valueJToken.IsValue then begin
                            // Message(valueJToken.AsValue().AsText());
                            Api.api := valueJToken.AsValue().AsText();
                        end;
                    end;
                    JsonObject2.Get('data', JsonToken2);
                    if JsonToken2.IsObject then begin
                        JsonToken2.WriteTo(Output2);
                        JsonObject3.ReadFrom(Output2);
                        JsonObject3.Get('data_header', JsonToken3);
                        if JsonToken3.IsObject then begin
                            JsonToken3.WriteTo(Output3);
                            JsonObject4.ReadFrom(Output3);

                            if GetResultJsonValue(JsonObject4, 'report_name_eng', Json_Value) then begin
                                Evaluate(Api.report_name_eng, Json_Value.AsText());
                                // Message(Json_Value.AsText());
                                Evaluate(Currentcy."Currency Code", 'USD');
                            end;
                            if GetResultJsonValue(JsonObject4, 'last_updated', Json_Value) then begin
                                // Message(Json_Value.AsText());
                                Evaluate(Api.last_updated, Json_Value.AsText());
                                Evaluate(Currentcy."Starting Date", Json_Value.AsText());
                            end;

                            JsonObject3.Get('data_detail', JsonToken5);
                            if JsonToken5.IsArray then begin
                                json_Array := JsonToken5.AsArray();
                                json_Array.Get(i, json_Token);
                                Json_Object := json_Token.AsObject();
                                if GetResultJsonValue(Json_Object, 'rate', Json_Value) then begin
                                    Evaluate(Api."rate", Json_Value.AsText());
                                    // Message(Json_Value.AsText());
                                    Evaluate(Currentcy."Exchange Rate Amount", Json_Value.AsText());
                                    Evaluate(Currentcy."Adjustment Exch. Rate Amount", Json_Value.AsText());
                                end;
                            end;

                        end;

                    end;
                    if Api.Insert() then
                        id += 1;
                    if Currentcy.Insert() then
                        id += 1;
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
