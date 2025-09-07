```json
{
  // [REQUIRED] The core project specification.
  "project": {
    "name": "my-task-api", // Name of your project
    "description": "A RESTful API for managing tasks.",
    "framework": "express.js", // Primary backend framework. Options: "express.js", "django", "springboot", "nestjs", "fastapi", etc.
    "language": "Typescript" // Programming language. Should align with the chosen framework.
  },
  // [REQUIRED] Database configuration. Omit entirely if using an in-memory array or external service.
  "database": {
    "type": "Postgresql", // Database type. Options: "sqlite", "postgresql", "mysql", "mongodb", "none"
    "orm": "prisma" // ORM/ODM to use. Options: "prisma", "sequelize", "mongoose", "typeorm", "raw" (for raw queries)
    // Add other database-specific connection properties here as needed (e.g., "host", "port", "dbName").
    // "custom_config": { "host": "localhost", "port": 5432 }
  },
  // [REQUIRED] Define your data models. Each key is the model name.
  "models": {
    "Task": {
      "fields": {
        "id": { "type": "integer", "primaryKey": true, "autoIncrement": true },
        "title": { "type": "string", "required": true, "maxLength": 255 },
        "description": { "type": "string", "required": false }, // 'required' defaults to false
        "completed": { "type": "boolean", "default": false },
        "dueDate": { "type": "Date", "required": false }
      },
      // [OPTIONAL] Add model-specific settings or validation rules here.
      // "validation": { "title": "minLength: 1" }
    }
    // Add more models like "User", "Project", etc., following the same structure.
    // ,"User": { ... }
  },
  // [REQUIRED] Define the API endpoints (routes) for each model.
  "endpoints": {
    "Task": {
      "path": "/api/tasks", // Base path for all endpoints in this group
      "operations": {
        "getAll": { "method": "GET", "path": "/", "enabled": true }, // GET /api/tasks
        "getById": { "method": "GET", "path": "/:id", "enabled": true }, // GET /api/tasks/1
        "create": { "method": "POST", "path": "/", "enabled": true }, // POST /api/tasks
        "update": { "method": "PUT", "path": "/:id", "enabled": true }, // PUT /api/tasks/1
        "delete": { "method": "DELETE", "path": "/:id", "enabled": true } // DELETE /api/tasks/1
      }
      // [OPTIONAL] Add middleware specific to these endpoints (e.g., authentication).
      // "middleware": ["auth"]
    }
  },
  // [OPTIONAL] Global configuration and add-ons.
  "config": {
    "authentication": "jwt", // Options: "jwt", "session", "none"
    "logging": true, // Enable request logging
    "cors": true // Enable CORS
  },
  // [OPTIONAL] The ultimate escape hatch for any custom functionality.
  // Use this to override defaults, add unique environment variables, or specify complex logic.
  "custom": {
    // "environment_variables": { "API_KEY": "your_secret_key_here" },
    // "external_services": { "sendEmail": true },
    // "special_middleware": ["rateLimiter", "sanitizeInput"]
  },
  "directory": "my-task-api" // Directory name for the generated project
}