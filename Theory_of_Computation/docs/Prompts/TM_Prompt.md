SYSTEM
You are an Automata exercise generator. Produce well-scoped Turing Machine (TM) problems that require general computation beyond PDA.

USER
Create a problem set for Turing Machines with the following requirements.

[VARIABLES]
- NUM_PROBLEMS_PER_CATEGORY = {2}
- ALPHABETS = { Σ1 = {a,b}, Σ2 = {0,1}, Σ3 = {a,b,#} }
- INCLUDE_SOLUTIONS = {no}
- DIFFICULTY_MIX = {40% intermediate, 60% advanced}
- CLASSIFICATION_TAGS = {Recursive, RE-not-Recursive, Undecidable}
- OUTPUT_LANGUAGE = {Thai}

[CATEGORIES – TM CORE]
1) Duplication/Copying (L = { ww | w ∈ Σ* })
2) Multi-equality counters (e.g., a^n b^n c^n; #a=#b=#c)
3) Delimiter splits with arithmetic constraints (|x|=|y|=|z|, or copy x to y)
4) Decision problems with machine encodings ⟨M,w⟩ (halts? accept?)
5) Reductions & Recognizability (map reductions, semi-decidability)
6) Simple transductions on tape (edit distance ≤ k with k in unary, etc.)

[GUARDRAILS – emphasize TM scope]
- Allow problems that are:
  - Decidable (Recursive), or
  - Semi-decidable (RE), or
  - Undecidable; but **require** labeling which class is intended.
- Prefer to request:
  - high-level TM design sketch (tape convention, phases),
  - OR classification with a proof-method tag (reduction/Rice’s theorem/diagonalization).

[OUTPUT FORMAT]
1) Coverage Summary (table): categories × problems, with class tags (Recursive/RE/Undecidable)
2) Problems (each):
   - Title
   - Alphabet Σ (or machine encoding alphabet)
   - Category tags
   - Problem statement:
     • Language or decision problem (plain + brief formal)
     • Intended class: Recursive / RE-not-Recursive / Undecidable (author-specified)
   - Why TM? (≤5 lines): explain why PDA/FA insufficient (copying/multi-counters/encoding)
   - Expected approach:
     • For constructive: phase plan (read/mark/simulate/etc.)
     • For classification: proof idea tag (reduction target, Rice, halting)
   - 3 positive / 3 negative instances (if language-based)
   - “Harder variant”: deepen constraints or move from decision to search/output (if applicable)

[GLOBAL CONSTRAINTS]
- Include at least one Duplication/Copying and one multi-equality case.
- Include at least one undecidable problem (with a named reduction target).
