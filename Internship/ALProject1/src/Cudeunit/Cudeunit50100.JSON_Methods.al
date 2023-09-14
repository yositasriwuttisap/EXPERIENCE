codeunit 50146 JSON_Methods
{
    trigger OnRun()
    begin
    end;
 
    // GetJsonValue is use to get the value format and helpful to convert in any data type 
    procedure GetJsonValue(var json_Object: JsonObject; Property: Text; var json_Value: JsonValue): Boolean
    var
        json_Token: JsonToken;
    begin
        if not json_Object.Get(Property, json_Token) then
            exit;
        json_Value := json_Token.AsValue();
        exit(true);
    end;
 
 
    // Work for Text Response
    procedure GetJsonValueAsText(var json_Object: JsonObject; Property: Text) Value: Text
    var
        json_Value: JsonValue;
    begin
        if not GetJsonValue(json_Object, Property, json_Value) then
            exit;
        Value := json_Value.AsText;
    end;
 
    procedure GetJsonValueAsBoolean(var json_Object: JsonObject; Property: Text) Value: Boolean
    var
        json_Value: JsonValue;
    begin
        if not GetJsonValue(json_Object, Property, json_Value) then
            exit;
        Value := json_Value.AsBoolean();
    end;
 
    procedure GetJsonValueAsInteger(var json_Object: JsonObject; Property: Text) Value: Integer
    var
        json_Value: JsonValue;
    begin
        if not GetJsonValue(json_Object, Property, json_Value) then
            exit;
        Value := json_Value.AsInteger();
    end;
 
    procedure GetJsonValueAsDecimal(var json_Object: JsonObject; Property: Text) Value: Decimal
    var
        json_Value: JsonValue;
    begin
        if not GetJsonValue(json_Object, Property, json_Value) then
            exit;
        Value := json_Value.AsDecimal();
    end;
 
    procedure GetJsonToken(json_Object: JsonObject; tokenKey: Text) json_Token: JsonToken;
    begin
        if not json_Object.Get(tokenKey, json_Token) then
            Error('Token not found with key %1', tokenKey);
    end;
 
    procedure SelectJsonToken(json_object: JsonObject; path: Text) json_Token: JsonToken;
    begin
        if not json_object.SelectToken(path, json_Token) then
            Error('Token not found with path %1', path);
    end;
}