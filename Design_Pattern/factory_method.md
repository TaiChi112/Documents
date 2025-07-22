## Transportation Factory Method

```mermaid
classDiagram
    class ITransport {
        <<interface>>
        +createTransport() void
        +deliver() void
    }
    class Truck{
    }
    class Train{
    }
    class Ship{
    }
    class Airplane{
    }
    class TransportFactory {
        <<abstract>>
        +createTransport() ITransport
    }
    class TruckTransport{
        +createTransport() Truck
    }
    class TrainTransport{
        +createTransport() Train
    }
    class ShipTransport{
        +createTransport() Ship
    }
    class AirplaneTransport{
        +createTransport() Airplane
    }
    ITransport <|.. Truck:implements
    ITransport <|.. Train:implements
    ITransport <|.. Ship:implements
    ITransport <|.. Airplane:implements
    TransportFactory <|-- TruckTransport:extends
    TransportFactory <|-- TrainTransport:extends
    TransportFactory <|-- ShipTransport:extends
    TransportFactory <|-- AirplaneTransport:extends
    ITransport <.. TransportFactory
```

## Report Generator Factory Method
```mermaid
classDiagram
    class IReport{
        <<interface>>
        +generate() void
    }
    class PdfReport{
    }
    class ExcelReport{
    }
    class WordReport{
    }
    class ReportGeneratorFactory {
        <<abstract>>
        +createReport() IReport
    }
    class PdfReportGenerator{
        +createReport() PdfReport
    }
    class ExcelReportGenerator{
        +createReport() ExcelReport
    }
    class WordReportGenerator{
        +createReport() WordReport
    }
    IReport <|.. PdfReport:implements
    IReport <|.. ExcelReport:implements
    IReport <|.. WordReport:implements
    ReportGeneratorFactory <|-- PdfReportGenerator:extends
    ReportGeneratorFactory <|-- ExcelReportGenerator:extends
    ReportGeneratorFactory <|-- WordReportGenerator:extends
    IReport <.. ReportGeneratorFactory