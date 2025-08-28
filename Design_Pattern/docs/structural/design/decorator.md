# Decorator Design Pattern - Mermaid Diagram Samples

Below are 4 different samples of the Decorator Design Pattern using Mermaid diagrams.

---

## Sample 1: Basic Decorator Structure

```mermaid
classDiagram
    class Component {
        +operation()
    }
    class ConcreteComponent {
        +operation()
    }
    class Decorator {
        +operation()
    }
    class ConcreteDecoratorA {
        +operation()
    }
    class ConcreteDecoratorB {
        +operation()
    }
    Component <|-- ConcreteComponent
    Component <|-- Decorator
    Decorator <|-- ConcreteDecoratorA
    Decorator <|-- ConcreteDecoratorB
    Decorator o-- Component : wraps
```

---

## Sample 2: Coffee Example

```mermaid
classDiagram
    class Coffee {
        +cost()
    }
    class SimpleCoffee {
        +cost()
    }
    class CoffeeDecorator {
        +cost()
    }
    class MilkDecorator {
        +cost()
    }
    class SugarDecorator {
        +cost()
    }
    Coffee <|-- SimpleCoffee
    Coffee <|-- CoffeeDecorator
    CoffeeDecorator <|-- MilkDecorator
    CoffeeDecorator <|-- SugarDecorator
    CoffeeDecorator o-- Coffee : wraps
```

---

## Sample 3: Visual Component Example

```mermaid
classDiagram
    class VisualComponent {
        +draw()
    }
    class TextView {
        +draw()
    }
    class DecoratorVC {
        +draw()
    }
    class BorderDecorator {
        +draw()
    }
    class ScrollDecorator {
        +draw()
    }
    VisualComponent <|-- TextView
    VisualComponent <|-- DecoratorVC
    DecoratorVC <|-- BorderDecorator
    DecoratorVC <|-- ScrollDecorator
    DecoratorVC o-- VisualComponent : wraps
```

---

## Sample 4: Data Stream Example

```mermaid
classDiagram
    class Stream {
        +read()
    }
    class FileStream {
        +read()
    }
    class StreamDecorator {
        +read()
    }
    class BufferedStream {
        +read()
    }
    class CryptoStream {
        +read()
    }
    Stream <|-- FileStream
    Stream <|-- StreamDecorator
    StreamDecorator <|-- BufferedStream
    StreamDecorator <|-- CryptoStream
    StreamDecorator o-- Stream : wraps
```
