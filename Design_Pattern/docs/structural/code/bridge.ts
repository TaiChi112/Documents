// Bridge Design Pattern Example (TypeScript)
// Sample 1: Basic Bridge Structure

// Implementor
interface Implementor {
    operationImpl(): void;
}

class ConcreteImplementorA implements Implementor {
    operationImpl(): void {
        console.log("ConcreteImplementorA operationImpl");
    }
}

class ConcreteImplementorB implements Implementor {
    operationImpl(): void {
        console.log("ConcreteImplementorB operationImpl");
    }
}

// Abstraction
class Abstraction {
    protected implementor: Implementor;
    constructor(implementor: Implementor) {
        this.implementor = implementor;
    }
    operation(): void {
        this.implementor.operationImpl();
    }
}

class RefinedAbstraction extends Abstraction {
    operation(): void {
        console.log("RefinedAbstraction operation");
        super.operation();
    }
}

// Usage
const ab1 = new RefinedAbstraction(new ConcreteImplementorA());
ab1.operation();
const ab2 = new RefinedAbstraction(new ConcreteImplementorB());
ab2.operation();
