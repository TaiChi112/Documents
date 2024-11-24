#  Five main types of class relationship:

### inheritance
- **Description**:
    - A "parent-child" relationship where a child class (subclass) inherits attributes and methods from a parent class (superclass).
- **key characteristics** :
    - Enables code reuse.
    - Supports hierarchical design. 
- **Example**:
```cpp
    class Animal {
    public:
        void eat() { cout << "Eating..."; }
    };
    class Dog : public Animal {
    public:
        void bark() { cout << "Barking..."; }
    };
```  

### association
- **Description**:
    - A relationship where one class uses or interacts with another class. This is a "has-a" relationship.
- **types** :
    - Unidirectional: One class depends on the other.
    - Bidirectional: Both classes interact with each other.
- **Example**:
```cpp
    class Engine {
    public:
        void start() { cout << "Engine started"; }
    };
    class Car {
    Engine engine; // Car "has-a" Engine
    public:
        void drive() { engine.start(); cout << "Car is moving"; }
    };
```

### aggregation
- **Description**:
    - A specialized type of association where one class owns another class, but both can exist independently.
- **key characteristics** :
    - Represents a "whole-part" relationship.
    - The lifespan of the part is independent of the whole.
- **Example**:
```cpp
    class Department {
    public:
        string name;
    };
    class University {
    Department department; // University "has-a" Department
    };
```

### composition
- **Description**:
    - A stronger form of aggregation where the "part" cannot exist without the "whole."
- **key characteristices** :
    - Represents a "part-of" relationship.
    - The lifespan of the part depends on the whole.
- **Example**:
```cpp
    class Heart {
    public:
        void beat() { cout << "Heart is beating"; }
    };
    class Human {
    Heart heart; // Human "has-a" Heart, and heart dies with Human
    public:
        void live() { heart.beat(); }
    };
```

### dependency
- **Description**:
    - A "uses-a" relationship where one class depends on another for its operation.
- **key characteristices** :
    - A temporary relationship where one class uses another.
- **Example**:
```cpp
    class Printer {
    public:
        void print() { cout << "Printing..."; }
    };
    class Document {
    public:
        void generate(Printer &printer) { printer.print(); }
    };
```

## Summanry Table:
| **Type**    | **Relationship** | **Example**                |
| ----------- | ---------------- | -------------------------- |
| Inheritance | "Is-a"           | Dog is an Animal           |
| Association | "Has-a"          | Car has an Engine          |
| Aggregation | "Whole-Part"     | University has Departments |
| Composition | "Part-of"        | Human has a Heart          |
| Dependency  | "Uses-a"         | Document uses a Printer    |

## All this reference ChatGPT