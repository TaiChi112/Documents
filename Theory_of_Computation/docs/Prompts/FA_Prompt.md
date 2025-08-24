SYSTEM
You are an Automata exercise generator. Produce well-scoped FA problems (regular languages) that cover multiple “string property categories”.

USER
Create a problem set for Finite Automata (FA) with the following requirements.

[VARIABLES]
- NUM_PROBLEMS_PER_CATEGORY = {2}
- ALPHABETS = { Σ1 = {a,b}, Σ2 = {0,1} }   # You can choose to use many sets.
- INCLUDE_SOLUTIONS = {no}                  # yes/no
- DIFFICULTY_MIX = {60% basic, 40% intermediate}
- ENSURE_FA_ONLY = {true}                   # Important: Do not exceed the Normal level.
- OUTPUT_LANGUAGE = {Thai}                  # or English

[CATEGORIES – CORE 7]
1) Pattern matching
2) Counting occurrences (bounded/mod-k only)
3) Modular arithmetic (length mod / count mod)
4) String properties (starts/ends/contains/forbidden)
5) Combinations of conditions (using regular closures)
6) Position-based conditions (fixed positions / fixed distance)
7) Length restrictions (≤k, =k, or ≡ r (mod k))

[OPTIONAL FA-FRIENDLY ADD-ONS]
8) Forbidden/Avoidance (disallow substrings/runs)
9) Bounded runs/Threshold (no more than k in a row)
10) k-Local/Sliding-window (constraints on every window of size k)
11) Piecewise/Subsequence (order without adjacency)
12) Parity/Mod-count
13) Code properties (prefix-free / suffix-free)
14) Index arithmetic (fixed-from-end)
# (stunned: Balanced/Nested, Duplication/Copying, multi-equality counts — because it will fall off PDA/TM)

[GUARDRAILS – to keep problems REGULAR]
- Disallow languages that require:
  (a) matching unbounded counts (e.g., a^n b^n),
  (b) palindromes ww^R over unbounded length,
  (c) duplication/copying ww,
  (d) equality among ≥2 unbounded counters (e.g., #a = #b).
- Prefer constructions explainable by:
  - regex operators (union, concat, star),
  - regular closures (∪, ∩, complement, reverse, homomorphism),
  - k-local/forbidden patterns,
  - modular counting (via product automata).

[OUTPUT FORMAT]
1) Coverage Summary (table)
   - Rows: categories
   - Cols: Problem IDs
   - Mark ✓ for coverage; ensure at least NUM_PROBLEMS_PER_CATEGORY per category.
2) Problems (for each problem i):
   - Title (short)
   - Alphabet Σ: (choose from ALPHABETS)
   - Category tags: (1–3 categories)
   - Language definition:
     • Plain description (1–3 lines)
     • Brief formal notation (if helpful)
   - Why Regular? (≤4 lines): reference regex/closure/k-local/mod-k
   - Expected model: DFA (or NFA) + minimal-state range (rough, e.g., 4–8 states)
   - 3 accepted examples + 3 rejected examples
   - “Harder variant” (one line) that stays Regular OR explicitly notes if it would jump to PDA/TM (but keep base problem Regular).
3) (If INCLUDE_SOLUTIONS = yes)
   - Construction hint/regex sketch (≤5 lines)
   - DFA sketch idea (state roles, not full diagram)

[GLOBAL CONSTRAINTS]
- Ensure diversity of patterns (not all “ends with…”).
- Use both Σ1 and Σ2 across the set.
- Include at least one problem using complement or intersection reasoning.
- Limit problem text to ≤120 words each.
- No proofs required; only a short “Why Regular?” justification.
