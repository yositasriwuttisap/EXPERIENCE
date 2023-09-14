table 50100 JP_Users
{
    Caption = 'Json Placeholder Users';

    DataClassification = ToBeClassified;

    fields
    {
        field(1; UUID; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; HolidayWeekDay; Text[50]) { DataClassification = ToBeClassified; }
        field(3; HolidayWeekDayThai; Text[50]) { DataClassification = ToBeClassified; }
        field(4; Date; Date) { DataClassification = ToBeClassified; }
        field(5; DateThai; Date) { DataClassification = ToBeClassified; }
        field(6; HolidayDescription; Text[200]) { DataClassification = ToBeClassified; }
        field(7; HolidayDescriptionThai; Text[200]) { DataClassification = ToBeClassified; }
    }

    keys
    {
        key(PK; UUID)
        {
            Clustered = true;
        }
    }
}
