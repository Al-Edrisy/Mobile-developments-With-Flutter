/// LeetCode 1. Two Sum (Easy)
/// Problem: Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.
///
/// https://leetcode.com/problems/two-sum/

class Solution {
  List<int> twoSum(List<int> nums, int target) {
    Map<int, int> map = {};
    for (int i = 0; i < nums.length; i++) {
      int complement = target - nums[i];
      if (map.containsKey(complement)) {
        return [map[complement]!, i];
      }
      map[nums[i]] = i;
    }
    return [];
  }
}

void main() {
  final sol = Solution();
  print(sol.twoSum([2, 7, 11, 15], 9)); // Expected: [0, 1]
}
