/// LeetCode 4. Median of Two Sorted Arrays (Hard)
/// Problem: Given two sorted arrays nums1 and nums2 of size m and n respectively,
/// return the median of the two sorted arrays.
///
/// https://leetcode.com/problems/median-of-two-sorted-arrays/

class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    // Ensure nums1 is the smaller array to minimize binary search range
    if (nums1.length > nums2.length) {
      return findMedianSortedArrays(nums2, nums1);
    }
    
    int m = nums1.length;
    int n = nums2.length;
    int low = 0;
    int high = m;
    
    while (low <= high) {
      int partition1 = (low + high) ~/ 2;
      int partition2 = (m + n + 1) ~/ 2 - partition1;
      
      // Handle edge cases
      int left1 = partition1 == 0 ? -2147483648 : nums1[partition1 - 1];
      int right1 = partition1 == m ? 2147483647 : nums1[partition1];
      
      int left2 = partition2 == 0 ? -2147483648 : nums2[partition2 - 1];
      int right2 = partition2 == n ? 2147483647 : nums2[partition2];
      
      // Check if we found the correct partition
      if (left1 <= right2 && left2 <= right1) {
        // If total length is even
        if ((m + n) % 2 == 0) {
          return ((left1 > left2 ? left1 : left2) + 
                  (right1 < right2 ? right1 : right2)) / 2.0;
        } else {
          // If total length is odd
          return (left1 > left2 ? left1 : left2).toDouble();
        }
      } else if (left1 > right2) {
        high = partition1 - 1;
      } else {
        low = partition1 + 1;
      }
    }
    
    return -1.0;
  }
}

void main() {
  final sol = Solution();
  print(sol.findMedianSortedArrays([1, 3], [2]));           // Output: 2.0
  print(sol.findMedianSortedArrays([1, 2], [3, 4]));        // Output: 2.5
}
