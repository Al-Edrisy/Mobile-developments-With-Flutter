/// LeetCode 9. Palindrome Number (Easy)
/// Problem: Given an integer x, return true if x is a palindrome, and false otherwise.
///
/// https://leetcode.com/problems/palindrome-number/

class Solution {
  bool isPalindrome(int x) {
    // Negative numbers are not palindromes
    if (x < 0) return false;
    
    // Single digit numbers are palindromes
    if (x < 10) return true;
    
    // Numbers ending with 0 are not palindromes (except 0 itself)
    if (x % 10 == 0) return false;
    
    // Reverse half of the number and compare
    int reversed = 0;
    while (x > reversed) {
      reversed = reversed * 10 + x % 10;
      x ~/= 10;
    }
    
    // For even length: x == reversed
    // For odd length: x == reversed ~/ 10 (middle digit doesn't matter)
    return x == reversed || x == reversed ~/ 10;
  }
}

void main() {
  final sol = Solution();
  print(sol.isPalindrome(121));
}
