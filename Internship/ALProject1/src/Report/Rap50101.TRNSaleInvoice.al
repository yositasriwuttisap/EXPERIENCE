report 50101 "TRN_Sale Invoice"
{
    Caption = 'TRN_Sale Invoice';
    UsageCategory = Administration;
    ApplicationArea = All;
    RDLCLayout = 'src\reportlayout\Rep50101.TRNSaleInvoice.rdl';
    DefaultLayout = RDLC;


    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = where(
                "Document Type" = filter(invoice));

            column(No_; "No.") { }
            column(sell_to_Customer_No_; "Sell-to Customer No.") { }
            column(sell_to_Customer_Name; "Sell-to Customer Name") { }
            column(Posting_Date; "Posting Date") { }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = field("Document Type"),
                               "Document No." = field("No.");

                column(ItemNo_; "No.") { }
                column(Description; "Description") { }
                column(Quantity; "Quantity") { }
                column(Unit_price; "Unit price") { }
            }

        }
    }
    /*
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {
                        ApplicationArea = All;
                        
                    }
                }
            }
        }
    
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                    
                }
            }
        }
    }
    
    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'mylayout.rdl';
        }
    }
    
    var
        myInt: Integer;*/
}