## Geme Character Creation Factory Method
```mermaid
classDiagram
    class Client{
        +client(factory: CharacterFactory) ICharacter
    }
    Client ..> CharacterFactory:uses
    class ICharacter {
        <<interface>>
        +attack() void
        +defend() void
    }
    class Warrior {
        +attack() void
        +defend() void
    }
    class Mage {
        +attack() void
        +defend() void
    }
    class Archer {
        +attack() void
        +defend() void
    }
    class CharacterFactory {
        <<abstract>>
        +createCharacter() ICharacter
    }
    class WarriorCharacterFactory {
        +createCharacter() ICharacter
    }
    class MageCharacterFactory {
        +createCharacter() ICharacter
    }
    class ArcherCharacterFactory {
        +createCharacter() ICharacter
    }
    ICharacter <.. CharacterFactory
    ICharacter <|.. Warrior:implements
    ICharacter <|.. Mage:implements
    ICharacter <|.. Archer:implements
    CharacterFactory <|-- WarriorCharacterFactory:extends
    CharacterFactory <|-- MageCharacterFactory:extends
    CharacterFactory <|-- ArcherCharacterFactory:extends