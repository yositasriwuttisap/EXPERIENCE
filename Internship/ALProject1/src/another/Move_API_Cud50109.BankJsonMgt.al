codeunit 50109 "Bank JSON Mgt"
{
    procedure SelectJsonToken(JObject: JsonObject; Path: Text): Text
    var
        JToken: JsonToken;
    begin
        if JObject.SelectToken(Path, JToken) then
            if NOT JToken.AsValue().IsNull() then
                exit(JToken.AsValue().AsText());
    end;

    procedure GetValueAsText(JToken: JsonToken; ParamString: Text): Text
    var
        JObject: JsonObject;
    begin
        JObject := JToken.AsObject();
        exit(SelectJsonToken(JObject, ParamString));
    end;

    local procedure EvaluateUTCDateTime(DataTimeText: Text) EvaluatedDateTime: DateTime;
    var
        TypeHelper: Codeunit "Type Helper";
        ValueTest: Variant;
    begin
        ValueTest := EvaluatedDateTime;
        IF TypeHelper.Evaluate(ValueTest, DataTimeText, '', TypeHelper.GetCultureName()) THEN
            EvaluatedDateTime := ValueTest;
    end;

    procedure UpdateBestSellersTheme(Data: text)
    var
        NYTBestSellersTheme: Record "Bank Best Sellers Theme";
        JToken: JsonToken;
        JObject: JsonObject;
        JArray: JsonArray;
    begin
        if Data = '' then
            exit;

        JToken.ReadFrom(Data);
        JObject := JToken.AsObject();
        JObject.SelectToken('results', JToken);
        JArray := JToken.AsArray();

        foreach JToken in JArray do begin
            NYTBestSellersTheme.Init();
            NYTBestSellersTheme."HolidayWeekDay" := CopyStr(GetValueAsText(JToken, 'list_name_encoded'), 1, MaxStrLen(NYTBestSellersTheme."HolidayWeekDay"));
            /* NYTBestSellersTheme."HolidayWeekDayThai" :=  CopyStr(GetValueAsText(JToken, 'author'));
             NYTBestSellersTheme."Date" := DT2Date(EvaluateUTCDateTime(GetValueAsText(JToken, 'oldest_published_date')));
             NYTBestSellersTheme."DateThai" := DT2Date(EvaluateUTCDateTime(GetValueAsText(JToken, 'oldest_published_date')));
             NYTBestSellersTheme."HolidayDescription" := CopyStr(GetValueAsText(JToken, 'list_name_encoded'), 1, MaxStrLen(NYTBestSellersTheme."List Name Encoded")
             NYTBestSellersTheme."HolidayDescriptionThai" := CopyStr(GetValueAsText(JToken, 'list_name_encoded'), 1, MaxStrLen(NYTBestSellersTheme."List Name Encoded")*/
            NYTBestSellersTheme.Insert();
        end;
    end;


}