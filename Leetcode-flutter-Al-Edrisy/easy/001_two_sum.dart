/// LeetCode 1. Two Sum (Easy)
/// Problem: Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.
///
/// https://leetcode.com/problems/two-sum/

class Solution {
  List<int> twoSum(List<int> nums, int target) {
    // Use a HashMap to store value -> index mapping
    Map<int, int> numMap = {};
    
    for (int i = 0; i < nums.length; i++) {
      int complement = target - nums[i];
      
      // Check if complement exists in map
      if (numMap.containsKey(complement)) {
        return [numMap[complement]!, i];
      }
      
      // Store current number and its index
      numMap[nums[i]] = i;
    }
    
    return [];
  }
}

void main() {
  final sol = Solution();
  print(sol.twoSum([2, 7, 11, 15], 9)); 
}
