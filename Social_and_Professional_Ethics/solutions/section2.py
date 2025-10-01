# Define constant for output message
MEDIAN_MSG = "Median:"

class Solution:
    def find_median_sorted_arrays(self, nums1, nums2):
        merged = nums1 + nums2

        merged.sort()

        total = len(merged)

        if total % 2 == 1:
            return float(merged[total // 2])
        else:
            middle1 = merged[total // 2 - 1]
            middle2 = merged[total // 2]
            return (middle1 + middle2) / 2
        
# Example usage:
solution = Solution()
nums1 = [1, 3]
nums2 = [2]
median = solution.find_median_sorted_arrays(nums1, nums2)
print(MEDIAN_MSG, median)
nums2 = [2]
# test case 2
nums1 = [1, 2]
nums2 = [3, 4]
median = solution.find_median_sorted_arrays(nums1, nums2)
print(MEDIAN_MSG, median)
nums2 = [3, 4]
# test case 3
nums1 = [0, 0]
nums2 = [0, 0]
median = solution.find_median_sorted_arrays(nums1, nums2)
print(MEDIAN_MSG, median)
# test case 4
nums1 = []
nums2 = [1]
median = solution.find_median_sorted_arrays(nums1, nums2)
print(MEDIAN_MSG, median)
nums2 = [1]
median = solution.find_median_sorted_arrays(nums1, nums2)
print("Median:", median)