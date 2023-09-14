codeunit 50114 ForreignCurrency
{
    procedure ConvertJson(set: Code[20])
    var
        HttpClient: HttpClient;
        Response: HttpResponseMessage;


        Client: HttpClient;
        Request: HttpRequestMessage;
        Headers: HttpHeaders;
        TxtOut: text;

        json_Token: jsonToken;
        JsonToken1: JsonToken;
        valueJToken: JsonToken;
        JsonToken2: JsonToken;
        JsonToken5: JsonToken;
        Json_Object: JsonObject;
        JsonObject1: JsonObject;
        JsonObject2: JsonObject;
        JsonObject3: JsonObject;
        JsonToken6: JsonToken;
        Json_Value: JsonValue;
        Json_Value1: JsonValue;
        Output1: text;
        Output2: Text;
        forreign: Record "Furreign Currency";
        Currentcy: Record "Currency Exchange Rate";
        d: date;
        i: Integer;
        j: Integer;
        t: text;
        id: Integer;
        replace: List of [Text];
        Split: text;
        json_Array: JsonArray; //[]


    begin
        // message('start');
        Split := Format(WorkDate());
        replace := Split.Split('/');
        Request.Method := 'GET';
        Request.GetHeaders(Headers);
        Headers.Add('X-IBM-Client-Id', '90235650-2131-44ab-867a-f33460eb8342');
        //  Sleep(7000);
        Request.SetRequestUri('https://apigw1.bot.or.th/bot/public/Stat-ExchangeRate/v2/DAILY_AVG_EXG_RATE/?start_period=20' + replace.Get(3) + '-' + replace.Get(2) + '-' + replace.Get(1) + '&end_period=20' + replace.Get(3) + '-' + replace.Get(2) + '-' + replace.Get(1) + '&currency=' + Set);
        // Message('https://apigw1.bot.or.th/bot/public/Stat-ExchangeRate/v2/DAILY_AVG_EXG_RATE/?start_period=2017-07-18&end_period=2017-07-18&currency=JPY');
        if Client.Send(Request, Response) then begin
            if Response.HttpStatusCode() = 200 then begin
                Response.Content().ReadAs(TxtOut);
                JsonObject1.ReadFrom(TxtOut);

                JsonObject1.Get('result', JsonToken1);
                if JsonToken1.IsObject then begin
                    JsonToken1.WriteTo(Output1);
                    JsonObject2.ReadFrom(Output1);
                    JsonObject2.Get('data', JsonToken2);
                    if JsonToken2.IsObject then begin
                        JsonToken2.WriteTo(Output2);
                        JsonObject3.ReadFrom(Output2);

                        JsonObject3.Get('data_detail', JsonToken5);

                        // Message(Format(JsonToken5));
                        if JsonToken5.IsArray then begin

                            json_Array := JsonToken5.AsArray();
                            json_Array.Get(i, json_Token);
                            Json_Object := json_Token.AsObject();
                            // forreign.Reset();
                            // if GetResultJsonValue(Json_Object, 'period', Json_Value) then begin
                            //     forreign.SetRange(period, Json_Value.AsText());
                            // forreign.DeleteAll();
                            // end;

                            // forreign.Reset();
                            // forreign.Init();

                            // Message(Format(Json_Object));
                            if GetResultJsonValue(Json_Object, 'period', Json_Value) then begin
                                Evaluate(forreign."period", Json_Value.AsText());
                                // Evaluate(Currentcy."Currency Code", Set);
                                // Evaluate(Currentcy."Starting Date", Json_Value.AsText());
                            end;
                            if GetResultJsonValue(Json_Object, 'currency_id', Json_Value) then begin
                                Evaluate(forreign."currency_id", Json_Value.AsText());
                            end;
                            if GetResultJsonValue(Json_Object, 'buying_sight', Json_Value) then begin
                                Evaluate(forreign."buying_sight", Json_Value.AsText());
                            end;
                            if GetResultJsonValue(Json_Object, 'buying_transfer', Json_Value) then begin
                                Evaluate(forreign."buying_transfer", Json_Value.AsText());
                            end;
                            if GetResultJsonValue(Json_Object, 'selling', Json_Value) then begin
                                Evaluate(forreign."selling", Json_Value.AsText());
                            end;
                            if GetResultJsonValue(Json_Object, 'mid_rate', Json_Value) then begin
                                Evaluate(forreign."mid_rate", Json_Value.AsText());
                                // Evaluate(Currentcy."Exchange Rate Amount", Json_Value.AsText());
                                // Evaluate(Currentcy."Adjustment Exch. Rate Amount", Json_Value.AsText());
                            end;
                            if forreign.Insert() then
                                Commit();
                            if Currentcy.Insert() then
                                Commit();
                        end;
                    end;
                end;

            end else begin

            end;
            // error('Bank Of Thailand web service call failed (status code %1)', Response.HttpStatusCode());
        end else begin

        end;
        // error('Cannot contact Bank Of Thailand, connection error!');
    end;

    // procedure confirme(set: Code[20])
    // var
    //     HttpClient: HttpClient;
    //     Response: HttpResponseMessage;


    //     Client: HttpClient;
    //     Request: HttpRequestMessage;
    //     Headers: HttpHeaders;
    //     TxtOut: text;

    //     json_Token: jsonToken;
    //     JsonToken1: JsonToken;
    //     valueJToken: JsonToken;
    //     JsonToken2: JsonToken;
    //     JsonToken5: JsonToken;
    //     Json_Object: JsonObject;
    //     JsonObject1: JsonObject;
    //     JsonObject2: JsonObject;
    //     JsonObject3: JsonObject;
    //     JsonToken6: JsonToken;
    //     Json_Value: JsonValue;
    //     Json_Value1: JsonValue;
    //     Output1: text;
    //     Output2: Text;
    //     forreign: Record "Furreign Currency";
    //     Currentcy: Record "Currency Exchange Rate";
    //     d: date;
    //     i: Integer;
    //     j: Integer;
    //     t: text;
    //     id: Integer;
    //     replace: List of [Text];
    //     Split: text;
    //     json_Array: JsonArray; //[]


    // begin
    //     // message('start');
    //     Split := Format(WorkDate());
    //     replace := Split.Split('/');
    //     Request.Method := 'GET';
    //     Request.GetHeaders(Headers);
    //     Headers.Add('X-IBM-Client-Id', '90235650-2131-44ab-867a-f33460eb8342');
    //     //  Sleep(7000);
    //     Request.SetRequestUri('https://apigw1.bot.or.th/bot/public/Stat-ExchangeRate/v2/DAILY_AVG_EXG_RATE/?start_period=20' + replace.Get(3) + '-' + replace.Get(2) + '-' + replace.Get(1) + '&end_period=20' + replace.Get(3) + '-' + replace.Get(2) + '-' + replace.Get(1) + '&currency=' + Set);
    //     // Message('https://apigw1.bot.or.th/bot/public/Stat-ExchangeRate/v2/DAILY_AVG_EXG_RATE/?start_period=2017-07-18&end_period=2017-07-18&currency=JPY');
    //     if Client.Send(Request, Response) then begin
    //         if Response.HttpStatusCode() = 200 then begin
    //             Response.Content().ReadAs(TxtOut);
    //             JsonObject1.ReadFrom(TxtOut);

    //             JsonObject1.Get('result', JsonToken1);
    //             if JsonToken1.IsObject then begin
    //                 JsonToken1.WriteTo(Output1);
    //                 JsonObject2.ReadFrom(Output1);
    //                 JsonObject2.Get('data', JsonToken2);
    //                 if JsonToken2.IsObject then begin
    //                     JsonToken2.WriteTo(Output2);
    //                     JsonObject3.ReadFrom(Output2);

    //                     JsonObject3.Get('data_detail', JsonToken5);

    //                     // Message(Format(JsonToken5));
    //                     if JsonToken5.IsArray then begin

    //                         json_Array := JsonToken5.AsArray();
    //                         json_Array.Get(i, json_Token);
    //                         Json_Object := json_Token.AsObject();

    //                         if GetResultJsonValue(Json_Object, 'period', Json_Value) then begin
    //                             Evaluate(Currentcy."Currency Code", Set);
    //                             Evaluate(Currentcy."Starting Date", Json_Value.AsText());
    //                         end;

    //                         if GetResultJsonValue(Json_Object, 'mid_rate', Json_Value) then begin
    //                             Evaluate(Currentcy."Exchange Rate Amount", Json_Value.AsText());
    //                             Evaluate(Currentcy."Adjustment Exch. Rate Amount", Json_Value.AsText());
    //                         end;

    //                         if Currentcy.Insert() then
    //                             Commit();
    //                     end;
    //                 end;
    //             end;

    //         end else begin

    //         end;
    //         // error('Bank Of Thailand web service call failed (status code %1)', Response.HttpStatusCode());
    //     end else begin

    //     end;
    //     // error('Cannot contact Bank Of Thailand, connection error!');
    // end;



    local procedure GetResultJsonValue(jObj: JsonObject; KeyName: Text; var jValue: JsonValue): Boolean
    var
        json_Token: JsonToken;
    begin
        if not jObj.Get(KeyName, json_Token) then exit;
        jValue := json_Token.AsValue();
        exit(true);
    end;


}