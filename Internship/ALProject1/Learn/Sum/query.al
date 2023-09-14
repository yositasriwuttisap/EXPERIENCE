query 50100 MyQuery
{
    Caption = 'Test MyQuery';
    elements
    {
        dataitem(Cust_Ledger_Entry; "Cust. Ledger Entry")
        {

            column(Customer_No; "Customer No.")
            {

            }

            column(Remaining_Amt_LCY; "Remaining Amt. (LCY)")
            {

            }

            column(Posting_Date; "Posting Date")
            {
            }
            column(Due_Date; "Due Date")
            {
            }
            dataitem(Customer; Customer)
            {
                DataItemLink = "No." = Cust_Ledger_Entry."Customer No.";
                column(Customer_Name; Name)
                {
                }
            }


        }
    }
}