query 50101 MyQuery2
{
    Caption = 'Test2 MyQuery';
    elements
    {
        dataitem(Cust_Ledger_Entry; "Cust. Ledger Entry")
        {

            filter(Customer_No; "Customer No.")
            {

            }

            column(Remaining_Amt_LCY; "Remaining Amt. (LCY)")
            {
                Method = Sum;
            }

            filter(Posting_Date; "Posting Date")
            {
            }
            filter(Due_Date; "Due Date")
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