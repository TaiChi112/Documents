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
```

## Geme Character Creation Factory Method
```mermaid
classDiagram
    class ICharacter {
        <<interface>>
        +attack() void
        +defend() void
        +useSkill() void
    }
    class Warrior {
    }
    class Mage {
    }
    class Archer {
    }
    class CharacterFactory {
        <<abstract>>
        +createCharacter() ICharacter
    }
    class WarriorFactory {
        +createCharacter() Warrior
    }
    class MageFactory {
        +createCharacter() Mage
    }
    class ArcherFactory {
        +createCharacter() Archer
    }
    ICharacter <|.. Warrior:implements
    ICharacter <|.. Mage:implements
    ICharacter <|.. Archer:implements
    CharacterFactory <|-- WarriorFactory:extends
    CharacterFactory <|-- MageFactory:extends
    CharacterFactory <|-- ArcherFactory:extends
    ICharacter <.. CharacterFactory
```

## Payment Gateway Integration Factory Method
```mermaid
classDiagram
    class IPaymentGateway {
        <<interface>>
        +processPayment() void
        +refund() void
        +checkStatus() void
    }
    class PayPalGateway {
    }
    class StripeGateway {
    }
    class OmiseGateway {
    }
    class PaymentGatewayFactory {
        <<abstract>>
        +createPaymentGateway() IPaymentGateway
    }
    class PayPalGatewayFactory {
        +createPaymentGateway() PayPalGateway
    }
    class StripeGatewayFactory {
        +createPaymentGateway() StripeGateway
    }
    class OmiseGatewayFactory {
        +createPaymentGateway() OmiseGateway
    }
    IPaymentGateway <|.. PayPalGateway:implements
    IPaymentGateway <|.. StripeGateway:implements
    IPaymentGateway <|.. OmiseGateway:implements
    PaymentGatewayFactory <|-- PayPalGatewayFactory:extends
    PaymentGatewayFactory <|-- StripeGatewayFactory:extends
    PaymentGatewayFactory <|-- OmiseGatewayFactory:extends
    IPaymentGateway <.. PaymentGatewayFactory
```

## Cloud Resource Provisioning Factory Method
```mermaid
classDiagram
    class ICloudResource {
        <<interface>>
        +provision() void
        +deprovision() void
        +getStatus() void
    }
    class AwsVM {
    }
    class AwsDatabase {
    }
    class AzureVM {
    }
    class AzureDatabase {
    }
    class GcpVM {
    }
    class GcpDatabase {
    }
    class CloudProviderFactory {
        <<abstract>>
        +createCloudResource() ICloudResource
    }
    class AwsFactory {
        +createCloudResource() AwsVM
        +createCloudResource() AwsDatabase
    }
    class AzureFactory {
        +createCloudResource() AzureVM
        +createCloudResource() AzureDatabase
    }
    class GcpFactory {
        +createCloudResource() GcpVM
        +createCloudResource() GcpDatabase
    }
    ICloudResource <|.. AwsVM:implements
    ICloudResource <|.. AwsDatabase:implements
    ICloudResource <|.. AzureVM:implements
    ICloudResource <|.. AzureDatabase:implements
    ICloudResource <|.. GcpVM:implements
    ICloudResource <|.. GcpDatabase:implements
    CloudProviderFactory <|-- AwsFactory:extends
    CloudProviderFactory <|-- AzureFactory:extends
    CloudProviderFactory <|-- GcpFactory:extends
    ICloudResource <.. CloudProviderFactory
```