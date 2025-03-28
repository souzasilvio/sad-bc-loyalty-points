To learn how to create an extension in Business Central while exploring different aspects like page extensions, table extensions, card extensions, code units, events, and reports, here's a simple and practical business case to work on:

### **Business Case: Add a Loyalty Points Program**
You will customize the system to add a "Loyalty Points" program for customers. This program will allow customers to earn loyalty points based on their purchases, and you can track and display these points on the customer card. The program will also include a report to summarize customer loyalty points.

---

### **Steps to Build This Extension**

#### **1. Extend the Customer Table**
- **Use Table Extension:** Add a new field to the `Customer` table to store the loyalty points, such as `LoyaltyPoints` (Decimal or Integer).
- Add other necessary fields, such as a boolean field to enable/disable the loyalty program for each customer.

---

#### **2. Extend the Customer Card Page**
- **Use Page Extension:** Update the `Customer Card` page to display the new `LoyaltyPoints` field and the enable/disable option.

---

#### **3. Create a Codeunit for Business Logic**
- **Codeunit:** Write a codeunit to handle the logic for adding loyalty points. For instance, when a sales order is posted, calculate loyalty points based on the total order value (e.g., 1 point per $10 spent).
- Add methods like `AddLoyaltyPoints(CustomerID: Code[20]; AmountSpent: Decimal)` and `ResetLoyaltyPoints(CustomerID: Code[20])`.

---

#### **4. Subscribe to Events**
- **Event Subscribers:** Use the `OnAfterSalesPost` event to trigger your loyalty points logic whenever a sales order is posted. Use `EventSubscriber` attributes to hook into this event.
- For example, call the `AddLoyaltyPoints` method from the codeunit.

---

#### **5. Create a Report**
- **Report Object:** Design a report to display a summary of loyalty points for all customers. Include fields like:
  - Customer Name
  - Customer ID
  - Loyalty Points Balance
- Use AL layout and RDLC or Word layouts for formatting.

---

#### **6. Package and Deploy**
- Use Visual Studio Code and AL Language to package all the above objects into an extension.
- Deploy the extension to your sandbox environment, test thoroughly, and publish.

---

### **Key AL Objects to Explore**
| **Object Type**      | **Purpose in This Case**                      |
|-----------------------|-----------------------------------------------|
| Table Extension       | Add new fields to the `Customer` table.      |
| Page Extension        | Modify the `Customer Card` to show fields.   |
| Codeunit              | Handle loyalty points calculations.          |
| Event Subscriptions   | React to posted sales transactions.          |
| Report                | Display loyalty points summary for customers.|

This case touches all key aspects while remaining simple enough for beginners. It also provides a foundation to build more complex logic over time, like redemption programs or tiered rewards. Let me know if you'd like help with writing specific AL code for any of these!
