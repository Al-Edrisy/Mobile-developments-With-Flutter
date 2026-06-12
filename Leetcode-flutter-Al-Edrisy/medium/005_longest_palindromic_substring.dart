/// LeetCode 5. Longest Palindromic Substring (Medium)
/// Problem: Given a string s, return the longest palindromic substring in s.
///
/// https://leetcode.com/problems/longest-palindromic-substring/

class Solution {
  String longestPalindrome(String s) {
    if (s.length < 2) return s;
    
    int start = 0;
    int maxLen = 1;
    
    // Helper function to expand around center
    int expandAroundCenter(int left, int right) {
      while (left >= 0 && right < s.length && s[left] == s[right]) {
        left--;
        right++;
      }
      // Return length of palindrome
      return right - left - 1;
    }
    
    for (int i = 0; i < s.length; i++) {
      // Odd length palindromes (single character center)
      int len1 = expandAroundCenter(i, i);
      // Even length palindromes (two character center)
      int len2 = expandAroundCenter(i, i + 1);
      
      int len = len1 > len2 ? len1 : len2;
      
      if (len > maxLen) {
        maxLen = len;
        start = i - (len - 1) ~/ 2;
      }
    }
    
    return s.substring(start, start + maxLen);
  }
}

void main() {
  final sol = Solution();
  print(sol.longestPalindrome("babad"));      // Output: "bab" or "aba"
  print(sol.longestPalindrome("cbbd"));       // Output: "bb"
  print(sol.longestPalindrome("racecar"));    // Output: "racecar"
}
