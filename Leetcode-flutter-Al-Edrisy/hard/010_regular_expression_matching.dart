/// LeetCode 10. Regular Expression Matching (Hard)
/// Problem: Given an input string s and a pattern p, implement regular expression matching with support for '.' and '*'.
/// '.' Matches any single character.
/// '*' Matches zero or more of the preceding element.
///
/// https://leetcode.com/problems/regular-expression-matching/

class Solution {
  bool isMatch(String s, String p) {
    // DP table where dp[i][j] represents if s[0...i-1] matches p[0...j-1]
    List<List<bool>> dp = List.generate(s.length + 1,
        (_) => List.filled(p.length + 1, false));
    
    // Empty string matches empty pattern
    dp[0][0] = true;
    
    // Handle patterns like a*, a*b*, a*b*c* which can match empty string
    for (int j = 2; j <= p.length; j++) {
      if (p[j - 1] == '*') {
        dp[0][j] = dp[0][j - 2];
      }
    }
    
    // Fill the DP table
    for (int i = 1; i <= s.length; i++) {
      for (int j = 1; j <= p.length; j++) {
        if (p[j - 1] == '*') {
          // '*' can match zero characters of preceding element
          dp[i][j] = dp[i][j - 2];
          
          // Or '*' can match one or more characters of preceding element
          if (p[j - 2] == '.' || p[j - 2] == s[i - 1]) {
            dp[i][j] = dp[i][j] || dp[i - 1][j];
          }
        } else if (p[j - 1] == '.' || p[j - 1] == s[i - 1]) {
          // Current characters match
          dp[i][j] = dp[i - 1][j - 1];
        }
      }
    }
    
    return dp[s.length][p.length];
  }
}

void main() {
  final sol = Solution();
  print(sol.isMatch("aa", "a"));          // Output: false
  print(sol.isMatch("aa", "*"));          // Output: false
  print(sol.isMatch("aa", "."));          // Output: false
  print(sol.isMatch("aa", "a"));          // Output: false
  print(sol.isMatch("aa", "a*"));         // Output: true
  print(sol.isMatch("ab", ".*"));         // Output: true
  print(sol.isMatch("aab", "c*a*b"));     // Output: true
}
