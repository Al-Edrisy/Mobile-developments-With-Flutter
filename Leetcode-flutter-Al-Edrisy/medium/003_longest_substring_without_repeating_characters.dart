/// LeetCode 3. Longest Substring Without Repeating Characters (Medium)
/// Problem: Given a string s, find the length of the longest substring without repeating characters.
///
/// https://leetcode.com/problems/longest-substring-without-repeating-characters/

class Solution {
  int lengthOfLongestSubstring(String s) {
    // Use a sliding window approach with a hash map
    Map<String, int> charIndex = {};
    int maxLen = 0;
    int left = 0;
    
    for (int right = 0; right < s.length; right++) {
      String char = s[right];
      
      // If character is already in window, move left pointer
      if (charIndex.containsKey(char) && charIndex[char]! >= left) {
        left = charIndex[char]! + 1;
      }
      
      // Update character's latest position
      charIndex[char] = right;
      
      // Update max length
      maxLen = maxLen > (right - left + 1) ? maxLen : (right - left + 1);
    }
    
    return maxLen;
  }
}

void main() {
  final sol = Solution();
  print(sol.lengthOfLongestSubstring("abcabcbb")); // Output: 3
  print(sol.lengthOfLongestSubstring("bbbbb"));    // Output: 1
  print(sol.lengthOfLongestSubstring("pwwkew"));   // Output: 3
}
