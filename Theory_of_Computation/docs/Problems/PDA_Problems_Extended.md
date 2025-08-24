# Extended PDA State Diagram Problems - Categorized

Given Σ = {a,b} (unless otherwise specified), create PDA state diagrams for the following languages.

## Easy Problems

### Basic Pattern Matching (Easy)
1. L = { w ∈ {a,b}* | number of a's equals number of b's }
2. L = { a^n b^n | n ≥ 1 }
3. L = { w ∈ {(,)}* | w has properly balanced parentheses }
4. L = { ww^R | w ∈ {a,b}* } (palindromes)
5. L = { w ∈ {a,b}* | first half of w equals second half }

### Simple Counting with Stack (Easy)
6. L = { w ∈ {a,b}* | |w|_a = |w|_b + 1 }
7. L = { a^n b^m | n > m ≥ 0 }
8. L = { w ∈ {a,b}* | w has twice as many a's as b's }

### Basic Position Dependencies (Easy)
9. L = { a^n b^m c^n | n,m ≥ 0 }
10. L = { w#w | w ∈ {a}* }

## Medium Problems

### Pattern Matching with Memory (Medium)
11. L = { w ∈ {a,b}* | w contains equal number of 'ab' and 'ba' substrings }
12. L = { a^n b^n c^n | n ≥ 0 }
13. L = { w ∈ {a,b,c}* | number of a's equals number of b's equals number of c's }
14. L = { w ∈ {a,b}* | w = xy where |x| = |y| and x = y^R }
15. L = { w#v | w,v ∈ {a,b}* and w ≠ v^R }

### Complex Counting (Medium)
16. L = { w ∈ {a,b}* | |w|_a = 2|w|_b }
17. L = { w ∈ {a,b}* | difference between number of a's and b's is 3 }
18. L = { a^i b^j c^k | i,j,k ≥ 0 and i = j or j = k }
19. L = { w ∈ {a,b}* | w contains twice as many 'ab' as 'ba' }
20. L = { w ∈ {a,b}* | number of 'ab' equals number of 'bb' }

### Nested Structures (Medium)
21. L = { w ∈ {(,)}* | w has equal number of '()' and ')(' }
22. L = { a^n b^m c^p | n,m,p ≥ 0 and n + m = p }

## Difficult Problems

### Complex Pattern Dependencies (Hard)
23. L = { w#v | w,v ∈ {a,b}* and v is a substring of w }
24. L = { w ∈ {a,b}* | w = xy where |x| = |y| and x ≠ y }
25. L = { w#v | w,v ∈ {a,b}* and w is a rotation of v }

### Advanced Counting with Multiple Conditions (Hard)
26. L = { w ∈ {a,b,c}* | |w|_a = 2|w|_b = 3|w|_c }
27. L = { a^i b^j c^k | i,j,k ≥ 0 and i + j = k and i = 2j }
28. L = { w ∈ {a,b}* | number of 'ab' minus number of 'ba' equals number of 'bb' }

### Complex Nested Patterns (Hard)
29. L = { w ∈ {a,b,c}* | w = a^n b^m c^k where n = m or m = k or k = n }
30. L = { w#v#x | w,v,x ∈ {a,b}* and w = vx }

## Concept Distribution:

1. Pattern Matching
   - Easy: 3, 4, 5
   - Medium: 11, 14, 15
   - Hard: 23, 24, 25

2. Counting Occurrences
   - Easy: 6, 7, 8
   - Medium: 16, 17, 19, 20
   - Hard: 26, 27, 28

3. Modular Arithmetic
   - Medium: 18
   - Hard: 26, 27

4. String Properties
   - Easy: 1, 2, 4
   - Medium: 13, 14
   - Hard: 25, 30

5. Combinations of Conditions
   - Medium: 18, 22
   - Hard: 27, 28, 29

6. Position-based Conditions
   - Easy: 9, 10
   - Medium: 14, 15
   - Hard: 23, 24

7. Nested Structures
   - Easy: 3
   - Medium: 21, 22
   - Hard: 29, 30

## Difficulty Level Breakdown:
- Easy: 10 problems
- Medium: 12 problems
- Hard: 8 problems

## Tips for Approach:

1. Easy Problems:
   - Focus on basic stack operations
   - Simple counting relationships
   - Basic pattern matching with memory
   - Single condition verification

2. Medium Problems:
   - Multiple counter management
   - Pattern matching with conditions
   - Nested structure handling
   - Multiple related conditions

3. Hard Problems:
   - Complex pattern relationships
   - Multiple interdependent conditions
   - Advanced string manipulation
   - Sophisticated stack management

## Key Implementation Concepts:

1. Stack Usage:
   - Counter implementation
   - Pattern storage
   - Temporary memory
   - Multiple purpose stacks

2. State Design:
   - Phase transitions
   - Condition tracking
   - Error handling
   - Multiple acceptance conditions

3. Advanced Techniques:
   - Multiple stack symbols
   - Complex acceptance conditions
   - Nested structure verification
   - Pattern comparison strategies

Note: These problems demonstrate the power of PDAs over DFAs by requiring:
- Unlimited memory storage
- Complex pattern matching
- Nested structure processing
- Multiple counter tracking
