xmlport 50100 ExportItemsXmlPor
{
    Format = xml;
    Direction = Export;
    // TextEncoding = UTF8;
    UseRequestPage = false;
    // TableSeparator = '';
    schema
    {
        textelement(Root)
        {
            tableelement(Integer; Integer)
            {
                XmlName = 'ItemHeader';
                SourceTableView = SORTING(Number) WHERE(Number = CONST(1));
                textelement(ItemNoTitle)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemNoTitle := Item.FieldCaption("api");
                    end;
                }
                textelement(ItemDescTitle)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemDescTitle := Item.FieldCaption(report_name_eng);
                    end;
                }
                textelement(ItemTypeTitle)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemTypeTitle := Item.FieldCaption(rate);
                    end;
                }
                textelement(ItemInventoryTitle)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemInventoryTitle := Item.FieldCaption(last_updated);
                    end;
                }

            }
            tableelement(Item; "Rates of Exchange")
            {
                XmlName = 'Item';
                fieldelement(No; Item."api")
                {
                }
                fieldelement(Description; Item.report_name_eng)
                {
                }
                fieldelement(Type; Item.rate)
                {
                }
                fieldelement(Inventory; Item.last_updated)
                {
                }
            }
        }
    }
}