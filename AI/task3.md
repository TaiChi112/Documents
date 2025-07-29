## Simple Agent and Uninfomed search

```mermaid
graph TD
    Frankfurt((Frankfurt))
    Mannheim((Mannheim))
    Karlsruhe((Karlsruhe))
    Augsburg((Augsburg))
    Munchen((Munchen))
    Wurzburg((Wurzburg))
    Erfurt((Erfurt))
    Nurnberg((Nurnberg))
    Stuttgart((Stuttgart))
    Kassel((Kassel))

    Frankfurt -- 81km --> Mannheim
    Frankfurt -- 213km --> Wurzburg
    Frankfurt -- 163km --> Kassel
    Mannheim -- 182km --> Karlsruhe
    Karlsruhe -- 99km --> Augsburg
    Augsburg -- 76km --> Munchen
    Wurzburg -- 246km --> Erfurt
    Wurzburg -- 163km --> Nurnberg
    Nurnberg -- 179km --> Stuttgart
    Nurnberg -- 179km --> Munchen
    Kassel -- 80km --> Munchen
```

## Convert Directed Graph to Tree

```mermaid
graph TD
    Frankfurt((Frankfurt))
    Mannheim((Mannheim))
    Karlsruhe((Karlsruhe))
    Augsburg((Augsburg))
    Wurzburg((Wurzburg))
    Erfurt((Erfurt))
    Nurnberg((Nurnberg))
    Stuttgart((Stuttgart))
    Kassel((Kassel))

    Frankfurt -- 81km --> Mannheim
    Frankfurt -- 213km --> Wurzburg
    Frankfurt -- 163km --> Kassel
    Mannheim -- 182km --> Karlsruhe
    Karlsruhe -- 99km --> Augsburg
    Augsburg -- 76km --> Munchen1
    Wurzburg -- 246km --> Erfurt
    Wurzburg -- 163km --> Nurnberg
    Nurnberg -- 179km --> Stuttgart
    Nurnberg -- 179km --> Munchen2
    Kassel -- 80km --> Munchen3
```