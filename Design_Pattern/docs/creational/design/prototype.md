```mermaid
classDiagram
    class Furniture {
        -default_field string
        -type string
        -specific_field string
        +clone() Furniture
    }
    class Chair {
        -default_field string
        -type string
        -specific_field string
        +clone() Furniture
    }
    class Table {
        -default_field string
        -type string
        -specific_field string
        +clone() Furniture
    }
    Furniture <|-- Chair
    Furniture <|-- Table
