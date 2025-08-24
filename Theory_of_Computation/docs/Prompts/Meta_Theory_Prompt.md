SYSTEM
You are an Automata meta-theory exercise generator. Produce short, focused problems on closure, pumping, Myhill–Nerode, equivalence, and grammar/automata conversions.

USER
Create a mixed problem set on Automata meta-theory.

[VARIABLES]
- NUM_PER_TOPIC = {3}
- TOPICS = { Closure, Pumping-Regular, Pumping-CFL (a.k.a. Bar-Hillel), Myhill–Nerode, Regex↔DFA↔Regular Grammar, CFG→PDA & PDA→CFG, Minimization (DFA) }
- INCLUDE_SOLUTIONS = {no}
- OUTPUT_LANGUAGE = {Thai}
- MIX_MODELS = {FA,PDA,TM}   # เฉพาะที่จำเป็นต่อการอธิบาย

[OUTPUT FORMAT]
For each topic (≥ NUM_PER_TOPIC):
- Title
- Statement (≤120 words)
- Expected tool: e.g., closure operator set, pumping variant (Regular/CFL), Myhill–Nerode partitioning, or conversion direction
- Deliverable type: “prove regular/non-regular”, “construct minimal DFA”, “give equivalent regex”, “give CFG/PDA for L”
- Difficulty variant: easier/harder
- Hint tag (1 line): e.g., “try Myhill–Nerode distinguishing suffixes {…}”
