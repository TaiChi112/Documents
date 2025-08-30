### Use Case Name:
บันทึกข้อมูลใบสั่งซื้อ (Save Order Information)

### Actor:
- Customer
- System

### Preconditions:
- Customer has logged in.
- Customer has added items to the cart.
- Customer has confirmed the order.

### Main Flow:
1. Customer clicks "Confirm Order."
2. System validates the order details (e.g., product availability, total amount).
3. System generates a unique order ID.
4. System saves the order information (e.g., order ID, customer details, product details, total amount).
5. System displays the order confirmation page to the customer.

### Postconditions:
- Order information is saved in the database.
- Customer receives an order confirmation.

### Exceptions:
- If product is out of stock, system notifies the customer.
- If payment fails, system cancels the order.