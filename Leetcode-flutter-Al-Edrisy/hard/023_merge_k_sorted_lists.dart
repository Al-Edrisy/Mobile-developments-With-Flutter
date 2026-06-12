/// LeetCode 23. Merge k Sorted Lists (Hard)
/// Problem: You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
/// Merge all the linked-lists into one sorted linked-list and return it.
///
/// https://leetcode.com/problems/merge-k-sorted-lists/

class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

class Solution {
  ListNode? mergeKLists(List<ListNode?> lists) {
    if (lists.isEmpty) return null;
    return mergeListsHelper(lists, 0, lists.length - 1);
  }
  
  ListNode? mergeListsHelper(List<ListNode?> lists, int left, int right) {
    if (left == right) return lists[left];
    if (left > right) return null;
    
    int mid = left + (right - left) ~/ 2;
    ListNode? l1 = mergeListsHelper(lists, left, mid);
    ListNode? l2 = mergeListsHelper(lists, mid + 1, right);
    
    return merge(l1, l2);
  }
  
  ListNode? merge(ListNode? l1, ListNode? l2) {
    ListNode dummyHead = ListNode(0);
    ListNode current = dummyHead;
    
    while (l1 != null && l2 != null) {
      if (l1.val <= l2.val) {
        current.next = l1;
        l1 = l1.next;
      } else {
        current.next = l2;
        l2 = l2.next;
      }
      current = current.next!;
    }
    
    current.next = l1 ?? l2;
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
  
  List<ListNode?> lists = [
    createList([1, 4, 5]),
    createList([1, 3, 4]),
    createList([2, 6])
  ];
  
  ListNode? result = sol.mergeKLists(lists);
  printList(result); // Output: [1, 1, 2, 3, 4, 4, 5, 6]
}
