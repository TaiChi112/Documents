```json
{
    "allow_inference": true,
    "project": {
        "name": "",
        "description": ""
    },
    "stack": {
        "language": "",
        "runtime": ""
    },
    "architecture": [],
    "design_patterns": [],
    "framework": [],
    "database": {
        "models":[
            {
                "User":{},
                "Product":{}
            }
        ]
    },
    "endpoints": [
        {
            "User":{
                "path": "/api/users",
                "operations": ["getAll", "getById", "create", "update", "delete"]
            },
            {
                "Product":{
                    "path": "/api/products",
                    "operations": ["getAll", "getById", "create", "update", "delete"]
            }
        }
    ],
    "docker": [
        {
            "default": true
        },
        {
            "custom": {}
        }
    ],
    "docker_compose": [
        {
            "default": true
        },
        {
            "custom": {}
        }
    ],
    "features": [],
    "security": {
        "authentication": "JWT",
        "authorization": "RBAC",
        "encryption": "AES-256",
        "input_validation": true,
        "rate_limiting": true,
        "logging": true,
        "cors": true,
        "monitoring": false,
        "other": []
    },
    "testing": {
        "unit": true,
        "integration": true,
        "e2e": false,
        "tools": [],
    },
    "custom": {},
}