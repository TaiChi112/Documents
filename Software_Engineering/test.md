accurracy = TP+TN / (TP + TN + FP + FN)
precision = TP / (TP + FP)
recall = TP / (TP + FN)
f1_score = 2 * (precision * recall) / (precision + recall)

accuracy =  106/60 (106 + 60 + 4 + 1)
precision = 106 / (106 + 4)
recall = 106 / (106 + 1)
f1_score = 2 * (0.963 * 0.990) / (0.963 + 0.990)
accuracy = 0.964
precision = 0.963
recall = 0.990
f1_score = 0.976

accuracy = 60+106 / (60 + 106 + 4 + 1)
accuracy = 166 / (166 + 4 + 1)
accuracy = 166 / 171
accuracy = 0.970

precision = 106 / (106 + 4)
precision = 106 / 110
precision = 0.9636

recall = 106 / (106 + 1)
recall = 106 / 107
recall = 0.9906

f1_score = 2 * (0.9636 * 0.9906) / (0.9636 + 0.9906)
f1_score = 2 * (0.9636 * 0.9906)
f1_score = 0.9761

TP คืออะไร
- True Positive คือ จำนวนตัวอย่างที่โมเดลทำนายว่าจริงและจริง
TN คืออะไร
- True Negative คือ จำนวนตัวอย่างที่โมเดลทำนายว่าไม่จริงและไม่จริง
FP คืออะไร
- False Positive คือ จำนวนตัวอย่างที่โมเดลทำนายว่าจริงแต่ไม่จริง
FN คืออะไร
- False Negative คือ จำนวนตัวอย่างที่โมเดลทำนายว่าไม่จริงแต่จริง 


