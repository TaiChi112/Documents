#!/bin/bash

# Course Registration MVP - API Test Script
# This script tests all the main API endpoints

API_BASE="http://localhost:3001"
TEST_EMAIL="test.$(date +%s)@example.com"
TEST_PASSWORD="password123"

echo "🧪 Course Registration API Test Suite"
echo "====================================="

# Function to make API calls with better formatting
api_call() {
    local method=$1
    local endpoint=$2
    local data=$3
    local headers=$4
    
    echo ""
    echo "🔄 $method $endpoint"
    echo "───────────────────────────────"
    
    if [ -n "$data" ]; then
        if [ -n "$headers" ]; then
            curl -X $method "$API_BASE$endpoint" \
                -H "Content-Type: application/json" \
                -H "$headers" \
                -d "$data" \
                -w "\n\nStatus: %{http_code}\nTime: %{time_total}s\n" \
                -s | jq '.' 2>/dev/null || echo "Response: $(curl -X $method "$API_BASE$endpoint" -H "Content-Type: application/json" -H "$headers" -d "$data" -s)"
        else
            curl -X $method "$API_BASE$endpoint" \
                -H "Content-Type: application/json" \
                -d "$data" \
                -w "\n\nStatus: %{http_code}\nTime: %{time_total}s\n" \
                -s | jq '.' 2>/dev/null || echo "Response: $(curl -X $method "$API_BASE$endpoint" -H "Content-Type: application/json" -d "$data" -s)"
        fi
    else
        if [ -n "$headers" ]; then
            curl -X $method "$API_BASE$endpoint" \
                -H "$headers" \
                -w "\n\nStatus: %{http_code}\nTime: %{time_total}s\n" \
                -s | jq '.' 2>/dev/null || echo "Response: $(curl -X $method "$API_BASE$endpoint" -H "$headers" -s)"
        else
            curl -X $method "$API_BASE$endpoint" \
                -w "\n\nStatus: %{http_code}\nTime: %{time_total}s\n" \
                -s | jq '.' 2>/dev/null || echo "Response: $(curl -X $method "$API_BASE$endpoint" -s)"
        fi
    fi
}

# Check if API is running
echo "🏥 Health Check"
api_call "GET" "/health"

# Test API info
echo ""
echo "ℹ️  API Information"
api_call "GET" "/"

# Test user registration
echo ""
echo "👤 User Registration"
REGISTER_RESPONSE=$(curl -X POST "$API_BASE/auth/register" \
    -H "Content-Type: application/json" \
    -d "{\"email\":\"$TEST_EMAIL\",\"password\":\"$TEST_PASSWORD\"}" \
    -s)

echo $REGISTER_RESPONSE | jq '.' 2>/dev/null || echo "Response: $REGISTER_RESPONSE"

# Test user login with demo account
echo ""
echo "🔐 User Login (Demo Account)"
LOGIN_RESPONSE=$(curl -X POST "$API_BASE/auth/login" \
    -H "Content-Type: application/json" \
    -d '{"email":"alice.student@university.edu","password":"password123"}' \
    -s)

TOKEN=$(echo $LOGIN_RESPONSE | jq -r '.token' 2>/dev/null)
echo $LOGIN_RESPONSE | jq '.' 2>/dev/null || echo "Response: $LOGIN_RESPONSE"

if [ "$TOKEN" == "null" ] || [ -z "$TOKEN" ]; then
    echo "❌ Failed to get authentication token"
    exit 1
fi

echo "✅ Token obtained: ${TOKEN:0:20}..."

# Test authenticated endpoints
echo ""
echo "👤 Get Current User"
api_call "GET" "/auth/me" "" "Authorization: Bearer $TOKEN"

echo ""
echo "📋 Get Profile"
api_call "GET" "/profile" "" "Authorization: Bearer $TOKEN"

echo ""
echo "📊 Profile Completion Status"
api_call "GET" "/profile/completion" "" "Authorization: Bearer $TOKEN"

echo ""
echo "🎯 Generate Course Recommendations"
api_call "POST" "/recommendations/generate" \
    '{"semester":"2024-1","maxCredits":15}' \
    "Authorization: Bearer $TOKEN"

echo ""
echo "📈 Statistics Overview"
api_call "GET" "/stats/overview" "" "Authorization: Bearer $TOKEN"

echo ""
echo "📚 Course Statistics"
api_call "GET" "/stats/courses" "" "Authorization: Bearer $TOKEN"

echo ""
echo "📋 Recommendations List"
api_call "GET" "/recommendations" "" "Authorization: Bearer $TOKEN"

echo ""
echo "✅ API Test Suite Complete!"
echo ""
echo "🎯 Key Endpoints Tested:"
echo "   ✓ Health check"
echo "   ✓ User registration" 
echo "   ✓ User login"
echo "   ✓ Profile management"
echo "   ✓ Course recommendations"
echo "   ✓ Statistics and analytics"
echo ""
echo "📖 For more details, check the README.md file"