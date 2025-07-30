```mermaid
classDiagram
    class Fan {
    }
    class ElectrucMoter {
    }
    class Impleller {
    }
    class Switch {
    }
    class ImpellerCover {
    }
    Fan *--> ElectrucMoter 
    Fan *--> Impleller 
    Fan *--> Switch 
    Fan *--> ImpellerCover 
```