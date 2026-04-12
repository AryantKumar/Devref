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
  ];
}
