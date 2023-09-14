page 50113 "BANK API Setup"
{
    PageType = Card;
    SourceTable = "BANK API Setup";
    UsageCategory = Administration;
    ApplicationArea = all;
    Caption = 'BANK API Setup';



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
            }
        }
    }


}