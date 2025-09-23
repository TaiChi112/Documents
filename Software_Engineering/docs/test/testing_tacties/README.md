## Testing Methods Application at the Class Level

การทดสอบในระดับ Class Level เป็นการทดสอบที่มุ่งเน้นไปที่การทดสอบคลาสเดียวๆ อย่างแยกจากระบบ โดยจะทดสอบ:

### 1. Unit Testing (การทดสอบหน่วย)
- ทดสอบ methods แต่ละตัวของ class
- ทดสอบการทำงานของ attributes
- ทดสอบ constructors และ destructors
- ทดสอบ getters และ setters

### 2. State-based Testing (การทดสอบสถานะ)
- ทดสอบการเปลี่ยนแปลงสถานะของ object
- ทดสอบ state transitions
- ตรวจสอบ invariants ของ class

### 3. Behavior Testing (การทดสอบพฤติกรรม)
- ทดสอบว่า class มีพฤติกรรมตามที่ออกแบบไว้หรือไม่
- ทดสอบ preconditions และ postconditions

### ตัวอย่าง Code และการทดสอบ:

```typescript
// คลาสตัวอย่าง: ShoppingCart (รถเข็นสินค้า)
export class Product {
    constructor(
        public id: string,
        public name: string,
        public price: number,
        public category: string
    ) {}

    getDisplayName(): string {
        return `${this.name} (${this.category})`;
    }

    isExpensive(): boolean {
        return this.price > 1000;
    }
}

export class ShoppingCart {
    private items: Map<string, { product: Product; quantity: number }> = new Map();
    private discountPercent: number = 0;

    constructor(public customerId: string) {}

    addItem(product: Product, quantity: number = 1): void {
        if (quantity <= 0) {
            throw new Error("Quantity must be positive");
        }

        const existingItem = this.items.get(product.id);
        if (existingItem) {
            existingItem.quantity += quantity;
        } else {
            this.items.set(product.id, { product, quantity });
        }
    }

    removeItem(productId: string): boolean {
        return this.items.delete(productId);
    }

    updateQuantity(productId: string, newQuantity: number): void {
        if (newQuantity <= 0) {
            throw new Error("Quantity must be positive");
        }

        const item = this.items.get(productId);
        if (!item) {
            throw new Error("Product not found in cart");
        }

        item.quantity = newQuantity;
    }

    getTotalPrice(): number {
        let total = 0;
        for (const { product, quantity } of this.items.values()) {
            total += product.price * quantity;
        }
        return total * (1 - this.discountPercent / 100);
    }

    getItemCount(): number {
        let count = 0;
        for (const { quantity } of this.items.values()) {
            count += quantity;
        }
        return count;
    }

    applyDiscount(percent: number): void {
        if (percent < 0 || percent > 100) {
            throw new Error("Discount percent must be between 0 and 100");
        }
        this.discountPercent = percent;
    }

    getItems(): Array<{ product: Product; quantity: number }> {
        return Array.from(this.items.values());
    }

    clear(): void {
        this.items.clear();
        this.discountPercent = 0;
    }

    isEmpty(): boolean {
        return this.items.size === 0;
    }
}

// การทดสอบในระดับ Class Level ด้วย Jest
import { ShoppingCart, Product } from './ShoppingCart';

describe('Product Class Tests', () => {
    let product: Product;

    beforeEach(() => {
        product = new Product('P001', 'MacBook Pro', 65000, 'Electronics');
    });

    test('should create product with correct properties', () => {
        expect(product.id).toBe('P001');
        expect(product.name).toBe('MacBook Pro');
        expect(product.price).toBe(65000);
        expect(product.category).toBe('Electronics');
    });

    test('should return correct display name', () => {
        const displayName = product.getDisplayName();
        expect(displayName).toBe('MacBook Pro (Electronics)');
    });

    test('should correctly identify expensive products', () => {
        expect(product.isExpensive()).toBe(true);
        
        const cheapProduct = new Product('P002', 'Mouse', 500, 'Electronics');
        expect(cheapProduct.isExpensive()).toBe(false);
    });
});

describe('ShoppingCart Class Tests', () => {
    let cart: ShoppingCart;
    let product1: Product;
    let product2: Product;

    beforeEach(() => {
        cart = new ShoppingCart('customer123');
        product1 = new Product('P001', 'MacBook Pro', 65000, 'Electronics');
        product2 = new Product('P002', 'Mouse', 500, 'Electronics');
    });

    test('should create empty cart with customer ID', () => {
        expect(cart.customerId).toBe('customer123');
        expect(cart.isEmpty()).toBe(true);
        expect(cart.getItemCount()).toBe(0);
        expect(cart.getTotalPrice()).toBe(0);
    });

    test('should add single item to cart', () => {
        cart.addItem(product1);
        
        expect(cart.isEmpty()).toBe(false);
        expect(cart.getItemCount()).toBe(1);
        expect(cart.getTotalPrice()).toBe(65000);
    });

    test('should add multiple quantities of same item', () => {
        cart.addItem(product1, 2);
        
        expect(cart.getItemCount()).toBe(2);
        expect(cart.getTotalPrice()).toBe(130000);
    });

    test('should throw error for invalid quantity', () => {
        expect(() => cart.addItem(product1, 0)).toThrow('Quantity must be positive');
        expect(() => cart.addItem(product1, -1)).toThrow('Quantity must be positive');
    });

    test('should update existing item quantity when adding same product', () => {
        cart.addItem(product1, 1);
        cart.addItem(product1, 2);
        
        expect(cart.getItemCount()).toBe(3);
        expect(cart.getTotalPrice()).toBe(195000);
    });

    test('should remove item from cart', () => {
        cart.addItem(product1);
        cart.addItem(product2);
        
        const removed = cart.removeItem('P001');
        
        expect(removed).toBe(true);
        expect(cart.getItemCount()).toBe(1);
        expect(cart.getTotalPrice()).toBe(500);
    });

    test('should return false when removing non-existent item', () => {
        const removed = cart.removeItem('nonexistent');
        expect(removed).toBe(false);
    });

    test('should update item quantity', () => {
        cart.addItem(product1, 1);
        cart.updateQuantity('P001', 3);
        
        expect(cart.getItemCount()).toBe(3);
        expect(cart.getTotalPrice()).toBe(195000);
    });

    test('should throw error when updating quantity of non-existent item', () => {
        expect(() => cart.updateQuantity('nonexistent', 2))
            .toThrow('Product not found in cart');
    });

    test('should apply discount correctly', () => {
        cart.addItem(product1);
        cart.applyDiscount(10);
        
        expect(cart.getTotalPrice()).toBe(58500); // 65000 * 0.9
    });

    test('should throw error for invalid discount percentage', () => {
        expect(() => cart.applyDiscount(-5)).toThrow('Discount percent must be between 0 and 100');
        expect(() => cart.applyDiscount(101)).toThrow('Discount percent must be between 0 and 100');
    });

    test('should clear cart completely', () => {
        cart.addItem(product1);
        cart.addItem(product2);
        cart.applyDiscount(10);
        
        cart.clear();
        
        expect(cart.isEmpty()).toBe(true);
        expect(cart.getItemCount()).toBe(0);
        expect(cart.getTotalPrice()).toBe(0);
    });

    test('should maintain state consistency across multiple operations', () => {
        cart.addItem(product1, 2);
        cart.addItem(product2, 3);
        cart.applyDiscount(15);
        cart.updateQuantity('P002', 1);
        
        // Expected: (65000 * 2 + 500 * 1) * 0.85 = 130500 * 0.85 = 110925
        expect(cart.getTotalPrice()).toBe(110925);
        expect(cart.getItemCount()).toBe(3);
    });
});
```

**การอธิบายการทดสอบ:**
- `Product Class Tests`: ทดสอบคลาส Product แยกต่างหาก
  - `should create product with correct properties`: ทดสอบ constructor และ properties
  - `should return correct display name`: ทดสอบ method getDisplayName()
  - `should correctly identify expensive products`: ทดสอบ business logic
- `ShoppingCart Class Tests`: ทดสอบคลาส ShoppingCart
  - `should create empty cart`: ทดสอบ initial state
  - `should add single item`: ทดสอบการเพิ่มสินค้า
  - `should throw error for invalid quantity`: ทดสอบ input validation
  - `should update existing item quantity`: ทดสอบการอัพเดท quantity
  - `should remove item from cart`: ทดสอบการลบสินค้า
  - `should apply discount correctly`: ทดสอบการคิดส่วนลด
  - `should maintain state consistency`: ทดสอบความสอดคล้องของสถานะ

## Inter-Class Test Case Design

การทดสอบระหว่างคลาส (Inter-Class Testing) เป็นการทดสอบที่มุ่งเน้นไปที่:

### 1. Integration Testing (การทดสอบการรวมระบบ)
- ทดสอบการสื่อสารระหว่างคลาส
- ทดสอบ interfaces ระหว่างคลาส
- ทดสอบ data flow ระหว่าง objects

### 2. Collaboration Testing (การทดสอบการทำงานร่วมกัน)
- ทดสอบการทำงานร่วมกันของหลาย objects
- ทดสอบ message passing
- ทดสอบ dependency relationships

### 3. Contract Testing (การทดสอบสัญญา)
- ทดสอบการปฏิบัติตาม interfaces
- ทดสอบ preconditions และ postconditions ระหว่างคลาส

### ตัวอย่าง Code และการทดสอบ:

```typescript
// ระบบร้านค้าออนไลน์ที่มีหลายคลาสทำงานร่วมกัน

export class User {
    constructor(
        public id: string,
        public name: string,
        public email: string,
        public membershipLevel: 'bronze' | 'silver' | 'gold' = 'bronze'
    ) {}

    getDiscountRate(): number {
        switch (this.membershipLevel) {
            case 'gold': return 0.15;
            case 'silver': return 0.10;
            case 'bronze': return 0.05;
            default: return 0;
        }
    }
}

export class OrderService {
    private orders: Map<string, Order> = new Map();
    private orderCounter: number = 1;

    createOrder(user: User, cart: ShoppingCart): Order {
        if (cart.isEmpty()) {
            throw new Error("Cannot create order from empty cart");
        }

        const orderId = `ORD${this.orderCounter.toString().padStart(3, '0')}`;
        this.orderCounter++;

        const order = new Order(orderId, user, cart.getItems());
        
        // Apply user discount
        const userDiscount = user.getDiscountRate() * 100;
        order.applyDiscount(userDiscount);
        
        this.orders.set(orderId, order);
        return order;
    }

    getOrder(orderId: string): Order | undefined {
        return this.orders.get(orderId);
    }

    getUserOrders(userId: string): Order[] {
        return Array.from(this.orders.values())
            .filter(order => order.user.id === userId);
    }

    calculateTotalRevenue(): number {
        return Array.from(this.orders.values())
            .reduce((total, order) => total + order.getTotalAmount(), 0);
    }
}

export class Order {
    private status: 'pending' | 'confirmed' | 'shipped' | 'delivered' = 'pending';
    private discountPercent: number = 0;
    private createdAt: Date = new Date();

    constructor(
        public id: string,
        public user: User,
        private items: Array<{ product: Product; quantity: number }>
    ) {}

    applyDiscount(percent: number): void {
        if (percent < 0 || percent > 100) {
            throw new Error("Discount percent must be between 0 and 100");
        }
        this.discountPercent = percent;
    }

    getTotalAmount(): number {
        const subtotal = this.items.reduce((total, item) => 
            total + (item.product.price * item.quantity), 0
        );
        return subtotal * (1 - this.discountPercent / 100);
    }

    getItemCount(): number {
        return this.items.reduce((count, item) => count + item.quantity, 0);
    }

    updateStatus(newStatus: 'pending' | 'confirmed' | 'shipped' | 'delivered'): void {
        this.status = newStatus;
    }

    getStatus(): string {
        return this.status;
    }

    getItems(): Array<{ product: Product; quantity: number }> {
        return [...this.items]; // Return copy to prevent external modification
    }
}

// การทดสอบระหว่างคลาสด้วย Jest
import { User, ShoppingCart, OrderService, Order, Product } from './OnlineStore';

describe('Inter-Class Integration Tests', () => {
    let user: User;
    let cart: ShoppingCart;
    let orderService: OrderService;
    let product1: Product;
    let product2: Product;

    beforeEach(() => {
        user = new User('U001', 'John Doe', 'john@email.com', 'silver');
        cart = new ShoppingCart('U001');
        orderService = new OrderService();
        
        product1 = new Product('P001', 'MacBook Pro', 65000, 'Electronics');
        product2 = new Product('P002', 'Wireless Mouse', 1500, 'Electronics');
    });

    describe('User and Order Integration', () => {
        test('should apply user discount to order', () => {
            cart.addItem(product1);
            const order = orderService.createOrder(user, cart);
            
            // Silver user gets 10% discount
            const expectedTotal = 65000 * 0.9; // 58500
            expect(order.getTotalAmount()).toBe(expectedTotal);
        });

        test('should handle different membership levels', () => {
            const goldUser = new User('U002', 'Jane Smith', 'jane@email.com', 'gold');
            cart.addItem(product1);
            
            const orderForGold = orderService.createOrder(goldUser, cart);
            const orderForSilver = orderService.createOrder(user, cart);
            
            // Gold: 15% discount, Silver: 10% discount
            expect(orderForGold.getTotalAmount()).toBe(65000 * 0.85); // 55250
            expect(orderForSilver.getTotalAmount()).toBe(65000 * 0.9);  // 58500
        });
    });

    describe('ShoppingCart and Order Integration', () => {
        test('should create order from cart items', () => {
            cart.addItem(product1, 2);
            cart.addItem(product2, 1);
            
            const order = orderService.createOrder(user, cart);
            
            expect(order.getItemCount()).toBe(3);
            expect(order.getItems()).toHaveLength(2);
            expect(order.user).toBe(user);
        });

        test('should throw error when creating order from empty cart', () => {
            expect(() => orderService.createOrder(user, cart))
                .toThrow('Cannot create order from empty cart');
        });
    });

    describe('OrderService Integration', () => {
        test('should manage multiple orders correctly', () => {
            const user2 = new User('U002', 'Jane Smith', 'jane@email.com');
            const cart2 = new ShoppingCart('U002');
            
            // Create orders
            cart.addItem(product1);
            cart2.addItem(product2, 2);
            
            const order1 = orderService.createOrder(user, cart);
            const order2 = orderService.createOrder(user2, cart2);
            
            // Test order retrieval
            expect(orderService.getOrder(order1.id)).toBe(order1);
            expect(orderService.getOrder(order2.id)).toBe(order2);
            
            // Test user-specific orders
            const user1Orders = orderService.getUserOrders('U001');
            expect(user1Orders).toHaveLength(1);
            expect(user1Orders[0]).toBe(order1);
        });

        test('should calculate total revenue correctly', () => {
            const user2 = new User('U002', 'Jane Smith', 'jane@email.com');
            const cart2 = new ShoppingCart('U002');
            
            cart.addItem(product1); // 65000 * 0.9 = 58500 (silver discount)
            cart2.addItem(product2); // 1500 * 0.95 = 1425 (bronze discount)
            
            orderService.createOrder(user, cart);
            orderService.createOrder(user2, cart2);
            
            const totalRevenue = orderService.calculateTotalRevenue();
            expect(totalRevenue).toBe(58500 + 1425); // 59925
        });
    });

    describe('Complex Integration Scenarios', () => {
        test('should handle complete purchase workflow', () => {
            // Add items to cart
            cart.addItem(product1, 1);
            cart.addItem(product2, 2);
            
            // Create order
            const order = orderService.createOrder(user, cart);
            
            // Verify order details
            expect(order.getStatus()).toBe('pending');
            expect(order.getItemCount()).toBe(3);
            expect(order.user.membershipLevel).toBe('silver');
            
            // Update order status
            order.updateStatus('confirmed');
            order.updateStatus('shipped');
            
            expect(order.getStatus()).toBe('shipped');
            
            // Verify order is tracked in service
            const retrievedOrder = orderService.getOrder(order.id);
            expect(retrievedOrder?.getStatus()).toBe('shipped');
        });

        test('should maintain data consistency across objects', () => {
            cart.addItem(product1, 2);
            const order = orderService.createOrder(user, cart);
            
            // Verify data consistency
            const orderItems = order.getItems();
            expect(orderItems[0].product.id).toBe(product1.id);
            expect(orderItems[0].product.name).toBe(product1.name);
            expect(orderItems[0].quantity).toBe(2);
            
            // Verify user reference
            expect(order.user.id).toBe(user.id);
            expect(order.user.email).toBe(user.email);
            
            // Verify order is in service
            const userOrders = orderService.getUserOrders(user.id);
            expect(userOrders).toContain(order);
        });
    });

    describe('Error Handling Integration', () => {
        test('should handle invalid operations gracefully', () => {
            cart.addItem(product1);
            const order = orderService.createOrder(user, cart);
            
            // Test invalid discount
            expect(() => order.applyDiscount(-10))
                .toThrow('Discount percent must be between 0 and 100');
            
            // Test non-existent order retrieval
            expect(orderService.getOrder('INVALID')).toBeUndefined();
        });
    });
});

// Mock Testing สำหรับการทดสอบแบบแยกส่วน
describe('Mocking Integration Tests', () => {
    test('should work with mocked dependencies', () => {
        // Mock ShoppingCart
        const mockCart = {
            isEmpty: jest.fn().mockReturnValue(false),
            getItems: jest.fn().mockReturnValue([
                { product: new Product('P001', 'Test Product', 1000, 'Test'), quantity: 2 }
            ])
        } as unknown as ShoppingCart;

        // Mock User
        const mockUser = {
            id: 'MOCK_USER',
            name: 'Mock User',
            email: 'mock@test.com',
            membershipLevel: 'gold' as const,
            getDiscountRate: jest.fn().mockReturnValue(0.15)
        } as unknown as User;

        const orderService = new OrderService();
        const order = orderService.createOrder(mockUser, mockCart);

        // Verify mocks were called
        expect(mockCart.isEmpty).toHaveBeenCalled();
        expect(mockCart.getItems).toHaveBeenCalled();
        expect(mockUser.getDiscountRate).toHaveBeenCalled();

        // Verify order was created correctly
        expect(order.user).toBe(mockUser);
        expect(order.getTotalAmount()).toBe(1700); // 2000 * 0.85 (15% discount)
    });
});
```

**การอธิบายการทดสอบระหว่างคลาส:**

- `User and Order Integration`: ทดสอบความสัมพันธ์ระหว่าง User และ Order
  - `should apply user discount to order`: ทดสอบการใช้ข้อมูล user ในการคิดส่วนลด
  - `should handle different membership levels`: ทดสอบ business logic ของระดับสมาชิก
- `ShoppingCart and Order Integration`: ทดสอบการทำงานร่วมกันระหว่าง Cart และ Order  
  - `should create order from cart items`: ทดสอบการสร้าง order จาก cart
  - `should throw error when creating order from empty cart`: ทดสอบ validation
- `OrderService Integration`: ทดสอบการจัดการ orders ผ่าน service
  - `should manage multiple orders correctly`: ทดสอบการจัดการหลาย orders
  - `should calculate total revenue correctly`: ทดสอบการคำนวณรายได้รวม
- `Complex Integration Scenarios`: ทดสอบ workflow ที่ซับซ้อน
  - `should handle complete purchase workflow`: ทดสอบกระบวนการซื้อสินค้าทั้งหมด
  - `should maintain data consistency across objects`: ทดสอบความสอดคล้องของข้อมูล
- `Error Handling Integration`: ทดสอบการจัดการข้อผิดพลาดระหว่างคลาส
- `Mocking Integration Tests`: ทดสอบด้วย Mock objects เพื่อแยกส่วนการทดสอบ

### Jest Configuration และ Setup:

```json
// package.json
{
  "name": "online-store-testing",
  "version": "1.0.0",
  "scripts": {
    "test": "jest",
    "test:watch": "jest --watch",
    "test:coverage": "jest --coverage"
  },
  "devDependencies": {
    "@types/jest": "^29.5.0",
    "jest": "^29.5.0",
    "ts-jest": "^29.1.0",
    "typescript": "^5.0.0"
  }
}
```

```javascript
// jest.config.js
module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  roots: ['<rootDir>/src'],
  testMatch: ['**/__tests__/**/*.ts', '**/?(*.)+(spec|test).ts'],
  collectCoverageFrom: [
    'src/**/*.ts',
    '!src/**/*.d.ts',
  ],
  coverageDirectory: 'coverage',
  coverageReporters: ['text', 'lcov', 'html']
};
```

### ประโยชน์ของการทดสอบระหว่างคลาส:
1. **ตรวจจับข้อผิดพลาดในการสื่อสار**: หาปัญหาในการส่งข้อมูลระหว่างคลาส
2. **ตรวจสอบ Integration Points**: ทดสอบจุดเชื่อมต่อระหว่างส่วนต่างๆ
3. **ความสอดคล้องของข้อมูล**: ตรวจสอบว่าข้อมูลสอดคล้องกันทั่วทั้งระบบ
4. **การจัดการ Dependencies**: ทดสอบการพึ่งพาระหว่างคลาส
