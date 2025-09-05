# Extended Turing Machine Problems - Categorized

Given Σ = {a,b} (unless otherwise specified), create Turing Machine diagrams for the following languages and computations.

## Easy Problems

### Basic Pattern Manipulation (Easy)
1. L = { w#w | w ∈ {a,b}* }
   - Convert input to output by copying strings
2. L = { ww | w ∈ {a,b}* }
   - Double any input string
3. L = { w ∈ {a,b}* | w is a palindrome }
   - Check if input is palindrome
4. L = { a^n b^n c^n | n ≥ 0 }
   - Check equal counts with marking
5. Design a TM that replaces all 'a's with 'b's and vice versa

### Simple Arithmetic (Easy)
6. Design a TM that adds 1 to a binary number
7. Design a TM that converts unary to binary
8. L = { a^n b^(n+2) | n ≥ 0 }
   - Check if number of b's is n+2
9. Design a TM that multiplies a unary number by 2
10. L = { a^(2n) | n ≥ 0 }
   - Accept strings with even length

## Medium Problems

### Pattern Recognition and Transformation (Medium)
11. Design a TM that removes all duplicated characters
12. Design a TM that sorts a string of a's and b's
13. L = { w#x | w is a substring of x, w,x ∈ {a,b}* }
14. Design a TM that reverses its input
15. L = { w ∈ {a,b}* | w = w^R w }
   - Accept strings that are palindrome followed by itself

### Arithmetic Operations (Medium)
16. Design a TM that subtracts two binary numbers
17. Design a TM that computes remainder when divided by 3
18. L = { a^(n^2) | n ≥ 0 }
   - Accept perfect square unary numbers
19. Design a TM that converts decimal to binary
20. L = { w ∈ {0,1}* | w represents a prime number in binary }

### Complex Pattern Counting (Medium)
21. L = { w | w has equal numbers of substrings 'ab' and 'ba' }
22. Design a TM that counts and marks every third 'a'

## Difficult Problems

### Advanced Computations (Hard)
23. Design a TM that computes GCD of two numbers in unary
24. Design a TM that checks if a binary number is prime
25. L = { a^n | n is a Fibonacci number }
26. Design a TM that multiplies two binary numbers

### Complex String Operations (Hard)
27. L = { w#x | w,x ∈ {a,b}* and x is a rotation of w }
28. Design a TM that generates all permutations of input string
29. L = { w | w = xy where y is lexicographically greater than x }
30. Design a TM that interleaves two strings separated by #

## Concept Distribution:

1. Pattern Matching
   - Easy: 1, 2, 3
   - Medium: 11, 12, 13
   - Hard: 27, 28, 29

2. Counting and Arithmetic
   - Easy: 6, 7, 8, 9, 10
   - Medium: 16, 17, 18
   - Hard: 23, 24, 25, 26

3. String Properties
   - Easy: 3, 4, 5
   - Medium: 14, 15
   - Hard: 27, 29, 30

4. String Transformation
   - Easy: 5
   - Medium: 11, 12, 14
   - Hard: 28, 30

5. Number Theory
   - Medium: 17, 20
   - Hard: 23, 24, 25

6. Position-based Operations
   - Easy: 1, 2
   - Medium: 21, 22
   - Hard: 29

7. Complex Combinations
   - Medium: 15, 21
   - Hard: 26, 27, 28

## Difficulty Level Breakdown:
- Easy: 10 problems
- Medium: 12 problems
- Hard: 8 problems

## Implementation Techniques:

1. Basic Operations:
   - Left/Right movement
   - Symbol reading/writing
   - State transitions
   - Tape marking

2. Intermediate Techniques:
   - Multiple passes
   - Temporary markers
   - Counter implementation
   - Pattern recognition

3. Advanced Strategies:
   - Multiple tracks
   - Subroutine simulation
   - Complex marking schemes
   - Multi-phase computation

## Key Features of TM vs PDA:

1. Read/Write Capabilities:
   - Can modify input
   - Can use markers
   - Can implement counters
   - Can transform data

2. Movement Flexibility:
   - Bidirectional movement
   - Multiple passes
   - Position tracking
   - Pattern searching

3. Computation Power:
   - Arithmetic operations
   - Complex transformations
   - Decision problems
   - General computations

## Problem-Solving Approaches:

1. Easy Problems:
   - Single-pass solutions
   - Simple marking schemes
   - Basic pattern recognition
   - Direct transformations

2. Medium Problems:
   - Multiple passes
   - Counter implementation
   - Pattern tracking
   - Basic arithmetic

3. Hard Problems:
   - Complex algorithms
   - Multiple phases
   - Multiple tracks
   - Sophisticated marking

Note: Turing Machines demonstrate computational capabilities beyond PDAs:
- Unlimited read/write memory
- Bidirectional movement
- Input modification
- Complex computations
- General problem solving
