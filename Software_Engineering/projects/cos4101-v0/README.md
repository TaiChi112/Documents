# Course Registration MVP Backend

A personalized course registration system that recommends courses based on student constraints, preferences, and prior knowledge.

## 🚀 Quick Start with Docker

### Prerequisites

- Docker and Docker Compose installed
- WSL2 (for Windows users)

### 1. Start the Application

```bash
# Clone and navigate to the project
cd cos4101-v0

# Start all services with Docker Compose
docker-compose up -d

# Wait for services to be ready (about 30-60 seconds)
docker-compose logs -f backend
```

### 2. Access the Services

- **API Server**: http://localhost:3001
- **Database**: localhost:5432
- **pgAdmin** (Database UI): http://localhost:8080
  - Email: admin@courseapp.com
  - Password: admin123

### 3. Test the API

```bash
# Health check
curl http://localhost:3001/health

# API overview
curl http://localhost:3001/
```

## 🧪 Demo Accounts

The database is seeded with demo users:

| Email | Password | Profile |
|-------|----------|---------|
| `alice.student@university.edu` | `password123` | 2nd year, part-time worker, moderate pace |
| `bob.developer@university.edu` | `password123` | 3rd year, full-time student, fast pace |
| `carol.remote@university.edu` | `password123` | 4th year, working adult, prefers online |

## 📚 API Endpoints

### Authentication
```bash
# Register a new user
POST /auth/register
{
  "email": "user@example.com",
  "password": "password123"
}

# Login
POST /auth/login
{
  "email": "user@example.com", 
  "password": "password123"
}

# Get current user
GET /auth/me
Authorization: Bearer <token>
```

### Profile Management
```bash
# Create/Update profile
POST /profile/upsert
Authorization: Bearer <token>
{
  "fullName": "John Doe",
  "yearOfStudy": 2,
  "availableHours": 20,
  "preferredSchedule": "morning",
  "learningPace": "moderate",
  "primaryGoal": "graduation",
  "priorKnowledge": {
    "programming": 3,
    "math": 4
  }
}

# Get profile
GET /profile
Authorization: Bearer <token>

# Check profile completion
GET /profile/completion
Authorization: Bearer <token>
```

### Course Recommendations
```bash
# Generate recommendations
POST /recommendations/generate
Authorization: Bearer <token>
{
  "semester": "2024-1",
  "maxCredits": 18
}

# Get specific recommendation
GET /plans/{recommendationId}
Authorization: Bearer <token>

# List user's recommendations
GET /recommendations
Authorization: Bearer <token>

# Update recommendation status
PUT /recommendations/{id}/status
Authorization: Bearer <token>
{
  "status": "accepted"
}
```

### Statistics & Analytics
```bash
# Overview statistics
GET /stats/overview
Authorization: Bearer <token>

# Recommendation statistics
GET /stats/recommendations?period=month
Authorization: Bearer <token>

# Course statistics
GET /stats/courses
Authorization: Bearer <token>
```

## 🏗️ Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   PostgreSQL    │    │   Elysia API    │    │     Frontend    │
│   Database      │◄───┤   (Backend)     │◄───┤   (Next.js)     │
│                 │    │                 │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### Tech Stack

- **Runtime**: Bun
- **API Framework**: Elysia (TypeScript)
- **Database**: PostgreSQL + Prisma ORM
- **Authentication**: JWT tokens
- **Infrastructure**: Docker + Docker Compose

### Key Features

1. **JWT Authentication** - Secure user registration and login
2. **Profile Management** - Comprehensive user constraint collection
3. **Rule-Based Recommendations** - Smart course selection based on:
   - Academic year and prerequisites
   - Schedule preferences and conflicts
   - Workload capacity
   - Prior knowledge levels
   - Learning pace and goals
4. **Statistics & Analytics** - Track recommendation patterns and success
5. **RESTful API** - Clean, documented endpoints

## 🛠️ Development Setup

### Local Development (without Docker)

```bash
cd backend

# Install dependencies
bun install

# Setup environment
cp .env.example .env
# Edit DATABASE_URL to point to your local PostgreSQL

# Setup database
bunx prisma generate
bunx prisma db push
bunx prisma db seed

# Start development server
bun run dev
```

### Database Commands

```bash
# Generate Prisma client
bun run db:generate

# Push schema changes
bun run db:push

# Run migrations  
bun run db:migrate

# Seed database
bun run db:seed

# Reset database
bun run db:reset
```

## 🔍 Recommendation Algorithm

The system uses a rule-based scoring algorithm:

### Scoring Factors

1. **Course Category** (30 pts)
   - Core/Required courses get priority
   
2. **Academic Year Match** (15 pts)
   - Courses matching student's year level
   
3. **Schedule Compatibility** (10 pts)
   - Alignment with preferred time slots
   - No conflicts with existing selections
   
4. **Workload Balance** (10 pts)
   - Respect available study hours
   - Consider work commitments
   
5. **Prior Knowledge** (5-10 pts)
   - Match course difficulty to skill level
   - Prerequisites satisfaction
   
6. **Learning Preferences** (8 pts)
   - Learning pace compatibility
   - Online/onsite preferences

### Selection Algorithm

1. Score all available courses
2. Apply constraints (prerequisites, schedule conflicts)
3. Select optimal combination within credit limits
4. Generate explanations and warnings

## 🗄️ Database Schema

### Core Tables

- **Users** - Authentication and basic info
- **Profiles** - Student constraints and preferences  
- **Courses** - Course catalog with metadata
- **Recommendations** - Generated course plans
- **RecommendationCourses** - Many-to-many relationship

### Key Profile Fields

- Time constraints (available hours, work schedule)
- Location preferences (commute, online options)
- Learning style (pace, group size preferences)  
- Academic goals (GPA target, graduation year)
- Prior knowledge (skill levels by subject)

## 🚢 Production Deployment

### Environment Variables

```env
DATABASE_URL="postgresql://user:pass@host:5432/dbname"
JWT_SECRET="your-production-secret-minimum-32-chars"
NODE_ENV="production"
PORT=3001
```

### Docker Production Build

```bash
# Build production image
docker build -t course-registration-api ./backend

# Run with production environment
docker run -p 3001:3001 \
  -e DATABASE_URL="postgresql://..." \
  -e JWT_SECRET="..." \
  -e NODE_ENV="production" \
  course-registration-api
```

## 📊 Monitoring & Health

- **Health Check**: `GET /health`
- **API Overview**: `GET /`
- **Docker Health**: Automatic container health monitoring
- **Database Connection**: Connection pooling and error handling

## 🔐 Security Features

- Password hashing with bcrypt
- JWT token authentication  
- CORS configuration
- Input validation with Zod schemas
- SQL injection protection via Prisma
- Rate limiting ready (can be added)

## 🧪 Testing

```bash
# Example API tests using curl

# Test registration
curl -X POST http://localhost:3001/auth/register \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"password123"}'

# Test login and get token
TOKEN=$(curl -X POST http://localhost:3001/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"alice.student@university.edu","password":"password123"}' \
  | jq -r '.token')

# Test profile creation
curl -X POST http://localhost:3001/profile/upsert \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"fullName":"Test User","yearOfStudy":2,"availableHours":20}'

# Test recommendation generation
curl -X POST http://localhost:3001/recommendations/generate \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"semester":"2024-1","maxCredits":15}'
```

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## 📄 License

This project is licensed under the MIT License.

---

**🎯 Ready to test?** Start with `docker-compose up -d` and explore the API using the demo accounts!