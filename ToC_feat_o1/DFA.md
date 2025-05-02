```mermaid
stateDiagram-v2
    [*] --> A
    A --> A : a
    A --> B : b
    B --> A : a
    B --> C : b
    C --> A : a
    C --> C : b

    note right of A: A = 1,2,3
    note right of B: B = 2,3,4
    note right of C: C = 4

    state C <<final>>
```