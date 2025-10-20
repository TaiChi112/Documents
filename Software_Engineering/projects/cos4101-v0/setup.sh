#!/bin/bash

# Course Registration MVP - Local Development Setup Script
# This script helps you set up and test the backend locally

echo "🎯 Course Registration MVP Backend Setup"
echo "======================================="

# Check if bun is installed
if ! command -v bun &> /dev/null; then
    echo "❌ Bun is not installed. Please install Bun first:"
    echo "   curl -fsSL https://bun.sh/install | bash"
    exit 1
fi

echo "✅ Bun is available"

# Navigate to backend directory
cd backend || {
    echo "❌ Backend directory not found"
    exit 1
}

echo "📦 Installing dependencies..."
bun install

# Check if PostgreSQL is running
echo "🗄️ Checking database connection..."
if ! nc -z localhost 5432 2>/dev/null; then
    echo "⚠️  PostgreSQL is not running on localhost:5432"
    echo ""
    echo "To set up the database:"
    echo "1. Install PostgreSQL locally, or"
    echo "2. Use Docker: docker run -d --name course-db -e POSTGRES_USER=courseapp -e POSTGRES_PASSWORD=courseapp123 -e POSTGRES_DB=course_registration -p 5432:5432 postgres:15"
    echo ""
    echo "Then create a .env file with:"
    echo "DATABASE_URL=\"postgresql://courseapp:courseapp123@localhost:5432/course_registration\""
    exit 1
fi

echo "✅ Database is accessible"

# Setup environment if not exists
if [ ! -f .env ]; then
    echo "⚙️  Creating .env file..."
    cp .env.example .env
    echo "✅ .env file created. Please review and adjust if needed."
fi

echo "🔧 Setting up database..."
bunx prisma generate
bunx prisma db push
bunx prisma db seed

echo ""
echo "🚀 Starting development server..."
echo "   API will be available at: http://localhost:3001"
echo "   Health check: curl http://localhost:3001/health"
echo ""
echo "📋 Demo accounts:"
echo "   alice.student@university.edu : password123"
echo "   bob.developer@university.edu : password123"
echo "   carol.remote@university.edu : password123"
echo ""

bun run dev