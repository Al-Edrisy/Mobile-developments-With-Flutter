/// LeetCode 11. Container With Most Water (Medium)
/// Problem: You are given an integer array height of length n.
/// There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).
/// Find two lines that together with the x-axis form a container, such that the container contains the most water.
///
/// https://leetcode.com/problems/container-with-most-water/

class Solution {
  int maxArea(List<int> height) {
    int maxWater = 0;
    int left = 0;
    int right = height.length - 1;
    
    while (left < right) {
      // Calculate current area
      int width = right - left;
      int h = height[left] < height[right] ? height[left] : height[right];
      int area = width * h;
      
      // Update max area
      maxWater = maxWater > area ? maxWater : area;
      
      // Move the pointer pointing to the shorter line
      if (height[left] < height[right]) {
        left++;
      } else {
        right--;
      }
    }
    
    return maxWater;
  }
}

void main() {
  final sol = Solution();
  print(sol.maxArea([1,8,6,2,5,4,8,3,7]));  // Output: 49
  print(sol.maxArea([1,1]));                  // Output: 1
}
