# Decomposite (Composite) Design Pattern - Mermaid Diagram Samples

Below are 4 different samples of the Composite (Decomposite) Design Pattern using Mermaid diagrams.

---

## Sample 1: Basic Composite Structure

```mermaid
classDiagram
    class Component {
        +operation()
    }
    class Leaf {
        +operation()
    }
    class Composite {
        +add(Component)
        +remove(Component)
        +operation()
    }
    Component <|-- Leaf
    Component <|-- Composite
    Composite o-- Component : children
```

---

## Sample 2: File System (Folder & File)

```mermaid
classDiagram
    class FileSystemEntity {
        +name
        +display()
    }
    class File {
        +display()
    }
    class Folder {
        +add(FileSystemEntity)
        +remove(FileSystemEntity)
        +display()
    }
    FileSystemEntity <|-- File
    FileSystemEntity <|-- Folder
    Folder o-- FileSystemEntity : contains
```

---

## Sample 3: Graphic Objects

```mermaid
classDiagram
    class Graphic {
        +draw()
    }
    class Circle {
        +draw()
    }
    class Rectangle {
        +draw()
    }
    class CompoundGraphic {
        +add(Graphic)
        +remove(Graphic)
        +draw()
    }
    Graphic <|-- Circle
    Graphic <|-- Rectangle
    Graphic <|-- CompoundGraphic
    CompoundGraphic o-- Graphic : children
```

---

## Sample 4: Organization Structure

```mermaid
classDiagram
    class Employee {
        +showDetails()
    }
    class Developer {
        +showDetails()
    }
    class Manager {
        +add(Employee)
        +remove(Employee)
        +showDetails()
    }
    Employee <|-- Developer
    Employee <|-- Manager
    Manager o-- Employee : subordinates
```
