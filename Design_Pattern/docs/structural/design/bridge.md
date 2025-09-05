# Bridge Design Pattern - Mermaid Diagram Samples

Below are 4 different samples of the Bridge Design Pattern using Mermaid diagrams.

---

## Sample 1: Basic Bridge Structure

```mermaid
classDiagram
    class Abstraction {
        +operation()
    }
    class RefinedAbstraction {
        +operation()
    }
    class Implementor {
        +operationImpl()
    }
    class ConcreteImplementorA {
        +operationImpl()
    }
    class ConcreteImplementorB {
        +operationImpl()
    }
    Abstraction <|-- RefinedAbstraction
    Abstraction o-- Implementor : bridge
    Implementor <|-- ConcreteImplementorA
    Implementor <|-- ConcreteImplementorB
```

---

## Sample 2: Remote Control and Devices

```mermaid
classDiagram
    class RemoteControl {
        +Device device
        +togglePower()
    }
    class AdvancedRemoteControl {
        +mute()
    }
    class Device {
        +isEnabled()
        +enable()
        +disable()
    }
    class TV
    class Radio
    RemoteControl <|-- AdvancedRemoteControl
    RemoteControl o-- Device
    Device <|-- TV
    Device <|-- Radio
```

---

## Sample 3: Shape and Drawing API

```mermaid
classDiagram
    class Shape {
        +draw()
    }
    class Circle {
        +draw()
    }
    class DrawingAPI {
        +drawCircle(x, y, radius)
    }
    class DrawingAPI1
    class DrawingAPI2
    Shape <|-- Circle
    Shape o-- DrawingAPI
    DrawingAPI <|-- DrawingAPI1
    DrawingAPI <|-- DrawingAPI2
```

---

## Sample 4: Message and MessageSender

```mermaid
classDiagram
    class Message {
        +MessageSender sender
        +send()
    }
    class TextMessage
    class EmailMessage
    class MessageSender {
        +sendMessage()
    }
    class SMSSender
    class EmailSender
    Message <|-- TextMessage
    Message <|-- EmailMessage
    Message o-- MessageSender
    MessageSender <|-- SMSSender
    MessageSender <|-- EmailSender
```
