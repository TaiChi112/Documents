// Decorator Design Pattern Example (TypeScript)
// Sample 1: Basic Decorator Structure

abstract class DecoratorComponent {
    abstract operation(): void;
}

class ConcreteComponent extends DecoratorComponent {
    operation(): void {
        this.log("ConcreteComponent operation");
    }
    private log(message: string): void {
        // Replace this with a browser-safe logging mechanism, e.g., update a DOM element
        console.log(message);
    }
}

class Decorator extends DecoratorComponent {
    protected component: DecoratorComponent;
    constructor(component: DecoratorComponent) {
        super();
        this.component = component;
    }
    operation(): void {
        this.component.operation();
    }
}

class ConcreteDecoratorA extends Decorator {
    operation(): void {
        this.log("ConcreteDecoratorA before");
        super.operation();
        this.log("ConcreteDecoratorA after");
    }
    private log(message: string): void {
        if (typeof window !== "undefined") {
            (window as any).decoratorLog = ((window as any).decoratorLog || "") + message + "\n";
        } else {
            console.log(message);
        }
    }
}

class ConcreteDecoratorB extends Decorator {
    operation(): void {
        this.log("ConcreteDecoratorB before");
        super.operation();
        this.log("ConcreteDecoratorB after");
    }
    private log(message: string): void {
        if (typeof window !== "undefined") {
            (window as any).decoratorLog = ((window as any).decoratorLog || "") + message + "\n";
        } else {
            console.log(message);
        }
    }
}

// Usage
const component = new ConcreteComponent();
const decoratorA = new ConcreteDecoratorA(component);
decoratorA.operation();
const decoratorB = new ConcreteDecoratorB(decoratorA);
decoratorB.operation();
