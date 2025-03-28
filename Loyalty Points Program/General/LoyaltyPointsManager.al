codeunit 60002 LoyaltyPointsManager
{
    Subtype = Normal;

    // Procedure to add loyalty points to a customer
    procedure AddLoyaltyPoints(CustomerID: Code[20]; AmountSpent: Decimal)
    var
        Customer: Record Customer; // Reference to Customer table
    begin
        if Customer.Get(CustomerID) then begin
            Customer.LoyaltyPoints += CalculatePoints(AmountSpent); // Update Loyalty Points
            Customer.Modify(); // Save changes
        end else
            Error('Customer ID %1 not found.', CustomerID);
    end;

    // Procedure to reset loyalty points for a customer
    procedure ResetLoyaltyPoints(CustomerID: Code[20])
    var
        Customer: Record Customer; // Reference to Customer table
    begin
        if Customer.Get(CustomerID) then begin
            Customer.LoyaltyPoints := 0; // Reset Loyalty Points
            Customer.Modify(); // Save changes
        end else
            Error('Customer ID %1 not found.', CustomerID);
    end;

    // Private function to calculate loyalty points based on amount spent
    local procedure CalculatePoints(AmountSpent: Decimal): Decimal
    begin
        exit(AmountSpent / 10); // 1 point for every 10 units of currency spent
    end;
}