codeunit 50100 JsonTools
{
    procedure JSONToRec(JsonObjectToConvert: JsonObject; Rec: Variant): Variant
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Rec);
        exit(JSONToRec(JsonObjectToConvert, RecRef.Number()));
    end;

    local procedure JSONToRec(JsonObjectToConvert: JsonObject; TableNo: Integer): Variant
    var
        RecRef: RecordRef;
        FieldRf: FieldRef;
        FieldHash: Dictionary of [Text, Integer];
        i: Integer;
        JsonKey: Text;
        JsonTkn: JsonToken;
        JsonKeyValue: JsonValue;
        RecVariant: Variant;
    begin
        RecRef.Open(TableNo);

        for i := 1 to RecRef.FieldCount do begin
            FieldRf := RecRef.FieldIndex(i);
            FieldHash.Add(GetJsonFieldName(FieldRf), FieldRf.Number)
        end;

        RecRef.Init();
        foreach JsonKey in JsonObjectToConvert.Keys do begin
            if JsonObjectToConvert.Get(JsonKey, JsonTkn) then begin
                if JsonTkn.IsValue then begin
                    JsonKeyValue := JsonTkn.AsValue();
                    FieldRf := RecRef.Field(FieldHash.Get(JsonKey));
                    AssignValueToFieldRf(FieldRf, JsonKeyValue);
                end;
            end;
        end;

        RecVariant := RecRef;
        exit(RecVariant);
    end;

    local procedure GetJsonFieldName(FRef: FieldRef): Text
    var
        Name: Text;
        i: Integer;
    begin
        Name := FRef.Name();
        for i := 1 to StrLen(Name) do begin
            if Name[i] < '0' then
                Name[i] := '_';
        end;
        exit(Name.Replace('__', '_').TrimEnd('_').TrimStart('_'));
    end;

    local procedure AssignValueToFieldRf(var FieldRf: FieldRef; JsonKeyValue: JsonValue)
    var
        OptionValueText: Text;
        OptionIndex: Integer;
        OptionCaptions: List of [Text];
        OptionCaption: Text;
        i: Integer;
    begin
        case FieldRf.Type() of
            FieldType::Code,
            FieldType::Text:
                FieldRf.Value := JsonKeyValue.AsText();
            FieldType::Integer:
                FieldRf.Value := JsonKeyValue.AsInteger();
            FieldType::Date:
                FieldRf.Value := JsonKeyValue.AsDate();
            FieldType::Option:
                begin
                    OptionValueText := JsonKeyValue.AsText();
                    OptionCaptions := FieldRf.OptionCaption().Split(',');

                    OptionIndex := -1;
                    for i := 1 to OptionCaptions.Count() do begin
                        OptionCaption := OptionCaptions.Get(i).Trim();
                        if OptionCaption = OptionValueText then begin
                            OptionIndex := i - 1; // Option indexes are 0-based
                            break;
                        end;
                    end;

                    if OptionIndex = -1 then
                        Error('Invalid option value: %1', OptionValueText);

                    FieldRf.Value := OptionIndex;
                end;
            else
                Error('%1 is not a supported field type', FieldRf.Type());
        end;
    end;
}