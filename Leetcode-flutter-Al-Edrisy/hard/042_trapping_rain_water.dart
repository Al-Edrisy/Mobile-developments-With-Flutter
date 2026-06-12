/// LeetCode 42. Trapping Rain Water (Hard)
/// Problem: Given n non-negative integers representing an elevation map where the width of each bar is 1,
/// compute how much water it can trap after raining.
///
/// https://leetcode.com/problems/trapping-rain-water/

class Solution {
  int trap(List<int> height) {
    if (height.isEmpty) return 0;
    
    // Find max height from left to each position
    List<int> maxLeft = List.filled(height.length, 0);
    maxLeft[0] = height[0];
    for (int i = 1; i < height.length; i++) {
      maxLeft[i] = maxLeft[i - 1] > height[i] ? maxLeft[i - 1] : height[i];
    }
    
    // Find max height from right to each position
    List<int> maxRight = List.filled(height.length, 0);
    maxRight[height.length - 1] = height[height.length - 1];
    for (int i = height.length - 2; i >= 0; i--) {
      maxRight[i] = maxRight[i + 1] > height[i] ? maxRight[i + 1] : height[i];
    }
    
    // Calculate water trapped
    int water = 0;
    for (int i = 0; i < height.length; i++) {
      int minHeight = maxLeft[i] < maxRight[i] ? maxLeft[i] : maxRight[i];
      water += minHeight - height[i];
    }
    
    return water;
  }
}

void main() {
  final sol = Solution();
  print(sol.trap([0,1,0,2,1,0,1,3,2,1,2,1]));  // Output: 6
  print(sol.trap([4,2,0,3,2,5]));               // Output: 9
}
