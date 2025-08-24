```mermaid
graph LR
    A[Recursively Enumerable Languages REL <br/>Turing Machine] --> B[Context-Sensitive Languages CSL <br/>Linear Bounded Automata]
    B --> C[Context-Free Languages CFL <br/>Pushdown Automata]
    C --> D[Regular Languages RL <br/>Finite Automata / Regex]
```



```mermaid
graph LR
    TM["TM — Infinite tape<br/>Turing Machine"] --> LBA["LBA — Bounded tape (≈ O(n))<br/>Linear Bounded Automaton"]
    LBA --> PDA["PDA — 1 Stack (LIFO, depth ไม่จำกัด)"]
    PDA --> FA["FA — No memory (Finite states)"]
```
|           |                |                     |                        |
| --------- | -------------- | ------------------- | ---------------------- |
| Regular ⊂ | Context-Free ⊂ | Context-Sensitive ⊂ | Recursively Enumerable |
| FA      ⊂ | PDA          ⊂ | LBA               ⊂ | TM                     |
