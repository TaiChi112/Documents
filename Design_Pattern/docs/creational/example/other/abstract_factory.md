|          |        |      |        |
| -------- | ------ | ---- | ------ |
|          | banane | taro | durian |
| fry      |        |      |        |
| stir     |        |      |        |
| in-syrup |        |      |        |

#
```mermaid
classDiagram
        direction TD
            class FruitFactory {
            <<interface>>
            +createBanana() Banana
            +createTaro() Taro
            +createDurian() Durian
            }
            class FriedFruitFactory {
                +createBanana() FriedBanana
                +createTaro() FriedTaro
                +createDurian() FriedDurian
            }
            class StirFruitFactory {
                +createBanana() StirBanana
                +createTaro() StirTaro
                +createDurian() StirDurian
            }
            class SyrupFruitFactory {
                +createBanana() SyrupBanana
                +createTaro() SyrupTaro
                +createDurian() SyrupDurian
            }
            FruitFactory <|-- FriedFruitFactory
            FruitFactory <|-- StirFruitFactory
            FruitFactory <|-- SyrupFruitFactory
            

        FriedFruitFactory <|-- FriedBanana
        FriedFruitFactory <|-- FriedTaro
        FriedFruitFactory <|-- FriedDurian

        StirFruitFactory <|-- StirBanana
        StirFruitFactory <|-- StirTaro
        StirFruitFactory <|-- StirDurian

        SyrupFruitFactory <|-- SyrupBanana
        SyrupFruitFactory <|-- SyrupTaro
        SyrupFruitFactory <|-- SyrupDurian

        FriedBanana --|> Banana
        FriedTaro --|> Taro
        FriedDurian --|> Durian

        class FriedBanana {
            +cook()
        }
        class FriedTaro {
            +cook()
        }
        class FriedDurian {
            +cook()
        }
            class StirBanana {
            +cook()
            }
            class StirTaro {
                +cook()
            }
            class StirDurian {
                +cook()
            }
            StirBanana --|> Banana
            StirTaro --|> Taro      
            StirDurian --|> Durian

        
            class SyrupBanana {
                +cook()
            }
            class SyrupTaro {
                +cook()
            }
            class SyrupDurian {
                +cook()
            }
            SyrupBanana --|> Banana
            SyrupTaro --|> Taro      
            SyrupDurian --|> Durian
        
        class Banana {
            <<interface>>
            +cook()
        }
        class Taro {
            <<interface>>
            +cook()
        }
        class Durian {
            <<interface>>
            +cook()
        }
```
