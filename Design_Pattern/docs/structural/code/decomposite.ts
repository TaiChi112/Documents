// Composite (Decomposite) Design Pattern Example (TypeScript)
// Sample 1: Basic Composite Structure

abstract class Component {
    abstract operation(): void;
}

class Leaf extends Component {
    operation(): void {
        console.log("Leaf operation");
    }
}

class Composite extends Component {
    private children: Component[] = [];
    add(component: Component): void {
        this.children.push(component);
    }
    remove(component: Component): void {
        this.children = this.children.filter(child => child !== component);
    }
    operation(): void {
        console.log("Composite operation");
        for (const child of this.children) {
            child.operation();
        }
    }
}

// Usage
const leaf1 = new Leaf();
const leaf2 = new Leaf();
const composite = new Composite();
composite.add(leaf1);
composite.add(leaf2);
composite.operation();
