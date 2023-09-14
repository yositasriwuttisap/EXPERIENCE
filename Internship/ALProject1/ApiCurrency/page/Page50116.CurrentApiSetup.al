page 50116 "Current_API Setup"
{
    PageType = Card;
    SourceTable = "Current API Setup";
    UsageCategory = Administration;
    ApplicationArea = all;
    Caption = 'Current API Setup';



    layout
    {
        area(content)
        {
            group(General)
            {
                field("Base URL"; rec."Base URL")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Base URL';
                }
                field(UserID; rec."UserID")
                {
                    ApplicationArea = All;
                    Caption = 'UserID';
                    ExtendedDatatype = Masked;

                }
                field(Date1; rec."Date")
                {
                    ApplicationArea = All;
                    Caption = 'Date';

                }

            }
        }
    }


}