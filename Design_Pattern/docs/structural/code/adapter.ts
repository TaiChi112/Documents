// Adapter Design Pattern Example (TypeScript)
// Sample 1: Basic Adapter Structure (Class Adapter)

interface Target {
    request(): void;
}

class Adaptee {
    specificRequest(): void {
        console.log("Adaptee: Specific request.");
    }
}

class Adapter extends Adaptee implements Target {
    request(): void {
        this.specificRequest();
    }
}

// Usage
const target: Target = new Adapter();
target.request();
