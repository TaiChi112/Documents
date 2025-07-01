/my-monolith-app
├── package.json          # จัดการ dependencies ของ Bun workspaces
├── tsconfig.json         # Global TypeScript config
├── bun.lockb             # Lock file ของ Bun
├── /apps
│   ├── /frontend         # Next.js 15 Frontend
│   │   ├── app/          # Next.js App Router
│   │   ├── public/
│   │   ├── components/
│   │   ├── styles/
│   │   ├── next.config.mjs
│   │   ├── package.json  # Dependencies เฉพาะ frontend
│   │   └── tsconfig.json # TypeScript config เฉพาะ frontend
│   └── /backend          # Express Backend ( monolith service เดียว)
│       ├── src/
│       │   ├── controllers/
│       │   ├── services/
│       │   ├── models/   # เช่น Prisma schema หรือ ORM models
│       │   ├── routes/
│       │   ├── middlewares/
│       │   ├── utils/
│       │   ├── app.ts    # Main Express app
│       │   └── index.ts  # Entry point
│       ├── prisma/       # ถ้าใช้ Prisma ORM
│       │   └── schema.prisma
│       ├── package.json  # Dependencies เฉพาะ backend
│       └── tsconfig.json # TypeScript config เฉพาะ backend
├── /packages             # โค้ดที่ใช้ร่วมกัน (Shared)
│   ├── /shared-types     # Shared interfaces, enums, DTOs
│   │   ├── src/
│   │   │   └── index.ts  # Export interfaces เช่น User, Product
│   │   ├── package.json
│   │   └── tsconfig.json
│   ├── /shared-utils     # Shared utility functions (ถ้ามี)
│   │   ├── src/
│   │   │   └── index.ts
│   │   ├── package.json
│   │   └── tsconfig.json