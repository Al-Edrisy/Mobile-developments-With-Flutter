/// LeetCode 9. Palindrome Number (Easy)
/// Problem: Given an integer x, return true if x is a palindrome, and false otherwise.
///
/// https://leetcode.com/problems/palindrome-number/

class Solution {
  bool isPalindrome(int x) {
    if (x < 0) return false;
    
    int reversed = 0;
    int original = x;
    
    while (x > 0) {
      reversed = reversed * 10 + (x % 10);
      x ~/= 10;
    }
    
    return original == reversed;
  }
}

void main() {
  final sol = Solution();
  print(sol.isPalindrome(121)); // Expected: true
  print(sol.isPalindrome(-121)); // Expected: false
  print(sol.isPalindrome(10)); // Expected: false
}
