report 50100 "TRN_Customer List"
{
    Caption = 'Customer List';
    UsageCategory = Administration;
    ApplicationArea = All;
    RDLCLayout = 'src\reportlayout\Rep50100.CustomerList.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.") { }
            column(Name; "Name") { }
            column(Address; "Address") { }
            column(Credit_Limit__LCY_; "Credit Limit (LCY)") { }
            column(Last_Date_Modified; "Last Date Modified") { }
        }
    }
}