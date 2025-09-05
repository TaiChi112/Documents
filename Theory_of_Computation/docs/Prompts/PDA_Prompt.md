SYSTEM
You are an Automata exercise generator. Produce well-scoped PDA problems (context-free languages) that cover multiple string-property categories requiring a stack.

USER
Create a problem set for Pushdown Automata (PDA) with the following requirements.

[VARIABLES]
- NUM_PROBLEMS_PER_CATEGORY = {2}
- ALPHABETS = { Σ1 = {a,b}, Σ2 = { (, ) }, Σ3 = {a,b,#} }
- INCLUDE_SOLUTIONS = {no}
- DIFFICULTY_MIX = {50% basic, 50% intermediate}
- ENSURE_PDA_REQUIRED = {true}          # It is important to note that a real PDA must be used.
- OUTPUT_LANGUAGE = {Thai}
- PDA_FLAVOR = {NPDA}                   # Or {DPDA} if you want to force deterministic.

[CATEGORIES – PDA CORE]
1) Balanced/Nested (parentheses, well-nested blocks)
2) Equality of counts for one pair (e.g., a^n b^n)
3) Palindromes over Σ (ww^R)
4) Delimiter-based splits with matching (e.g., x#y with |x|=|y|)
5) Single-stack parsing patterns (matched tags / XML-like toys)
6) Piecewise with stack (e.g., all prefixes have #a ≥ #b)

[FA-FRIENDLY (only allowed if the base still requires a stack)]
7) Forbidden with a required balanced core
8) Length conditions combined with balanced core

[GUARDRAILS – keep within CFL (avoid TM)]
- Disallow languages that require:
  (a) multi-equality among ≥2 independent counters (e.g., #a=#b=#c),
  (b) duplication/copying ww,
  (c) cross-serial dependencies beyond a single stack.
- Prefer constructions explainable by:
  - stack push/pop matching (one unbounded counter),
  - simple delimiter # to separate matched parts,
  - standard CFL closures (∪, ·, * ; note: CFL not closed under ∩, complement).

[OUTPUT FORMAT]
1) Coverage Summary (table): categories × problems
2) Problems (for each i):
   - Title
   - Alphabet Σ
   - Category tags (1–2)
   - Language definition (plain + brief formal)
   - Why PDA? (≤5 lines): explain stack role, and why FA is insufficient
   - Expected model: NPDA/DPDA (state & stack-symbol rough plan)
   - 3 accepted + 3 rejected strings
   - "Harder variant": still CFL OR note if it would jump to TM (but keep base as CFL)
3) (If INCLUDE_SOLUTIONS = yes)
   - Stack discipline hint (what to push/pop)
   - State roles (high-level)
   - CFG sketch if helpful

[GLOBAL CONSTRAINTS]
- Include at least one palindrome and one a^n b^n-style problem.
- Include at least one delimiter-based matching problem x#y.
- Avoid ww or triple-equality cases (will jump to TM).
