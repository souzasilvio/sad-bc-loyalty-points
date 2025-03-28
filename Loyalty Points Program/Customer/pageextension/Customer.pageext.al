pageextension 60001 CustomerCardExtension extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Loyalt Points"; Rec."LoyaltyPoints")
            {
                ToolTip = 'Customer Loyalt Points';
                ApplicationArea = All;
            }
        }
    }
}