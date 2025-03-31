codeunit 60003 "LoyaltyPointsEventSubscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20])
    var
        LoyaltyManager: Codeunit "LoyaltyPointsManager";
        SalesInvHeader: Record "Sales Invoice Header";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        AmountSpent: Decimal;
    begin
        // Check if an invoice was posted
        if SalesInvHdrNo <> '' then begin
            if SalesInvHeader.Get(SalesInvHdrNo) then begin
                AmountSpent := SalesInvHeader.Amount;
                Message('Invoice posted: %1, Amount: %2', SalesInvHdrNo, AmountSpent); // Debug
            end else
                Message('Invoice %1 not found.', SalesInvHdrNo);
        end
        // Check if a credit memo was posted
        else if SalesCrMemoHdrNo <> '' then begin
            if SalesCrMemoHeader.Get(SalesCrMemoHdrNo) then begin
                AmountSpent := SalesCrMemoHeader.Amount;
                Message('Credit Memo posted: %1, Amount: %2', SalesCrMemoHdrNo, AmountSpent); // Debug
            end else
                Message('Credit Memo %1 not found.', SalesCrMemoHdrNo);
        end
        // Fallback if no posted document (unlikely in this event)
        else begin
            Message('No posted document found for %1. SalesHeader Amount: %2', SalesHeader."No.", SalesHeader.Amount);
            AmountSpent := SalesHeader.Amount; // May still be 0
        end;

        // Add loyalty points if amount is valid
        if AmountSpent > 0 then
            LoyaltyManager.AddLoyaltyPoints(SalesHeader."Bill-to Customer No.", AmountSpent)
        else
            Message('AmountSpent is zero or invalid for document %1', SalesHeader."No.");
    end;
}