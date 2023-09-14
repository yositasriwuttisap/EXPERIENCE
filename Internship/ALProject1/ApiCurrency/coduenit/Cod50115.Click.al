codeunit 50115 Click
{
    procedure Connect()
    var
        HttpClient: HttpClient;
        Response: HttpResponseMessage;


        Client: HttpClient;
        Request: HttpRequestMessage;
        Headers: HttpHeaders;

        forreign: Record "Furreign Currency";
        d: date;
        i: Integer;
        j: Integer;
        t: text;
        id: Integer;
        replace: List of [Text];
        Split: text;
        json_Array: JsonArray; //[]
        Api: Codeunit "ForreignCurrency";
        Setup: Record "Currency";
    begin

        // Split := Format(WorkDate());
        // replace := Split.Split('/');
        // Request.Method := 'GET';
        // Request.GetHeaders(Headers);
        // Headers.Add('X-IBM-Client-Id', '90235650-2131-44ab-867a-f33460eb8342');
        forreign.DeleteAll();
        if Setup.Findset() then
            repeat
                Api.ConvertJson(Setup.Code);
            // APi.ConvertJson2();
            until Setup.Next() = 0;

        // Xmlport.Run(50100, false, false);
    end;

    procedure confirme()
    var
        Setup: Record "Furreign Currency";
        Currentcy: Record "Currency Exchange Rate";
    begin


        if Setup.Findset() then
            repeat
                Currentcy."Currency Code" := Setup.currency_id;
                Currentcy."Starting Date" := Setup.period;
                Currentcy."Exchange Rate Amount" := Setup.mid_rate;
                Currentcy."Adjustment Exch. Rate Amount" := Setup.mid_rate;
                Currentcy.Insert();
            // APi.ConvertJson2();
            until Setup.Next() = 0;

        // Xmlport.Run(50100, false, false);
    end;
}