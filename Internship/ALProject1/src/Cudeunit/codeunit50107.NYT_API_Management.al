/*codeunit 50107 "NYT API Management"
{
    procedure GetRequest(AdditionalURL: Text; var Data: Text; var httpStatusCode: Integer): Boolean
    var
        NYAPISetup: Record "NYT API Setup";
        httpClient: HttpClient;
        HttpHeaders: HttpHeaders;
        HttpContent: HttpContent;
        httpResponseMessage: HttpResponseMessage;
        HttpRequestMessage: HttpRequestMessage;
        gContent_type: Text;
        requestUri: Text;
        header: HttpHeaders;
    begin
        NYAPISetup.get();
        requestUri := NYAPISetup."Base URL";
        gContent_type := 'application/json';
        HttpHeaders.Clear();
        HttpContent.getHeaders(HttpHeaders);
        HttpHeaders.Add('X-IBM-Client-Id', 'ffb2dbe2-f956-4679-8bb3-9c901919a4dd');
        // HttpHeaders.Add('Content-Type', gContent_type);
        HttpRequestMessage.SetRequestUri(requestUri);
        HttpRequestMessage.Method := 'get';
        HttpRequestMessage.Content := HttpContent;
        httpClient.Send(HttpRequestMessage, httpResponseMessage);
        httpResponseMessage.Content().ReadAs(Data);
        Message(Data);
        /*httpStatusCode := httpResponseMessage.HttpStatusCode();
        if not httpResponseMessage.IsSuccessStatusCode() then
            Error(RequestErr, httpStatusCode, Data);
        exit(true);*/
/*  end;

    procedure SyncBookAPIData()
    var
        NYTBestSellerTheme: Record "NYT Best Sellers Theme";
        NYTJsonMgt: Codeunit "NYT JSON Mgt";
        Window: Dialog;
        AddUrl: Text;
        HttpStatusCode: Integer;
        RecCounter: Integer;
        Data: Text;
    begin
        NYTBestSellerTheme.DeleteAll(true);

        AddUrl := '/lists/names.json?';
        GetRequest(AddUrl, Data, HttpStatusCode);
        NYTJsonMgt.UpdateBestSellersTheme(Data);
        Window.OPEN('Processing: @1@@@@@@@@@@@@@@@');
        if NYTBestSellerTheme.FindSet() then
            repeat
                RecCounter += 1;
                Window.UPDATE(1, ROUND(RecCounter / NYTBestSellerTheme.Count() * 10000, 1));
                AddUrl := StrSubstNo('/lists.json?list=%1&', NYTBestSellerTheme."HolidayWeekDayThai");
                GetRequest(AddUrl, Data, HttpStatusCode);
                NYTJsonMgt.UpdateBestSeller(Data);
                Commit();
                Sleep(7000); // To avoid New York Time API request limit
            until NYTBestSellerTheme.Next() = 0;
        Window.CLOSE();
    end;

    var
        RequestErr: Label 'Request failed with HTTP Code:: %1 Request Body:: %2', Comment = '%1 = HttpCode, %2 = RequestBody';
}**/