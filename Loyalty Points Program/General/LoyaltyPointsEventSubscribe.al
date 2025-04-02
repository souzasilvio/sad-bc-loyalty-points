codeunit 60003 "LoyaltyPointsEventSubscriber"
{
    [EventSubscriber(ObjectType::Codeunit, codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; SalesInvHdrNo: Code[20])
    var
        LoyaltyManager: Codeunit "LoyaltyPointsManager";
        AmountSpent: Decimal;
    begin
        AmountSpent := SalesHeader.Amount;
        Message('Invoice posted: %1, Amount: %2', SalesHeader."No.", AmountSpent); // Debug
        if AmountSpent > 0 then
            LoyaltyManager.AddLoyaltyPoints(SalesHeader."No.", AmountSpent)
        else
            Message('AmountSpent is zero or invalid for document %1', SalesHeader."No.");
    end;
}