import '../models/snippet.dart';

List<Snippet> getDsaSnippets() {
  return [
    // -------------------------------------------------------------------------
    // 1. Introduction to DSA
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_001'
      ..topicId = 'dsa'
      ..title = 'Time & Space Complexity'
      ..description = 'Big O Notation: Analyzing algorithm efficiency in terms of input size (n).'
      ..code = '''// O(1) - Constant Time
int getFirst(List<int> arr) => arr[0];

// O(n) - Linear Time
void printAll(List<int> arr) {
  for (var x in arr) print(x);
}

// O(log n) - Logarithmic (e.g., Binary Search)
// O(n²) - Quadratic (e.g., Bubble Sort)'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Introduction to DSA'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_002'
      ..topicId = 'dsa'
      ..title = 'Recursion Basics'
      ..description = 'A function calling itself with a base case to solve smaller subproblems.'
      ..code = '''int factorial(int n) {
  if (n <= 1) return 1; // Base case
  return n * factorial(n - 1); // Recursive call
}

int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Introduction to DSA'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 2. Arrays & Hashing
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_003'
      ..topicId = 'dsa'
      ..title = 'Array Basics'
      ..description = 'Linear data structure with contiguous memory. Support O(1) access by index.'
      ..code = '''List<int> arr = [1, 2, 3, 4, 5];

// Insert at end: O(1)
arr.add(6);

// Access by index: O(1)
int val = arr[2];

// Remove at index: O(n)
arr.removeAt(1);'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Arrays & Hashing'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_004'
      ..topicId = 'dsa'
      ..title = 'Prefix Sum'
      ..description = 'Preprocessing technique to answer range-sum queries in O(1) time.'
      ..code = '''List<int> buildPrefixSum(List<int> arr) {
  List<int> p = [arr[0]];
  for (int i = 1; i < arr.length; i++) {
    p.add(p[i - 1] + arr[i]);
  }
  return p;
}

// Range Sum [i, j] = P[j] - P[i-1]
int rangeSum(List<int> p, int i, int j) {
  if (i == 0) return p[j];
  return p[j] - p[i - 1];
}'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'Arrays & Hashing'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_005'
      ..topicId = 'dsa'
      ..title = 'Sliding Window'
      ..description = 'Efficient technique for subarray problems (running sum, longest substring).'
      ..code = '''int maxSum(List<int> arr, int k) {
  int window = 0;
  for (int i = 0; i < k; i++) window += arr[i];

  int res = window;
  for (int i = k; i < arr.length; i++) {
    window += arr[i] - arr[i - k];
    if (window > res) res = window;
  }
  return res;
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Arrays & Hashing'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_006'
      ..topicId = 'dsa'
      ..title = 'Hash Map (Dictionary)'
      ..description = 'Key-value pairs using a hash function. Average O(1) for lookup, insert, delete.'
      ..code = '''Map<String, int> scores = {'Alice': 10};
scores['Bob'] = 15;

if (scores.containsKey('Alice')) {
  print(scores['Alice']);
}

scores.remove('Bob');'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'Arrays & Hashing'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_007'
      ..topicId = 'dsa'
      ..title = 'Hash Set'
      ..description = 'Collection of unique elements with O(1) average lookup.'
      ..code = '''Set<int> seen = {1, 2, 3};
seen.add(4);
seen.add(1); // Duplicate: ignored

bool exists = seen.contains(2); // O(1)'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'Arrays & Hashing'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 3. Searching Algorithms
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_008'
      ..topicId = 'dsa'
      ..title = 'Linear Search'
      ..description = 'Simple search by checking every element. O(n) time complexity.'
      ..code = '''int linearSearch(List<int> arr, int target) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == target) return i;
  }
  return -1;
}'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Searching Algorithms'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_009'
      ..topicId = 'dsa'
      ..title = 'Binary Search'
      ..description = 'Divide-and-conquer search on sorted arrays. O(log n) efficiency.'
      ..code = '''int binarySearch(List<int> arr, int target) {
  int lo = 0, hi = arr.length - 1;
  while (lo <= hi) {
    int mid = lo + (hi - lo) ~/ 2;
    if (arr[mid] == target) return mid;
    if (arr[mid] < target) lo = mid + 1;
    else hi = mid - 1;
  }
  return -1;
}'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'Searching Algorithms'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_010'
      ..topicId = 'dsa'
      ..title = 'KMP (String Matching)'
      ..description = 'Knuth-Morris-Pratt avoids redundant comparisons using a failure function.'
      ..code = '''List<int> kmp(String text, String pattern) {
  List<int> lps = buildLPS(pattern);
  List<int> matches = [];
  int i = 0, j = 0;
  while (i < text.length) {
    if (text[i] == pattern[j]) { i++; j++; }
    if (j == pattern.length) {
      matches.add(i - j); j = lps[j - 1];
    } else if (i < text.length && text[i] != pattern[j]) {
      if (j != 0) j = lps[j - 1]; else i++;
    }
  }
  return matches;
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Searching Algorithms'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 4. Sorting Algorithms
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_011'
      ..topicId = 'dsa'
      ..title = 'Bubble Sort'
      ..description = 'Repeatedly swap adjacent elements if they are in wrong order. O(n²).'
      ..code = '''void bubbleSort(List<int> arr) {
  for (int i = 0; i < arr.length; i++) {
    for (int j = 0; j < arr.length - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int tmp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = tmp;
      }
    }
  }
}'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Sorting Algorithms'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_012'
      ..topicId = 'dsa'
      ..title = 'Selection Sort'
      ..description = 'Repeatedly find minimum element and move to sorted part. O(n²).'
      ..code = '''void selectionSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int min = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[min]) min = j;
    }
    int tmp = arr[i]; arr[i] = arr[min]; arr[min] = tmp;
  }
}'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Sorting Algorithms'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_013'
      ..topicId = 'dsa'
      ..title = 'Insertion Sort'
      ..description = 'Builds sorted array one element at a time like sorting cards. O(n²).'
      ..code = '''void insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i], j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j]; j--;
    }
    arr[j + 1] = key;
  }
}'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Sorting Algorithms'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_014'
      ..topicId = 'dsa'
      ..title = 'Merge Sort'
      ..description = 'Divide-and-conquer recursive sort. O(n log n) guaranteed.'
      ..code = '''List<int> mergeSort(List<int> arr) {
  if (arr.length <= 1) return arr;
  int mid = arr.length ~/ 2;
  var l = mergeSort(arr.sublist(0, mid));
  var r = mergeSort(arr.sublist(mid));
  return merge(l, r);
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Sorting Algorithms'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_015'
      ..topicId = 'dsa'
      ..title = 'Quick Sort'
      ..description = 'Efficient pivot-based sorting. Average O(n log n).'
      ..code = '''void quickSort(List<int> arr, int lo, int hi) {
  if (lo < hi) {
    int p = partition(arr, lo, hi);
    quickSort(arr, lo, p - 1);
    quickSort(arr, p + 1, hi);
  }
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Sorting Algorithms'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_016'
      ..topicId = 'dsa'
      ..title = 'Counting Sort'
      ..description = 'Non-comparison sort for specific ranges. O(n+k) linear time.'
      ..code = '''List<int> countingSort(List<int> arr, int maxVal) {
  List<int> count = List.filled(maxVal + 1, 0);
  for (var x in arr) count[x]++;
  List<int> res = [];
  for (int i = 0; i <= maxVal; i++) {
    while (count[i]-- > 0) res.add(i);
  }
  return res;
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Sorting Algorithms'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 5. Stacks and Queues
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_017'
      ..topicId = 'dsa'
      ..title = 'Stack (LIFO)'
      ..description = 'Last-In-First-Out: Push to top, Pop from top. Constant time O(1).'
      ..code = '''class Stack<T> {
  final List<T> _items = [];
  void push(T val) => _items.add(val);
  T pop() => _items.removeLast();
  T get peek => _items.last;
  bool get isEmpty => _items.isEmpty;
}'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Stacks and Queues'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_018'
      ..topicId = 'dsa'
      ..title = 'Queue (FIFO)'
      ..description = 'First-In-First-Out: Enqueue to back, Dequeue from front.'
      ..code = '''class Queue<T> {
  final List<T> _items = [];
  void enqueue(T val) => _items.add(val);
  T dequeue() => _items.removeAt(0);
  bool get isEmpty => _items.isEmpty;
}'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Stacks and Queues'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_019'
      ..topicId = 'dsa'
      ..title = 'LRU Cache'
      ..description = 'Least Recently Used cache using Map + Double Linked List logic.'
      ..code = '''class LRUCache {
  final int capacity;
  final Map<int, int> _map = {};
  final List<int> _order = [];
  LRUCache(this.capacity);

  void put(int key, int val) {
    if (_map.containsKey(key)) _order.remove(key);
    else if (_map.length >= capacity) _map.remove(_order.removeAt(0));
    _map[key] = val; _order.add(key);
  }
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Stacks and Queues'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 6. Linked Lists
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_020'
      ..topicId = 'dsa'
      ..title = 'Singly Linked List'
      ..description = 'Linear structure where nodes point to the next node.'
      ..code = '''class Node {
  int data; Node? next;
  Node(this.data);
}

void printList(Node? head) {
  while (head != null) {
    print(head.data); head = head.next;
  }
}'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'Linked Lists'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_021'
      ..topicId = 'dsa'
      ..title = 'Cycle Detection (Floyd)'
      ..description = "Use slow and fast pointers to detect a loop in a linked list."
      ..code = '''bool hasCycle(Node? head) {
  Node? slow = head, fast = head;
  while (fast != null && fast.next != null) {
    slow = slow!.next;
    fast = fast.next!.next;
    if (slow == fast) return true;
  }
  return false;
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Linked Lists'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 7. Trees
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_022'
      ..topicId = 'dsa'
      ..title = 'Binary Search Tree (BST)'
      ..description = 'Left < Node < Right. Search, Insert, Delete in O(log n) average.'
      ..code = '''class BSTNode {
  int val; BSTNode? l, r;
  BSTNode(this.val);
}

BSTNode? insert(BSTNode? root, int val) {
  if (root == null) return BSTNode(val);
  if (val < root.val) root.l = insert(root.l, val);
  else root.r = insert(root.r, val);
  return root;
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Trees'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_023'
      ..topicId = 'dsa'
      ..title = 'Trie (Prefix Tree)'
      ..description = 'Special tree for efficient string searches and prefix Matching.'
      ..code = '''class TrieNode {
  Map<String, TrieNode> child = {};
  bool isEnd = false;
}

void insert(TrieNode root, String word) {
  var cur = root;
  for (var c in word.split('')) {
    cur = cur.child.putIfAbsent(c, () => TrieNode());
  }
  cur.isEnd = true;
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Trees'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 8. Advanced Trees
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_024'
      ..topicId = 'dsa'
      ..title = 'Segment Tree'
      ..description = 'Handle range queries (sum, min, max) and point updates in O(log n).'
      ..code = '''class SegTree {
  List<int> tree; int n;
  SegTree(int size) : n = size, tree = List.filled(size * 4, 0);

  void update(int v, int tl, int tr, int pos, int val) {
    if (tl == tr) tree[v] = val;
    else {
      int tm = (tl + tr) ~/ 2;
      if (pos <= tm) update(2*v, tl, tm, pos, val);
      else update(2*v+1, tm+1, tr, pos, val);
      tree[v] = tree[2*v] + tree[2*v+1];
    }
  }
}'''
      ..language = 'dart'
      ..difficulty = 'very_hard'
      ..section = 'Advanced Trees'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 9. Graphs
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_025'
      ..topicId = 'dsa'
      ..title = 'BFS'
      ..description = 'Level-order traversal using a queue. O(V+E).'
      ..code = '''void bfs(Map<int, List<int>> adj, int start) {
  var visited = {start}, q = [start];
  while (q.isNotEmpty) {
    var u = q.removeAt(0); print(u);
    for (var v in adj[u] ?? []) {
      if (!visited.contains(v)) {
        visited.add(v); q.add(v);
      }
    }
  }
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Graphs'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_026'
      ..topicId = 'dsa'
      ..title = 'DFS'
      ..description = 'Depth-first search using recursion or stack. O(V+E).'
      ..code = '''void dfs(Map<int, List<int>> adj, int u, Set<int> vis) {
  vis.add(u); print(u);
  for (var v in adj[u] ?? []) {
    if (!vis.contains(v)) dfs(adj, v, vis);
  }
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Graphs'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_027'
      ..topicId = 'dsa'
      ..title = 'Dijkstra'
      ..description = 'Shortest path in weighted graph (no negative edges). O(E log V).'
      ..code = '''void dijkstra(Map<int, List<List<int>>> adj, int src) {
  var dist = {src: 0}, pq = [[0, src]];
  while (pq.isNotEmpty) {
    pq.sort((a,b) => a[0].compareTo(b[0]));
    var u = pq.removeAt(0)[1];
    for (var edge in adj[u] ?? []) {
        int v = edge[0], w = edge[1];
        if (dist[u]! + w < (dist[v] ?? 99999)) {
            dist[v] = dist[u]! + w; pq.add([dist[v]!, v]);
        }
    }
  }
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Graphs'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_028'
      ..topicId = 'dsa'
      ..title = 'Union-Find'
      ..description = 'Disjoint Set Union (DSU) with path compression and rank.'
      ..code = '''class DSU {
  List<int> p;
  DSU(int n) : p = List.generate(n, (i) => i);
  int find(int i) => p[i] == i ? i : p[i] = find(p[i]);
  void union(int i, int j) => p[find(i)] = find(j);
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Graphs'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 10. Dynamic Programming
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_029'
      ..topicId = 'dsa'
      ..title = '0/1 Knapsack'
      ..description = 'Maximize value without exceeding weight capacity.'
      ..code = '''int knapsack(List<int> w, List<int> v, int cap) {
  int n = v.length;
  var dp = List.generate(n+1, (_) => List.filled(cap+1, 0));
  for (int i = 1; i <= n; i++)
    for (int j = 0; j <= cap; j++)
      dp[i][j] = (w[i-1] > j) ? dp[i-1][j]
                 : max(dp[i-1][j], v[i-1] + dp[i-1][j-w[i-1]]);
  return dp[n][cap];
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Dynamic Programming'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_030'
      ..topicId = 'dsa'
      ..title = 'Edit Distance'
      ..description = 'Min operations to turn string A into B (Insert, Delete, Replace).'
      ..code = '''int editDist(String a, String b) {
  int m = a.length, n = b.length;
  var dp = List.generate(m+1, (_) => List.filled(n+1, 0));
  for (int i = 0; i <= m; i++)
    for (int j = 0; j <= n; j++) {
      if (i == 0) dp[i][j] = j;
      else if (j == 0) dp[i][j] = i;
      else if (a[i-1] == b[j-1]) dp[i][j] = dp[i-1][j-1];
      else dp[i][j] = 1 + min(dp[i-1][j], min(dp[i][j-1], dp[i-1][j-1]));
    }
  return dp[m][n];
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Dynamic Programming'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 11. Greedy Algorithms
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_031'
      ..topicId = 'dsa'
      ..title = 'Fractional Knapsack'
      ..description = 'Greedy approach: take items with highest value/weight ratio first.'
      ..code = '''double getMaxValue(List<int> w, List<int> v, int cap) {
  var r = List.generate(v.length, (i) => [v[i]/w[i], w[i], v[i]]);
  r.sort((a,b) => b[0].compareTo(a[0]));
  double res = 0.0;
  for (var x in r) {
    if (cap >= x[1]) { cap -= x[1].toInt(); res += x[2]; }
    else { res += x[0] * cap; break; }
  }
  return res;
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Greedy Algorithms'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_032'
      ..topicId = 'dsa'
      ..title = 'Activity Selection'
      ..description = 'Greedy: select max non-overlapping activities sorted by end time.'
      ..code = '''int activitySelection(List<int> start, List<int> end) {
  List<List<int>> activities = List.generate(
    start.length, (i) => [start[i], end[i]]);
  activities.sort((a, b) => a[1].compareTo(b[1]));

  int count = 1, lastEnd = activities[0][1];
  for (int i = 1; i < activities.length; i++) {
    if (activities[i][0] >= lastEnd) {
      count++;
      lastEnd = activities[i][1];
    }
  }
  return count;
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Greedy Algorithms'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_033'
      ..topicId = 'dsa'
      ..title = 'Jump Game'
      ..description = 'Greedy: check if you can reach the last index from any position.'
      ..code = '''bool canJump(List<int> nums) {
  int maxReach = 0;
  for (int i = 0; i < nums.length; i++) {
    if (i > maxReach) return false;
    maxReach = max(maxReach, i + nums[i]);
  }
  return true;
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Greedy Algorithms'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 12. Two Pointers & Sliding Window
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_034'
      ..topicId = 'dsa'
      ..title = 'Two Sum (Sorted)'
      ..description = 'Two pointers on sorted array to find pair with given target sum.'
      ..code = '''List<int> twoSum(List<int> arr, int target) {
  int lo = 0, hi = arr.length - 1;
  while (lo < hi) {
    int s = arr[lo] + arr[hi];
    if (s == target) return [lo, hi];
    if (s < target) lo++;
    else hi--;
  }
  return [];
}'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'Two Pointers'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_035'
      ..topicId = 'dsa'
      ..title = 'Longest Substring Without Repeating'
      ..description = 'Sliding window + set to find longest unique-character substring.'
      ..code = '''int lengthOfLongestSubstring(String s) {
  Map<String, int> map = {};
  int lo = 0, res = 0;
  for (int hi = 0; hi < s.length; hi++) {
    String c = s[hi];
    if (map.containsKey(c) && map[c]! >= lo) lo = map[c]! + 1;
    map[c] = hi;
    res = max(res, hi - lo + 1);
  }
  return res;
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Two Pointers'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_036'
      ..topicId = 'dsa'
      ..title = 'Container With Most Water'
      ..description = 'Two pointers: maximize area = min(h[l], h[r]) * (r - l).'
      ..code = '''int maxArea(List<int> h) {
  int lo = 0, hi = h.length - 1, res = 0;
  while (lo < hi) {
    res = max(res, min(h[lo], h[hi]) * (hi - lo));
    if (h[lo] < h[hi]) lo++;
    else hi--;
  }
  return res;
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Two Pointers'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 13. Heaps & Priority Queues
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_037'
      ..topicId = 'dsa'
      ..title = 'Min Heap'
      ..description = 'Parent is always smaller than children. Insert & extract in O(log n).'
      ..code = '''class MinHeap {
  List<int> heap = [];

  void insert(int val) {
    heap.add(val);
    _bubbleUp(heap.length - 1);
  }

  int extractMin() {
    int min = heap[0];
    heap[0] = heap.removeLast();
    _sinkDown(0);
    return min;
  }

  void _bubbleUp(int i) {
    while (i > 0) {
      int p = (i - 1) ~/ 2;
      if (heap[p] <= heap[i]) break;
      _swap(i, p); i = p;
    }
  }

  void _sinkDown(int i) {
    int n = heap.length;
    while (true) {
      int l = 2*i+1, r = 2*i+2, smallest = i;
      if (l < n && heap[l] < heap[smallest]) smallest = l;
      if (r < n && heap[r] < heap[smallest]) smallest = r;
      if (smallest == i) break;
      _swap(i, smallest); i = smallest;
    }
  }

  void _swap(int a, int b) {
    int tmp = heap[a]; heap[a] = heap[b]; heap[b] = tmp;
  }
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Heaps'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_038'
      ..topicId = 'dsa'
      ..title = 'K Largest Elements'
      ..description = 'Use a min-heap of size K to track the K largest elements. O(n log k).'
      ..code = '''List<int> kLargest(List<int> arr, int k) {
  // Dart: simulate min-heap via sorted list for clarity
  List<int> heap = arr.sublist(0, k)..sort();
  for (int i = k; i < arr.length; i++) {
    if (arr[i] > heap[0]) {
      heap[0] = arr[i];
      heap.sort(); // In production use a proper heap
    }
  }
  return heap;
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Heaps'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_039'
      ..topicId = 'dsa'
      ..title = 'Merge K Sorted Lists'
      ..description = 'Use a min-heap to merge K sorted lists efficiently. O(n log k).'
      ..code = '''List<int> mergeKSorted(List<List<int>> lists) {
  // Flatten + sort approach (for interview concept clarity)
  List<int> all = lists.expand((l) => l).toList();
  all.sort();
  return all

  // Production: use a min-heap of (value, listIndex, elemIndex)
  // to poll smallest element across all K lists.
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Heaps'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 14. Backtracking
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_040'
      ..topicId = 'dsa'
      ..title = 'Subsets'
      ..description = 'Generate all subsets of a list using backtracking. O(2^n).'
      ..code = '''List<List<int>> subsets(List<int> nums) {
  List<List<int>> res = [];
  void bt(int start, List<int> cur) {
    res.add(List.from(cur));
    for (int i = start; i < nums.length; i++) {
      cur.add(nums[i]);
      bt(i + 1, cur);
      cur.removeLast();
    }
  }
  bt(0, []);
  return res;
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Backtracking'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_041'
      ..topicId = 'dsa'
      ..title = 'Permutations'
      ..description = 'Generate all permutations of a list using backtracking. O(n!).'
      ..code = '''List<List<int>> permute(List<int> nums) {
  List<List<int>> res = [];
  void bt(List<int> cur, Set<int> used) {
    if (cur.length == nums.length) { res.add(List.from(cur)); return; }
    for (var n in nums) {
      if (used.contains(n)) continue;
      cur.add(n); used.add(n);
      bt(cur, used);
      cur.removeLast(); used.remove(n);
    }
  }
  bt([], {});
  return res;
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Backtracking'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_042'
      ..topicId = 'dsa'
      ..title = 'N-Queens'
      ..description = 'Place N queens on NxN board with no conflicts. Classic backtracking.'
      ..code = '''List<List<String>> solveNQueens(int n) {
  List<List<String>> res = [];
  List<int> cols = List.filled(n, -1);

  bool safe(int row, int col) {
    for (int r = 0; r < row; r++) {
      if (cols[r] == col || (cols[r] - col).abs() == (r - row).abs()) return false;
    }
    return true;
  }

  void bt(int row) {
    if (row == n) {
      res.add(List.generate(n, (r) {
        return List.generate(n, (c) => c == cols[r] ? 'Q' : '.').join();
      }));
      return;
    }
    for (int c = 0; c < n; c++) {
      if (safe(row, c)) { cols[row] = c; bt(row + 1); cols[row] = -1; }
    }
  }

  bt(0);
  return res;
}'''
      ..language = 'dart'
      ..difficulty = 'very_hard'
      ..section = 'Backtracking'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 15. Bit Manipulation
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_043'
      ..topicId = 'dsa'
      ..title = 'Bit Tricks'
      ..description = 'Common bitwise operations for competitive programming.'
      ..code = '''// Check if bit i is set
bool isSet(int n, int i) => (n & (1 << i)) != 0;

// Set bit i
int setBit(int n, int i) => n | (1 << i);

// Clear bit i
int clearBit(int n, int i) => n & ~(1 << i);

// Toggle bit i
int toggleBit(int n, int i) => n ^ (1 << i);

// Check power of 2
bool isPow2(int n) => n > 0 && (n & (n - 1)) == 0;

// Count set bits (Kernighan)
int countBits(int n) {
  int c = 0;
  while (n > 0) { n &= (n - 1); c++; }
  return c;
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Bit Manipulation'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_044'
      ..topicId = 'dsa'
      ..title = 'XOR Tricks'
      ..description = 'XOR to find single number, swap vars, and detect duplicates.'
      ..code = '''// Find the only non-duplicate element
int singleNumber(List<int> nums) => nums.reduce((a, b) => a ^ b);

// Swap two integers without temp
void swapXOR(List<int> a, int i, int j) {
  a[i] ^= a[j]; a[j] ^= a[i]; a[i] ^= a[j];
}

// XOR of 1..n
int xorUpTo(int n) {
  switch (n % 4) {
    case 0: return n;
    case 1: return 1;
    case 2: return n + 1;
    default: return 0;
  }
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Bit Manipulation'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 16. Math & Number Theory
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_045'
      ..topicId = 'dsa'
      ..title = 'GCD & LCM'
      ..description = 'Euclidean algorithm for GCD. LCM derived from GCD.'
      ..code = '''int gcd(int a, int b) => b == 0 ? a : gcd(b, a % b);

int lcm(int a, int b) => (a ~/ gcd(a, b)) * b;'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'Math & Number Theory'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_046'
      ..topicId = 'dsa'
      ..title = 'Sieve of Eratosthenes'
      ..description = 'Find all primes up to N in O(n log log n) time.'
      ..code = '''List<int> sieve(int n) {
  List<bool> isPrime = List.filled(n + 1, true);
  isPrime[0] = isPrime[1] = false;
  for (int i = 2; i * i <= n; i++) {
    if (isPrime[i]) {
      for (int j = i * i; j <= n; j += i) isPrime[j] = false;
    }
  }
  return [for (int i = 2; i <= n; i++) if (isPrime[i]) i];
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Math & Number Theory'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_047'
      ..topicId = 'dsa'
      ..title = 'Fast Power (Binary Exponentiation)'
      ..description = 'Compute a^b % mod in O(log b) using repeated squaring.'
      ..code = '''int fastPow(int base, int exp, int mod) {
  int result = 1;
  base %= mod;
  while (exp > 0) {
    if (exp % 2 == 1) result = result * base % mod;
    base = base * base % mod;
    exp ~/= 2;
  }
  return result;
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Math & Number Theory'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 17. Advanced Graphs
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_048'
      ..topicId = 'dsa'
      ..title = 'Topological Sort (Kahn\'s Algorithm)'
      ..description = 'BFS-based topological order for DAGs using in-degree counts.'
      ..code = '''List<int> topoSort(int n, List<List<int>> edges) {
  List<int> indegree = List.filled(n, 0);
  List<List<int>> adj = List.generate(n, (_) => []);
  for (var e in edges) { adj[e[0]].add(e[1]); indegree[e[1]]++; }

  List<int> q = [for (int i = 0; i < n; i++) if (indegree[i] == 0) i];
  List<int> order = [];
  while (q.isNotEmpty) {
    int u = q.removeAt(0); order.add(u);
    for (var v in adj[u]) {
      if (--indegree[v] == 0) q.add(v);
    }
  }
  return order.length == n ? order : []; // [] means cycle exists
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Advanced Graphs'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_049'
      ..topicId = 'dsa'
      ..title = 'Bellman-Ford'
      ..description = 'Shortest paths with negative edges. Detects negative cycles. O(VE).'
      ..code = '''List<int> bellmanFord(int n, List<List<int>> edges, int src) {
  List<int> dist = List.filled(n, 1 << 30);
  dist[src] = 0;
  for (int i = 0; i < n - 1; i++) {
    for (var e in edges) {
      int u = e[0], v = e[1], w = e[2];
      if (dist[u] != (1 << 30) && dist[u] + w < dist[v]) dist[v] = dist[u] + w;
    }
  }
  // Check for negative cycles
  for (var e in edges) {
    if (dist[e[0]] + e[2] < dist[e[1]]) return []; // negative cycle
  }
  return dist;
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Advanced Graphs'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_050'
      ..topicId = 'dsa'
      ..title = 'Kruskal\'s MST'
      ..description = 'Minimum Spanning Tree using greedy edge selection + DSU. O(E log E).'
      ..code = '''class DSU {
  List<int> p;
  DSU(int n) : p = List.generate(n, (i) => i);
  int find(int i) => p[i] == i ? i : p[i] = find(p[i]);
  bool union(int a, int b) {
    a = find(a); b = find(b);
    if (a == b) return false;
    p[a] = b; return true;
  }
}

int kruskal(int n, List<List<int>> edges) {
  edges.sort((a, b) => a[2].compareTo(b[2]));
  DSU dsu = DSU(n);
  int cost = 0;
  for (var e in edges) {
    if (dsu.union(e[0], e[1])) cost += e[2];
  }
  return cost;
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Advanced Graphs'
      ..isSaved = false
      ..lastViewedAt = null,

    // -------------------------------------------------------------------------
    // 18. Classical DP Problems (Continued)
    // -------------------------------------------------------------------------
    Snippet()
      ..snippetId = 'dsa_051'
      ..topicId = 'dsa'
      ..title = 'Longest Common Subsequence (LCS)'
      ..description = 'Find the length of the longest subsequence present in both strings. O(mn).'
      ..code = '''int lcs(String s1, String s2) {
  int m = s1.length, n = s2.length;
  var dp = List.generate(m + 1, (_) => List.filled(n + 1, 0));

  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      if (s1[i - 1] == s2[j - 1]) dp[i][j] = 1 + dp[i - 1][j - 1];
      else dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]);
    }
  }
  return dp[m][n];
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Dynamic Programming'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_052'
      ..topicId = 'dsa'
      ..title = 'Longest Increasing Subsequence'
      ..description = 'Find length of the longest strictly increasing subsequence. O(n log n).'
      ..code = '''int lis(List<int> nums) {
  if (nums.isEmpty) return 0;
  List<int> tails = [];
  for (var x in nums) {
    int i = 0, j = tails.length;
    while (i != j) {
      int m = (i + j) ~/ 2;
      if (tails[m] < x) i = m + 1;
      else j = m;
    }
    if (i == tails.length) tails.add(x);
    else tails[i] = x;
  }
  return tails.length;
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Dynamic Programming'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_053'
      ..topicId = 'dsa'
      ..title = 'Coin Change (Min Coins)'
      ..description = 'Find minimum coins needed to make change for a sum. O(n * amount).'
      ..code = '''int coinChange(List<int> coins, int amount) {
  List<int> dp = List.filled(amount + 1, amount + 1);
  dp[0] = 0;
  for (int i = 1; i <= amount; i++) {
    for (var c in coins) {
      if (c <= i) dp[i] = min(dp[i], 1 + dp[i - c]);
    }
  }
  return dp[amount] > amount ? -1 : dp[amount];
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Dynamic Programming'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_054'
      ..topicId = 'dsa'
      ..title = 'Word Break'
      ..description = 'Check if string can be segmented into words from space-separated dictionary.'
      ..code = '''bool wordBreak(String s, List<String> dict) {
  Set<String> words = dict.toSet();
  List<bool> dp = List.filled(s.length + 1, false);
  dp[0] = true;
  for (int i = 1; i <= s.length; i++) {
    for (int j = 0; j < i; j++) {
      if (dp[j] && words.contains(s.substring(j, i))) {
        dp[i] = true; break;
      }
    }
  }
  return dp[s.length];
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Dynamic Programming'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_055'
      ..topicId = 'dsa'
      ..title = 'Prim\'s MST (Dense)'
      ..description = 'Minimum Spanning Tree starting from a vertex, adding closest neighbor. O(V²).'
      ..code = '''int prim(int n, List<List<int>> matrix) {
  List<int> key = List.filled(n, 1 << 30), parent = List.filled(n, -1);
  List<bool> mst = List.filled(n, false);
  key[0] = 0;
  int totalCost = 0;

  for (int i = 0; i < n; i++) {
    int u = -1;
    for (int v = 0; v < n; v++) {
      if (!mst[v] && (u == -1 || key[v] < key[u])) u = v;
    }
    mst[u] = true;
    totalCost += key[u];
    for (int v = 0; v < n; v++) {
      if (matrix[u][v] != 0 && !mst[v] && matrix[u][v] < key[v]) {
        key[v] = matrix[u][v]; parent[v] = u;
      }
    }
  }
  return totalCost;
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Advanced Graphs'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_056'
      ..topicId = 'dsa'
      ..title = 'Floyd-Warshall'
      ..description = 'All-pairs shortest path algorithm using DP. O(V³).'
      ..code = '''void floydWarshall(int n, List<List<int>> dist) {
  for (int k = 0; k < n; k++) {
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (dist[i][k] + dist[k][j] < dist[i][j]) {
          dist[i][j] = dist[i][k] + dist[k][j];
        }
      }
    }
  }
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Advanced Graphs'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_057'
      ..topicId = 'dsa'
      ..title = 'Kosaraju\'s Algorithm'
      ..description = 'Find Strongly Connected Components (SCCs) in a directed graph.'
      ..code = '''void kosaraju(int n, List<List<int>> adj) {
  List<int> stack = [];
  List<bool> vis = List.filled(n, false);

  void dfs1(int u) {
    vis[u] = true;
    for (var v in adj[u]) if (!vis[v]) dfs1(v);
    stack.add(u);
  }

  for (int i = 0; i < n; i++) if (!vis[i]) dfs1(i);

  List<List<int>> revAdj = List.generate(n, (_) => []);
  for (int u = 0; u < n; u++) {
    for (var v in adj[u]) revAdj[v].add(u);
  }

  vis.fillRange(0, n, false);
  while (stack.isNotEmpty) {
    int u = stack.removeLast();
    if (!vis[u]) {
      // Start a new SCC
      List<int> scc = [];
      void dfs2(int node) {
        vis[node] = true; scc.add(node);
        for (var v in revAdj[node]) if (!vis[v]) dfs2(v);
      }
      dfs2(u); print("SCC: \$scc");
    }
  }
}'''
      ..language = 'dart'
      ..difficulty = 'very_hard'
      ..section = 'Advanced Graphs'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_058'
      ..topicId = 'dsa'
      ..title = 'Rabin-Karp String Search'
      ..description = 'String matching using rolling hash. O(n+m) average.'
      ..code = '''List<int> rabinKarp(String text, String pattern) {
  int n = text.length, m = pattern.length, q = 101, d = 256;
  int p = 0, t = 0, h = 1;
  List<int> res = [];

  for (int i = 0; i < m - 1; i++) h = (h * d) % q;
  for (int i = 0; i < m; i++) {
    p = (d * p + pattern.codeUnitAt(i)) % q;
    t = (d * t + text.codeUnitAt(i)) % q;
  }

  for (int i = 0; i <= n - m; i++) {
    if (p == t && text.substring(i, i + m) == pattern) res.add(i);
    if (i < n - m) {
      t = (d * (t - text.codeUnitAt(i) * h) + text.codeUnitAt(i + m)) % q;
      if (t < 0) t += q;
    }
  }
  return res;
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'String Algorithms'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_059'
      ..topicId = 'dsa'
      ..title = 'Z-Algorithm'
      ..description = 'Find all occurrences of a pattern in linear time using Z-array.'
      ..code = '''List<int> zAlgorithm(String text, String pattern) {
  String s = "\$pattern\\\$text";
  int n = s.length;
  List<int> z = List.filled(n, 0);
  int l = 0, r = 0;
  for (int i = 1; i < n; i++) {
    if (i <= r) z[i] = min(r - i + 1, z[i - l]);
    while (i + z[i] < n && s[z[i]] == s[i + z[i]]) z[i]++;
    if (i + z[i] - 1 > r) { l = i; r = i + z[i] - 1; }
  }
  return [for (int i = 0; i < n; i++) if (z[i] == pattern.length) i - pattern.length - 1];
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'String Algorithms'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_060'
      ..topicId = 'dsa'
      ..title = 'Minimum Window Substring'
      ..description = 'Find smallest substring containing all characters of another string.'
      ..code = '''String minWindow(String s, String t) {
  Map<String, int> target = {}, window = {};
  for (var c in t.split('')) target[c] = (target[c] ?? 0) + 1;

  int lo = 0, hi = 0, valid = 0, minLen = 1 << 30, start = 0;
  while (hi < s.length) {
    String c = s[hi++];
    if (target.containsKey(c)) {
      window[c] = (window[c] ?? 0) + 1;
      if (window[c] == target[c]) valid++;
    }
    while (valid == target.length) {
      if (hi - lo < minLen) { start = lo; minLen = hi - lo; }
      String d = s[lo++];
      if (target.containsKey(d)) {
        if (window[d] == target[d]) valid--;
        window[d] = window[d]! - 1;
      }
    }
  }
  return minLen == 1 << 30 ? "" : s.substring(start, start + minLen);
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Two Pointers'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_061'
      ..topicId = 'dsa'
      ..title = 'Gray Code'
      ..description = 'Generate sequences where adjacent values differ by only one bit.'
      ..code = '''List<int> grayCode(int n) {
  List<int> res = [0];
  for (int i = 0; i < n; i++) {
    int mask = 1 << i;
    for (int j = res.length - 1; j >= 0; j--) {
      res.add(res[j] | mask);
    }
  }
  return res;
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Bit Manipulation'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dsa_062'
      ..topicId = 'dsa'
      ..title = 'Convex Hull (Monotone Chain)'
      ..description = 'Find the smallest convex polygon containing all points in O(n log n).'
      ..code = '''List<List<int>> convexHull(List<List<int>> points) {
  points.sort((a,b) => a[0] == b[0] ? a[1].compareTo(b[1]) : a[0].compareTo(b[0]));
  int cross(List<int> o, List<int> a, List<int> b) =>
    (a[0]-o[0])*(b[1]-o[1]) - (a[1]-o[1])*(b[0]-o[0]);

  List<List<int>> lower = [];
  for (var p in points) {
    while (lower.length >= 2 && cross(lower[lower.length-2], lower.last, p) <= 0) lower.removeLast();
    lower.add(p);
  }
  List<List<int>> upper = [];
  for (var p in points.reversed) {
    while (upper.length >= 2 && cross(upper[upper.length-2], upper.last, p) <= 0) upper.removeLast();
    upper.add(p);
  }
  lower.removeLast(); upper.removeLast();
  return lower + upper;
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Math & Number Theory'
      ..isSaved = false
      ..lastViewedAt = null,
  ];
}
