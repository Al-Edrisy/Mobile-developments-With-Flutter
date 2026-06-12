/// LeetCode 2. Add Two Numbers (Medium)
/// Problem: You are given two non-empty linked lists representing two non-negative integers.
/// The digits are stored in reverse order and each of their nodes contains a single digit.
/// Add the two numbers and return the sum as a linked list.
///
/// https://leetcode.com/problems/add-two-numbers/

class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode dummyHead = ListNode(0);
    ListNode current = dummyHead;
    int carry = 0;
    
    while (l1 != null || l2 != null || carry != 0) {
      int sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry;
      carry = sum ~/ 10;
      int digit = sum % 10;
      
      current.next = ListNode(digit);
      current = current.next!;
      
      l1 = l1?.next;
      l2 = l2?.next;
    }
    
    return dummyHead.next;
  }
}

ListNode? createList(List<int> values) {
  if (values.isEmpty) return null;
  ListNode head = ListNode(values[0]);
  ListNode current = head;
  for (int i = 1; i < values.length; i++) {
    current.next = ListNode(values[i]);
    current = current.next!;
  }
  return head;
}

void printList(ListNode? head) {
  List<int> result = [];
  while (head != null) {
    result.add(head.val);
    head = head.next;
  }
  print(result);
}

void main() {
  final sol = Solution();
  
  // Example: 342 + 465 = 807
  ListNode? l1 = createList([2, 4, 3]);
  ListNode? l2 = createList([5, 6, 4]);
  ListNode? result = sol.addTwoNumbers(l1, l2);
  printList(result); // Output: [7, 0, 8]
}
