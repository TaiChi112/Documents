/my-microservices-app
├── package.json          # จัดการ dependencies ของ Bun workspaces
├── tsconfig.json         # Global TypeScript config
├── bun.lockb
├── /apps
│   ├── /frontend-web     # Next.js 15 Frontend (Client Application)
│   │   ├── app/
│   │   ├── public/
│   │   ├── components/
│   │   ├── styles/
│   │   ├── next.config.mjs
│   │   ├── package.json
│   │   └── tsconfig.json
│   ├── /user-service     # Microservice สำหรับจัดการผู้ใช้
│   │   ├── src/
│   │   │   ├── controllers/
│   │   │   ├── services/
│   │   │   ├── models/
│   │   │   ├── routes/
│   │   │   └── index.ts  # Express app entry point
│   │   ├── prisma/
│   │   │   └── schema.prisma # Dedicated DB schema (แนะนำ)
│   │   ├── package.json
│   │   └── tsconfig.json
│   ├── /product-service  # Microservice สำหรับจัดการสินค้า
│   │   ├── src/
│   │   │   ├── ... (เหมือน user-service)
│   │   ├── prisma/
│   │   │   └── schema.prisma
│   │   ├── package.json
│   │   └── tsconfig.json
│   ├── /order-service    # Microservice สำหรับจัดการคำสั่งซื้อ
│   │   ├── src/
│   │   │   ├── ...
│   │   ├── package.json
│   │   └── tsconfig.json
│   └── /api-gateway      # (Optional) API Gateway สำหรับรวม Request และจัดการ Authentication
│       │   ├── src/
│       │   │   └── index.ts # Proxy requests, authentication, rate limiting
│       │   ├── package.json
│       │   └── tsconfig.json
└── /packages             # โค้ดที่ใช้ร่วมกัน (Shared)
    ├── /shared-types     # Shared interfaces, enums, DTOs (สำคัญมาก)
    │   ├── src/
    │   │   └── index.ts  # เช่น UserDto, ProductDto, OrderDto interfaces
    │   ├── package.json
    │   └── tsconfig.json
    ├── /shared-lib       # (Optional) Utilities หรือ components ที่ใช้ร่วมกัน
    │   ├── src/
    │   │   └── ...
    │   ├── package.json
    │   └── tsconfig.json