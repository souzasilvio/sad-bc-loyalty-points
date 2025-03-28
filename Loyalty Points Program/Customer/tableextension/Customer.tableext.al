tableextension 60001 CustomerExtension extends Customer
{
    fields
    {
        field(60001; LoyaltyPoints; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Loyalty Points';
            trigger OnValidate();
            begin
                if (rec.LoyaltyPoints < 0) then begin
                    message('Loyalty Points invalid: %1', rec.LoyaltyPoints);
                end;
            end;
        }
    }

}