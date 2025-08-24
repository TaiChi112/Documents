# DFA State Diagram Problems - Categorized

Given Σ = {a,b}, create DFA state diagrams for the following languages.

## Easy Problems

### Pattern Matching (Easy)
1. L = { x ∈ {a,b}* | x starts with 'aa' }
2. L = { x ∈ {a,b}* | x ends with 'bb' }
10. L = { x ∈ {a,b}* | x does not contain 'aa' }

### Length Restrictions (Easy)
6. L = { x ∈ {a,b}* | length of x is even }
19. L = { x ∈ {a,b}* | length of x is at least 3 }

### Position-based Conditions (Easy)
7. L = { x ∈ {a,b}* | x starts with 'a' and ends with 'b' }
14. L = { x ∈ {a,b}* | x starts and ends with the same symbol }
24. L = { x ∈ {a,b}* | x does not end with 'ab' }

## Medium Problems

### Pattern Matching (Medium)
3. L = { x ∈ {a,b}* | x contains 'aba' }
12. L = { x ∈ {a,b}* | x contains 'bab' }
16. L = { x ∈ {a,b}* | x contains neither 'aa' nor 'bb' }
20. L = { x ∈ {a,b}* | x contains 'aab' or 'abb' }

### Counting Occurrences (Medium)
4. L = { x ∈ {a,b}* | x has even number of a's }
5. L = { x ∈ {a,b}* | x has odd number of b's }
9. L = { x ∈ {a,b}* | x contains at least two b's }
15. L = { x ∈ {a,b}* | x has at most two a's }

### String Properties (Medium)
11. L = { x ∈ {a,b}* | every 'a' is followed by 'b' }
25. L = { x ∈ {a,b}* | each 'b' is preceded by an 'a' }
26. L = { x ∈ {a,b}* | length of x is at most 4 }
22. L = { x ∈ {a,b}* | x has no more than three consecutive a's }

## Difficult Problems

### Counting with Conditions (Hard)
8. L = { x ∈ {a,b}* | x contains exactly two a's }
18. L = { x ∈ {a,b}* | x contains exactly one 'ab' }
29. L = { x ∈ {a,b}* | x starts with 'a' and contains exactly two b's }

### Complex Pattern Recognition (Hard)
21. L = { x ∈ {a,b}* | x has alternating a's and b's }
27. L = { x ∈ {a,b}* | x contains both 'aa' and 'bb' }
30. L = { x ∈ {a,b}* | x contains no three consecutive identical symbols }

### Modular Arithmetic (Hard)
13. L = { x ∈ {a,b}* | number of a's is divisible by 3 }
23. L = { x ∈ {a,b}* | x contains an even number of 'ab's }
28. L = { x ∈ {a,b}* | number of a's minus number of b's is divisible by 3 }

### Advanced Comparison (Hard)
17. L = { x ∈ {a,b}* | x has more a's than b's }

## Concept Distribution:

1. Pattern Matching
   - Easy: Problems 1, 2, 10
   - Medium: Problems 3, 12, 16, 20
   - Hard: Problems 27

2. Counting Occurrences
   - Medium: Problems 4, 5, 9, 15
   - Hard: Problems 8, 18, 29

3. Modular Arithmetic
   - Hard: Problems 13, 23, 28

4. String Properties
   - Medium: Problems 11, 22, 25
   - Hard: Problems 21, 30

5. Combinations of Conditions
   - Hard: Problems 17, 27, 29

6. Position-based Conditions
   - Easy: Problems 7, 14, 24

7. Length Restrictions
   - Easy: Problems 6, 19
   - Medium: Problem 26

## Difficulty Level Breakdown:
- Easy: 8 problems
- Medium: 12 problems
- Hard: 10 problems

## Tips for Approach:
1. Easy problems typically involve:
   - Simple pattern recognition
   - Basic length checking
   - Single position conditions

2. Medium problems typically involve:
   - Combined patterns
   - Basic counting
   - Simple pattern restrictions

3. Hard problems typically involve:
   - Multiple conditions
   - Complex counting
   - Modular arithmetic
   - State tracking with multiple variables
