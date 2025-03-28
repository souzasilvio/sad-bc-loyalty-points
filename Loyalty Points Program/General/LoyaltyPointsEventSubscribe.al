codeunit 60003 "LoyaltyPointsEventSubscriber"
{
    // Subscribe to the sales-post event published by the Sales Posting codeunit.
    // Adjust the ObjectType, Publisher codeunit, event name, and parameters as needed.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header")
    var
        LoyaltyManager: Codeunit "LoyaltyPointsManager";
        AmountSpent: Decimal;
    begin
        // Retrieve the amount from the sales document.
        // Here we use the "Total Amount" field as an example.
        AmountSpent := SalesHeader.Amount;

        // Call the business logic to add loyalty points.
        LoyaltyManager.AddLoyaltyPoints(SalesHeader."Bill-to Customer No.", AmountSpent);
    end;
}