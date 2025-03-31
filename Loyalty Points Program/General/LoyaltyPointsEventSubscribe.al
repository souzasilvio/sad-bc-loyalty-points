codeunit 60003 "LoyaltyPointsEventSubscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20])
    var
        LoyaltyManager: Codeunit "LoyaltyPointsManager";
        AmountSpent: Decimal;
    begin
        
        Message('Event fired for document: %1', SalesHeader."No.");

        AmountSpent := SalesHeader.Amount;
        LoyaltyManager.AddLoyaltyPoints(SalesHeader."Bill-to Customer No.", AmountSpent);
    end;


}