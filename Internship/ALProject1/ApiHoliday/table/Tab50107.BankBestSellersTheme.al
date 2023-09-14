table 50107 "Bank Best Sellers Theme"
{

    DataClassification = CustomerContent;

    fields
    {

        field(10; "HolidayWeekDay"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(20; "HolidayWeekDayThai"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(30; "Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(40; "DateThai"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50; "HolidayDescription"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(60; "HolidayDescriptionThai"; Text[250])
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; DateThai)
        {
            Clustered = true;
        }
    }

}