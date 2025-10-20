.
├── backend/                      # Backend: Elysia + Prisma + PostgreSQL
│   ├── src/
│   │   ├── server.ts            # main server file
│   │   ├── routes/              # API routes
│   │   │   ├── auth.ts
│   │   │   ├── profile.ts
│   │   │   ├── recommendations.ts
│   │   │   └── stats.ts
│   │   └── services/
│   │       └── recommendation.ts
│   ├── prisma/
│   │   ├── schema.prisma        # database schema
│   │   └── seed.ts              # seed demo data
│   ├── package.json
│   ├── tsconfig.json
│   └── bun.lock
│
├── frontend/                     # Frontend: Next.js + TypeScript
│   ├── app/
│   │   ├── login/page.tsx
│   │   ├── profile/page.tsx
│   │   └── dashboard/page.tsx
│   ├── next.config.ts
│   ├── package.json
│   └── bun.lock
│
├── prompts/
│   ├── project_context.md       # Copilot Instruction file
│   └── build_prompt.json        # JSON prompt ใช้สั่ง Copilot สร้างระบบ
│
├── docker-compose.yml
└── README.md

# Project Context: Personalized Course Registration MVP

## Problem
Students often register for unsuitable courses due to diverse personal constraints:
- Some work part-time and need flexible schedules.
- Some live far and cannot attend every session.
- Some have prior knowledge, while others start from zero.
- Students vary in age, experience, and learning pace.

## Goal
Build an MVP web application that recommends personalized course registration plans based on each student's constraints, preferences, and prior knowledge.

## Core Features
1. User registration and login (JWT-based)
2. Profile questionnaire (time, commute, prior knowledge, learning preferences)
3. Rule-based course recommendation engine
4. Statistics and analytics overview
5. Personalized dashboard

## Tech Stack
- Runtime: Bun
- Frontend: Next.js (TypeScript)
- Backend: Elysia (TypeScript)
- Database: PostgreSQL + Prisma
- Infra: Docker + Docker Compose

## MVP Focus
- Prioritize backend API and database logic first.
- Keep frontend minimal (forms & JSON views) just for testing.
- All services must run together via Docker Compose.

## API Endpoints
- POST /auth/register
- POST /auth/login
- POST /profile/upsert
- POST /recommendations/generate
- GET  /plans/:id
- GET  /stats/overview

## Success Criteria
- Auth works (JWT)
- Recommendations include explanations
- No schedule conflicts
- Seed database with demo data
