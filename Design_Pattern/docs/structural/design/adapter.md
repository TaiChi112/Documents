```mermaid
classDiagram
    direction TD
    class Box{
        -width: int
        -height: int
        -length: int
        +Box(int width, int height, int length)
        +getCC(): int
        +canContain(Water) int
    }
    Box <|-- Water
    class Water{
        <<interface>>
        +getCC(): int
    }
   Water <|.. GlassAdapter
   Water <|.. BottleAdapter
   Glass <|-- GlassAdapter
   Bottle <|-- BottleAdapter

   namespace Adapters {
       class GlassAdapter{
            -adaptee Glass
            +GlassAdapter(adaptee)
            +getCC() int
        }
        class BottleAdapter{
            -adaptee Bottle
            +BottleAdapter(adaptee)
            +getCC() int
        }
    }
    namespace Adaptees {
        class Glass{
            -ounce int
            +Glass(ounce)
            +getOunce() int
        }
        class Bottle{
            -liter int
            +Bottle(liter)
            +getLiter() int
        }
    }