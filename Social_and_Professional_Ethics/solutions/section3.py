def score_of_string(s: str) -> int:
    score = 0
    for i in range(len(s) - 1):
        score += abs(ord(s[i]) - ord(s[i + 1]))
    return score


# test case 1
s1 = "hello"
result1 = score_of_string(s1)
print("1. result:", result1)
assert result1 == 13, f"คำตอบที่คาดไว้คือ 13 แต่ได้ {result1}"

# test case 2
s2 = "zaz"
result2 = score_of_string(s2)
print("2. result:", result2)
assert result2 == 50, f"คำตอบที่คาดไว้คือ 50 แต่ได้ {result2}"

# test case 3
s3 = "a"
result3 = score_of_string(s3)
print("3. result:", result3)
assert result3 == 0, f"คำตอบที่คาดไว้คือ 0 แต่ได้ {result3}"

# test case 4
s4 = "abc"
result4 = score_of_string(s4)
print("4. result:", result4)
assert result4 == 2, f"คำตอบที่คาดไว้คือ 2 แต่ได้ {result4}"