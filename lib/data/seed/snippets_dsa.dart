import '../models/snippet.dart';

List<Snippet> getDsaSnippets() {
  return [
    Snippet()..snippetId='dsa_001'..topicId='dsa'..title='Binary Search'..description='O(log n) search on sorted arrays by halving the search space each step.'..code='''int binarySearch(List<int> arr, int target) {
  int lo = 0, hi = arr.length - 1;
  while (lo <= hi) {
    int mid = lo + (hi - lo) ~/ 2;
    if (arr[mid] == target) return mid;
    if (arr[mid] < target) lo = mid + 1;
    else hi = mid - 1;
  }
  return -1;
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_002'..topicId='dsa'..title='Bubble Sort'..description='Simple comparison sort. O(n^2) worst case. Repeatedly swaps adjacent out-of-order elements.'..code='''void bubbleSort(List<int> arr) {
  for (int i = 0; i < arr.length; i++) {
    bool swapped = false;
    for (int j = 0; j < arr.length - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int tmp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = tmp;
        swapped = true;
      }
    }
    if (!swapped) break;
  }
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_003'..topicId='dsa'..title='Stack (LIFO)'..description='Last-In-First-Out data structure. Push adds to top, pop removes from top. O(1) operations.'..code='''class Stack<T> {
  final List<T> _items = [];
  void push(T item) => _items.add(item);
  T pop() => _items.removeLast();
  T get peek => _items.last;
  bool get isEmpty => _items.isEmpty;
  int get size => _items.length;
}
// Usage: balanced parentheses check
bool isBalanced(String s) {
  final stack = Stack<String>();
  final pairs = {')': '(', ']': '[', '}': '{'};
  for (var c in s.split('')) {
    if ('([{'.contains(c)) stack.push(c);
    else if (pairs.containsKey(c)) {
      if (stack.isEmpty || stack.pop() != pairs[c]) return false;
    }
  }
  return stack.isEmpty;
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_004'..topicId='dsa'..title='Queue (FIFO)'..description='First-In-First-Out. Enqueue adds to back, dequeue removes from front.'..code='''class Queue<T> {
  final List<T> _items = [];
  void enqueue(T item) => _items.add(item);
  T dequeue() => _items.removeAt(0);
  T get front => _items.first;
  bool get isEmpty => _items.isEmpty;
  int get size => _items.length;
}
// BFS uses a queue
void bfs(Map<int, List<int>> graph, int start) {
  final visited = <int>{};
  final queue = Queue<int>()..enqueue(start);
  visited.add(start);
  while (!queue.isEmpty) {
    int node = queue.dequeue();
    print(node);
    for (var neighbor in graph[node] ?? []) {
      if (!visited.contains(neighbor)) {
        visited.add(neighbor);
        queue.enqueue(neighbor);
      }
    }
  }
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_005'..topicId='dsa'..title='Linked List'..description='Linear data structure where elements point to next. O(1) insert/delete at head, O(n) search.'..code='''class Node<T> {
  T data;
  Node<T>? next;
  Node(this.data, [this.next]);
}
class LinkedList<T> {
  Node<T>? head;
  void addFirst(T data) => head = Node(data, head);
  void addLast(T data) {
    if (head == null) { head = Node(data); return; }
    var cur = head!;
    while (cur.next != null) cur = cur.next!;
    cur.next = Node(data);
  }
  T? removeFirst() {
    if (head == null) return null;
    T data = head!.data;
    head = head!.next;
    return data;
  }
  void printAll() {
    var cur = head;
    while (cur != null) { print(cur.data); cur = cur.next; }
  }
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_006'..topicId='dsa'..title='Hash Map Basics'..description='Key-value store with O(1) average lookup using hash function and collision handling.'..code='''class SimpleHashMap {
  static const _size = 16;
  final List<List<MapEntry<String, int>>> _buckets =
      List.generate(_size, (_) => []);
  int _hash(String key) => key.hashCode.abs() % _size;
  void put(String key, int value) {
    final bucket = _buckets[_hash(key)];
    for (int i = 0; i < bucket.length; i++) {
      if (bucket[i].key == key) {
        bucket[i] = MapEntry(key, value);
        return;
      }
    }
    bucket.add(MapEntry(key, value));
  }
  int? get(String key) {
    for (var entry in _buckets[_hash(key)]) {
      if (entry.key == key) return entry.value;
    }
    return null;
  }
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_007'..topicId='dsa'..title='Selection Sort'..description='Finds minimum element and places it at beginning. O(n^2). Simple but inefficient for large data.'..code='''void selectionSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int minIdx = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[minIdx]) minIdx = j;
    }
    if (minIdx != i) {
      int tmp = arr[i];
      arr[i] = arr[minIdx];
      arr[minIdx] = tmp;
    }
  }
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_008'..topicId='dsa'..title='Insertion Sort'..description='Builds sorted array one element at a time. O(n^2) worst, O(n) best. Good for small/nearly sorted data.'..code='''void insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_009'..topicId='dsa'..title='Two Pointer Technique'..description='Use two pointers moving toward each other to solve problems in O(n) on sorted arrays.'..code='''List<int>? twoSum(List<int> sorted, int target) {
  int lo = 0, hi = sorted.length - 1;
  while (lo < hi) {
    int sum = sorted[lo] + sorted[hi];
    if (sum == target) return [lo, hi];
    if (sum < target) lo++;
    else hi--;
  }
  return null;
}
// Reverse a string in-place
List<String> reverseChars(List<String> chars) {
  int lo = 0, hi = chars.length - 1;
  while (lo < hi) {
    String tmp = chars[lo];
    chars[lo] = chars[hi];
    chars[hi] = tmp;
    lo++; hi--;
  }
  return chars;
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_010'..topicId='dsa'..title='Recursion Basics'..description='A function calling itself with a base case. Essential for divide-and-conquer algorithms.'..code='''int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}
int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}
int power(int base, int exp) {
  if (exp == 0) return 1;
  if (exp % 2 == 0) {
    int half = power(base, exp ~/ 2);
    return half * half;
  }
  return base * power(base, exp - 1);
}
// Tower of Hanoi
void hanoi(int n, String from, String to, String aux) {
  if (n == 0) return;
  hanoi(n - 1, from, aux, to);
  print("Move disk \$n: \$from -> \$to");
  hanoi(n - 1, aux, to, from);
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_011'..topicId='dsa'..title='Merge Sort'..description='Divide-and-conquer sort. O(n log n) guaranteed. Stable sort that divides then merges.'..code='''List<int> mergeSort(List<int> arr) {
  if (arr.length <= 1) return arr;
  int mid = arr.length ~/ 2;
  var left = mergeSort(arr.sublist(0, mid));
  var right = mergeSort(arr.sublist(mid));
  return _merge(left, right);
}
List<int> _merge(List<int> a, List<int> b) {
  List<int> result = [];
  int i = 0, j = 0;
  while (i < a.length && j < b.length) {
    if (a[i] <= b[j]) result.add(a[i++]);
    else result.add(b[j++]);
  }
  result.addAll(a.sublist(i));
  result.addAll(b.sublist(j));
  return result;
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_012'..topicId='dsa'..title='Quick Sort'..description='Divide-and-conquer using pivot. O(n log n) average, O(n^2) worst. In-place and cache-friendly.'..code='''void quickSort(List<int> arr, int lo, int hi) {
  if (lo < hi) {
    int pi = _partition(arr, lo, hi);
    quickSort(arr, lo, pi - 1);
    quickSort(arr, pi + 1, hi);
  }
}
int _partition(List<int> arr, int lo, int hi) {
  int pivot = arr[hi];
  int i = lo - 1;
  for (int j = lo; j < hi; j++) {
    if (arr[j] < pivot) {
      i++;
      int tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
    }
  }
  int tmp = arr[i + 1]; arr[i + 1] = arr[hi]; arr[hi] = tmp;
  return i + 1;
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_013'..topicId='dsa'..title='Binary Search Tree'..description='BST maintains sorted order. Left < root < right. O(log n) average search, insert, delete.'..code='''class BSTNode {
  int value;
  BSTNode? left, right;
  BSTNode(this.value);
}
class BST {
  BSTNode? root;
  void insert(int val) => root = _insert(root, val);
  BSTNode _insert(BSTNode? node, int val) {
    if (node == null) return BSTNode(val);
    if (val < node.value) node.left = _insert(node.left, val);
    else if (val > node.value) node.right = _insert(node.right, val);
    return node;
  }
  bool search(int val) => _search(root, val);
  bool _search(BSTNode? node, int val) {
    if (node == null) return false;
    if (val == node.value) return true;
    return val < node.value ? _search(node.left, val) : _search(node.right, val);
  }
  void inorder(BSTNode? node) {
    if (node == null) return;
    inorder(node.left);
    print(node.value);
    inorder(node.right);
  }
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_014'..topicId='dsa'..title='BFS - Breadth First Search'..description='Level-order graph traversal using queue. Finds shortest path in unweighted graphs. O(V+E).'..code='''List<int> bfs(Map<int, List<int>> graph, int start) {
  final visited = <int>{start};
  final queue = [start];
  final order = <int>[];
  while (queue.isNotEmpty) {
    int node = queue.removeAt(0);
    order.add(node);
    for (var n in graph[node] ?? []) {
      if (!visited.contains(n)) {
        visited.add(n);
        queue.add(n);
      }
    }
  }
  return order;
}
// Shortest path
int? shortestPath(Map<int, List<int>> graph, int start, int end) {
  final dist = <int, int>{start: 0};
  final queue = [start];
  while (queue.isNotEmpty) {
    int node = queue.removeAt(0);
    if (node == end) return dist[end];
    for (var n in graph[node] ?? []) {
      if (!dist.containsKey(n)) {
        dist[n] = dist[node]! + 1;
        queue.add(n);
      }
    }
  }
  return null;
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_015'..topicId='dsa'..title='DFS - Depth First Search'..description='Explores as deep as possible before backtracking. Uses stack/recursion. O(V+E).'..code='''// Recursive DFS
void dfsRecursive(Map<int, List<int>> graph, int node, Set<int> visited) {
  visited.add(node);
  print(node);
  for (var n in graph[node] ?? []) {
    if (!visited.contains(n)) dfsRecursive(graph, n, visited);
  }
}
// Iterative DFS
List<int> dfsIterative(Map<int, List<int>> graph, int start) {
  final visited = <int>{};
  final stack = [start];
  final order = <int>[];
  while (stack.isNotEmpty) {
    int node = stack.removeLast();
    if (visited.contains(node)) continue;
    visited.add(node);
    order.add(node);
    for (var n in (graph[node] ?? []).reversed) {
      if (!visited.contains(n)) stack.add(n);
    }
  }
  return order;
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_016'..topicId='dsa'..title='Min Heap / Priority Queue'..description='Complete binary tree where parent <= children. O(log n) insert/extract-min. Used in Dijkstra.'..code='''class MinHeap {
  final List<int> _data = [];
  int get size => _data.length;
  bool get isEmpty => _data.isEmpty;
  void insert(int val) {
    _data.add(val);
    _bubbleUp(_data.length - 1);
  }
  int extractMin() {
    int min = _data[0];
    _data[0] = _data.last;
    _data.removeLast();
    if (_data.isNotEmpty) _bubbleDown(0);
    return min;
  }
  void _bubbleUp(int i) {
    while (i > 0) {
      int parent = (i - 1) ~/ 2;
      if (_data[parent] <= _data[i]) break;
      _swap(i, parent);
      i = parent;
    }
  }
  void _bubbleDown(int i) {
    while (true) {
      int smallest = i, l = 2*i+1, r = 2*i+2;
      if (l < size && _data[l] < _data[smallest]) smallest = l;
      if (r < size && _data[r] < _data[smallest]) smallest = r;
      if (smallest == i) break;
      _swap(i, smallest);
      i = smallest;
    }
  }
  void _swap(int a, int b) { int t = _data[a]; _data[a] = _data[b]; _data[b] = t; }
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_017'..topicId='dsa'..title='Dynamic Programming - Fibonacci'..description='Memoization (top-down) and tabulation (bottom-up) to avoid recomputation. Optimal substructure.'..code='''// Top-down with memoization
int fibMemo(int n, Map<int, int> memo) {
  if (n <= 1) return n;
  if (memo.containsKey(n)) return memo[n]!;
  memo[n] = fibMemo(n - 1, memo) + fibMemo(n - 2, memo);
  return memo[n]!;
}
// Bottom-up tabulation
int fibTab(int n) {
  if (n <= 1) return n;
  List<int> dp = List.filled(n + 1, 0);
  dp[1] = 1;
  for (int i = 2; i <= n; i++) dp[i] = dp[i-1] + dp[i-2];
  return dp[n];
}
// Space-optimized
int fibOpt(int n) {
  if (n <= 1) return n;
  int a = 0, b = 1;
  for (int i = 2; i <= n; i++) { int c = a + b; a = b; b = c; }
  return b;
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_018'..topicId='dsa'..title='Sliding Window'..description='Maintain a window over array/string that slides right. O(n) for subarray/substring problems.'..code='''// Max sum of subarray of size k
int maxSumSubarray(List<int> arr, int k) {
  int windowSum = 0, maxSum = 0;
  for (int i = 0; i < k; i++) windowSum += arr[i];
  maxSum = windowSum;
  for (int i = k; i < arr.length; i++) {
    windowSum += arr[i] - arr[i - k];
    if (windowSum > maxSum) maxSum = windowSum;
  }
  return maxSum;
}
// Longest substring without repeating chars
int longestUnique(String s) {
  Map<String, int> last = {};
  int maxLen = 0, start = 0;
  for (int i = 0; i < s.length; i++) {
    if (last.containsKey(s[i]) && last[s[i]]! >= start) {
      start = last[s[i]]! + 1;
    }
    last[s[i]] = i;
    int len = i - start + 1;
    if (len > maxLen) maxLen = len;
  }
  return maxLen;
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_019'..topicId='dsa'..title='Hash Set for Deduplication'..description='Set provides O(1) lookup. Use for uniqueness checks, intersection, union, and difference.'..code='''// Find duplicates
List<int> findDuplicates(List<int> nums) {
  Set<int> seen = {};
  List<int> dupes = [];
  for (var n in nums) {
    if (!seen.add(n)) dupes.add(n);
  }
  return dupes;
}
// First non-repeating character
int firstUnique(String s) {
  Map<String, int> freq = {};
  for (var c in s.split('')) freq[c] = (freq[c] ?? 0) + 1;
  for (int i = 0; i < s.length; i++) {
    if (freq[s[i]] == 1) return i;
  }
  return -1;
}
// Intersection of two arrays
List<int> intersection(List<int> a, List<int> b) {
  Set<int> setA = a.toSet();
  return b.where((x) => setA.contains(x)).toSet().toList();
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_020'..topicId='dsa'..title='Counting Sort'..description='Non-comparison sort. O(n+k) where k is range. Counts occurrences then reconstructs sorted array.'..code='''List<int> countingSort(List<int> arr) {
  if (arr.isEmpty) return arr;
  int maxVal = arr.reduce(0, (a, b) => a > b ? a : b);
  List<int> count = List.filled(maxVal + 1, 0);
  for (var n in arr) count[n]++;
  List<int> result = [];
  for (int i = 0; i <= maxVal; i++) {
    for (int j = 0; j < count[i]; j++) result.add(i);
  }
  return result;
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_021'..topicId='dsa'..title='Graph - Adjacency List'..description='Represent graphs using adjacency lists. Supports directed/undirected, weighted/unweighted edges.'..code='''class Graph {
  final Map<int, List<(int, int)>> _adj = {};
  final bool directed;
  Graph({this.directed = false});
  void addEdge(int u, int v, [int w = 1]) {
    _adj.putIfAbsent(u, () => []);
    _adj[u]!.add((v, w));
    if (!directed) {
      _adj.putIfAbsent(v, () => []);
      _adj[v]!.add((u, w));
    }
  }
  List<(int, int)> neighbors(int u) => _adj[u] ?? [];
  Set<int> get vertices => _adj.keys.toSet();
  bool hasEdge(int u, int v) =>
    (_adj[u] ?? []).any((e) => e.\$1 == v);
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_022'..topicId='dsa'..title='Dijkstra Shortest Path'..description='Finds shortest path in weighted graph with non-negative edges. O((V+E) log V) with min-heap.'..code='''Map<int, int> dijkstra(Map<int, List<(int,int)>> graph, int src) {
  Map<int, int> dist = {src: 0};
  // Simple priority queue simulation
  List<(int,int)> pq = [(0, src)]; // (dist, node)
  Set<int> visited = {};
  while (pq.isNotEmpty) {
    pq.sort((a, b) => a.\$1.compareTo(b.\$1));
    var (d, u) = pq.removeAt(0);
    if (visited.contains(u)) continue;
    visited.add(u);
    for (var (v, w) in graph[u] ?? []) {
      int newDist = d + w;
      if (!dist.containsKey(v) || newDist < dist[v]!) {
        dist[v] = newDist;
        pq.add((newDist, v));
      }
    }
  }
  return dist;
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_023'..topicId='dsa'..title='DP - Knapsack 0/1'..description='Classic DP: maximize value with weight capacity constraint. O(n*W) time and space.'..code='''int knapsack(List<int> weights, List<int> values, int capacity) {
  int n = weights.length;
  List<List<int>> dp = List.generate(n + 1, (_) => List.filled(capacity + 1, 0));
  for (int i = 1; i <= n; i++) {
    for (int w = 0; w <= capacity; w++) {
      dp[i][w] = dp[i-1][w]; // skip item
      if (weights[i-1] <= w) {
        int include = dp[i-1][w - weights[i-1]] + values[i-1];
        if (include > dp[i][w]) dp[i][w] = include;
      }
    }
  }
  return dp[n][capacity];
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_024'..topicId='dsa'..title='DP - Longest Common Subsequence'..description='Find length of longest subsequence common to two strings. O(m*n) DP solution.'..code='''int lcs(String a, String b) {
  int m = a.length, n = b.length;
  List<List<int>> dp = List.generate(m+1, (_) => List.filled(n+1, 0));
  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      if (a[i-1] == b[j-1]) dp[i][j] = dp[i-1][j-1] + 1;
      else dp[i][j] = dp[i-1][j] > dp[i][j-1] ? dp[i-1][j] : dp[i][j-1];
    }
  }
  return dp[m][n];
}
// Reconstruct the LCS string
String lcsString(String a, String b) {
  int m = a.length, n = b.length;
  var dp = List.generate(m+1, (_) => List.filled(n+1, 0));
  for (int i = 1; i <= m; i++)
    for (int j = 1; j <= n; j++)
      dp[i][j] = a[i-1] == b[j-1] ? dp[i-1][j-1]+1 : (dp[i-1][j] > dp[i][j-1] ? dp[i-1][j] : dp[i][j-1]);
  String result = '';
  int i = m, j = n;
  while (i > 0 && j > 0) {
    if (a[i-1] == b[j-1]) { result = a[i-1] + result; i--; j--; }
    else if (dp[i-1][j] > dp[i][j-1]) i--;
    else j--;
  }
  return result;
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_025'..topicId='dsa'..title='Trie (Prefix Tree)'..description='Tree for string operations. O(m) insert/search where m is word length. Efficient prefix queries.'..code='''class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEnd = false;
}
class Trie {
  final root = TrieNode();
  void insert(String word) {
    var node = root;
    for (var c in word.split('')) {
      node.children.putIfAbsent(c, () => TrieNode());
      node = node.children[c]!;
    }
    node.isEnd = true;
  }
  bool search(String word) {
    var node = _findNode(word);
    return node != null && node.isEnd;
  }
  bool startsWith(String prefix) => _findNode(prefix) != null;
  TrieNode? _findNode(String s) {
    var node = root;
    for (var c in s.split('')) {
      if (!node.children.containsKey(c)) return null;
      node = node.children[c]!;
    }
    return node;
  }
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_026'..topicId='dsa'..title='Topological Sort'..description='Linear ordering of DAG vertices. Every edge u->v, u comes before v. Uses DFS or Kahn algorithm.'..code='''List<int> topologicalSort(Map<int, List<int>> graph) {
  Map<int, int> inDegree = {};
  for (var u in graph.keys) {
    inDegree.putIfAbsent(u, () => 0);
    for (var v in graph[u]!) {
      inDegree[v] = (inDegree[v] ?? 0) + 1;
    }
  }
  List<int> queue = inDegree.entries
      .where((e) => e.value == 0).map((e) => e.key).toList();
  List<int> order = [];
  while (queue.isNotEmpty) {
    int u = queue.removeAt(0);
    order.add(u);
    for (var v in graph[u] ?? []) {
      inDegree[v] = inDegree[v]! - 1;
      if (inDegree[v] == 0) queue.add(v);
    }
  }
  return order;
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_027'..topicId='dsa'..title='Union-Find (Disjoint Set)'..description='Tracks connected components. Near O(1) union and find with path compression and union by rank.'..code='''class UnionFind {
  List<int> parent, rank;
  UnionFind(int n) : parent = List.generate(n, (i) => i), rank = List.filled(n, 0);
  int find(int x) {
    if (parent[x] != x) parent[x] = find(parent[x]); // path compression
    return parent[x];
  }
  bool union(int x, int y) {
    int px = find(x), py = find(y);
    if (px == py) return false;
    if (rank[px] < rank[py]) { parent[px] = py; }
    else if (rank[px] > rank[py]) { parent[py] = px; }
    else { parent[py] = px; rank[px]++; }
    return true;
  }
  bool connected(int x, int y) => find(x) == find(y);
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_028'..topicId='dsa'..title='Backtracking - N-Queens'..description='Place N queens on NxN board with no attacks. Explores all possibilities, prunes invalid branches.'..code='''List<List<String>> solveNQueens(int n) {
  List<List<String>> results = [];
  List<int> queens = List.filled(n, -1);
  void solve(int row) {
    if (row == n) {
      results.add(queens.map((c) => '.' * c + 'Q' + '.' * (n-c-1)).toList());
      return;
    }
    for (int col = 0; col < n; col++) {
      if (_isValid(queens, row, col)) {
        queens[row] = col;
        solve(row + 1);
        queens[row] = -1;
      }
    }
  }
  solve(0);
  return results;
}
bool _isValid(List<int> queens, int row, int col) {
  for (int i = 0; i < row; i++) {
    if (queens[i] == col) return false;
    if ((queens[i] - col).abs() == (i - row).abs()) return false;
  }
  return true;
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_029'..topicId='dsa'..title='Segment Tree'..description='Range query data structure. O(log n) query and update. Supports sum, min, max queries.'..code='''class SegTree {
  List<int> tree;
  int n;
  SegTree(List<int> arr) : n = arr.length, tree = List.filled(arr.length * 4, 0) {
    _build(arr, 1, 0, n - 1);
  }
  void _build(List<int> arr, int node, int lo, int hi) {
    if (lo == hi) { tree[node] = arr[lo]; return; }
    int mid = (lo + hi) ~/ 2;
    _build(arr, 2*node, lo, mid);
    _build(arr, 2*node+1, mid+1, hi);
    tree[node] = tree[2*node] + tree[2*node+1];
  }
  int query(int l, int r) => _query(1, 0, n-1, l, r);
  int _query(int node, int lo, int hi, int l, int r) {
    if (r < lo || hi < l) return 0;
    if (l <= lo && hi <= r) return tree[node];
    int mid = (lo + hi) ~/ 2;
    return _query(2*node, lo, mid, l, r) + _query(2*node+1, mid+1, hi, l, r);
  }
  void update(int idx, int val) => _update(1, 0, n-1, idx, val);
  void _update(int node, int lo, int hi, int idx, int val) {
    if (lo == hi) { tree[node] = val; return; }
    int mid = (lo + hi) ~/ 2;
    if (idx <= mid) _update(2*node, lo, mid, idx, val);
    else _update(2*node+1, mid+1, hi, idx, val);
    tree[node] = tree[2*node] + tree[2*node+1];
  }
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_030'..topicId='dsa'..title='DP - Coin Change'..description='Minimum coins to make amount. Complete DP with overlapping subproblems and optimal substructure.'..code='''int coinChange(List<int> coins, int amount) {
  List<int> dp = List.filled(amount + 1, amount + 1);
  dp[0] = 0;
  for (int i = 1; i <= amount; i++) {
    for (var coin in coins) {
      if (coin <= i && dp[i - coin] + 1 < dp[i]) {
        dp[i] = dp[i - coin] + 1;
      }
    }
  }
  return dp[amount] > amount ? -1 : dp[amount];
}
// Count ways to make change
int countWays(List<int> coins, int amount) {
  List<int> dp = List.filled(amount + 1, 0);
  dp[0] = 1;
  for (var coin in coins) {
    for (int i = coin; i <= amount; i++) {
      dp[i] += dp[i - coin];
    }
  }
  return dp[amount];
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_031'..topicId='dsa'..title='AVL Tree'..description='Self-balancing BST. Height difference of subtrees <= 1. O(log n) guaranteed operations.'..code='''class AVLNode {
  int value, height;
  AVLNode? left, right;
  AVLNode(this.value) : height = 1;
}
class AVLTree {
  AVLNode? root;
  int _h(AVLNode? n) => n?.height ?? 0;
  int _bal(AVLNode n) => _h(n.left) - _h(n.right);
  void _updateH(AVLNode n) {
    n.height = 1 + (_h(n.left) > _h(n.right) ? _h(n.left) : _h(n.right));
  }
  AVLNode _rotR(AVLNode y) {
    AVLNode x = y.left!; y.left = x.right; x.right = y;
    _updateH(y); _updateH(x); return x;
  }
  AVLNode _rotL(AVLNode x) {
    AVLNode y = x.right!; x.right = y.left; y.left = x;
    _updateH(x); _updateH(y); return y;
  }
  void insert(int val) => root = _insert(root, val);
  AVLNode _insert(AVLNode? node, int val) {
    if (node == null) return AVLNode(val);
    if (val < node.value) node.left = _insert(node.left, val);
    else node.right = _insert(node.right, val);
    _updateH(node);
    int bal = _bal(node);
    if (bal > 1 && val < node.left!.value) return _rotR(node);
    if (bal < -1 && val > node.right!.value) return _rotL(node);
    if (bal > 1 && val > node.left!.value) { node.left = _rotL(node.left!); return _rotR(node); }
    if (bal < -1 && val < node.right!.value) { node.right = _rotR(node.right!); return _rotL(node); }
    return node;
  }
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_032'..topicId='dsa'..title='Graph - Bellman-Ford'..description='Shortest path with negative weights. Detects negative cycles. O(V*E) time complexity.'..code='''Map<int, int> bellmanFord(int vertices, List<(int,int,int)> edges, int src) {
  Map<int, int> dist = {};
  for (int i = 0; i < vertices; i++) dist[i] = 999999999;
  dist[src] = 0;
  // Relax V-1 times
  for (int i = 0; i < vertices - 1; i++) {
    for (var (u, v, w) in edges) {
      if (dist[u]! + w < dist[v]!) {
        dist[v] = dist[u]! + w;
      }
    }
  }
  // Check negative cycle
  for (var (u, v, w) in edges) {
    if (dist[u]! + w < dist[v]!) {
      throw Exception("Negative cycle detected");
    }
  }
  return dist;
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_033'..topicId='dsa'..title='LRU Cache'..description='Least Recently Used cache. O(1) get and put using HashMap + doubly linked list.'..code='''class LRUCache {
  final int capacity;
  final Map<int, int> _map = {};
  final List<int> _order = [];
  LRUCache(this.capacity);
  int? get(int key) {
    if (!_map.containsKey(key)) return null;
    _order.remove(key);
    _order.add(key);
    return _map[key];
  }
  void put(int key, int value) {
    if (_map.containsKey(key)) {
      _order.remove(key);
    } else if (_map.length >= capacity) {
      int lru = _order.removeAt(0);
      _map.remove(lru);
    }
    _map[key] = value;
    _order.add(key);
  }
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_034'..topicId='dsa'..title='Kruskal MST'..description='Minimum Spanning Tree using greedy edge selection with Union-Find. O(E log E).'..code='''class UF {
  List<int> p, r;
  UF(int n) : p = List.generate(n, (i) => i), r = List.filled(n, 0);
  int find(int x) { if (p[x] != x) p[x] = find(p[x]); return p[x]; }
  bool union(int a, int b) {
    int pa = find(a), pb = find(b);
    if (pa == pb) return false;
    if (r[pa] < r[pb]) p[pa] = pb;
    else if (r[pa] > r[pb]) p[pb] = pa;
    else { p[pb] = pa; r[pa]++; }
    return true;
  }
}
List<(int,int,int)> kruskal(int n, List<(int,int,int)> edges) {
  edges.sort((a, b) => a.\$3.compareTo(b.\$3));
  UF uf = UF(n);
  List<(int,int,int)> mst = [];
  for (var (u, v, w) in edges) {
    if (uf.union(u, v)) mst.add((u, v, w));
    if (mst.length == n - 1) break;
  }
  return mst;
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_035'..topicId='dsa'..title='DP - Edit Distance'..description='Minimum operations (insert/delete/replace) to transform one string to another. O(m*n).'..code='''int editDistance(String a, String b) {
  int m = a.length, n = b.length;
  var dp = List.generate(m+1, (_) => List.filled(n+1, 0));
  for (int i = 0; i <= m; i++) dp[i][0] = i;
  for (int j = 0; j <= n; j++) dp[0][j] = j;
  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      if (a[i-1] == b[j-1]) {
        dp[i][j] = dp[i-1][j-1];
      } else {
        dp[i][j] = 1 + [dp[i-1][j], dp[i][j-1], dp[i-1][j-1]].reduce((a,b) => a < b ? a : b);
      }
    }
  }
  return dp[m][n];
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_036'..topicId='dsa'..title='Binary Indexed Tree (Fenwick)'..description='Efficient prefix sum queries and point updates in O(log n). Compact alternative to segment tree.'..code='''class BIT {
  List<int> tree;
  int n;
  BIT(int n) : n = n, tree = List.filled(n + 1, 0);
  void update(int i, int delta) {
    i++; // 1-indexed
    while (i <= n) { tree[i] += delta; i += i & (-i); }
  }
  int prefixSum(int i) {
    i++; // 1-indexed
    int sum = 0;
    while (i > 0) { sum += tree[i]; i -= i & (-i); }
    return sum;
  }
  int rangeSum(int l, int r) {
    return prefixSum(r) - (l > 0 ? prefixSum(l - 1) : 0);
  }
}
// Usage: build from array
BIT fromArray(List<int> arr) {
  BIT bit = BIT(arr.length);
  for (int i = 0; i < arr.length; i++) bit.update(i, arr[i]);
  return bit;
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_037'..topicId='dsa'..title='String Matching - KMP'..description='Knuth-Morris-Pratt pattern matching. O(n+m) using failure function to skip comparisons.'..code='''List<int> kmpSearch(String text, String pattern) {
  List<int> lps = _buildLPS(pattern);
  List<int> matches = [];
  int i = 0, j = 0;
  while (i < text.length) {
    if (text[i] == pattern[j]) { i++; j++; }
    if (j == pattern.length) {
      matches.add(i - j);
      j = lps[j - 1];
    } else if (i < text.length && text[i] != pattern[j]) {
      if (j != 0) j = lps[j - 1];
      else i++;
    }
  }
  return matches;
}
List<int> _buildLPS(String pattern) {
  List<int> lps = List.filled(pattern.length, 0);
  int len = 0, i = 1;
  while (i < pattern.length) {
    if (pattern[i] == pattern[len]) { lps[i] = ++len; i++; }
    else { if (len != 0) len = lps[len - 1]; else { lps[i] = 0; i++; } }
  }
  return lps;
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_038'..topicId='dsa'..title='Graph Coloring'..description='Assign colors to graph vertices so no adjacent vertices share a color. NP-hard in general, greedy approx.'..code='''Map<int, int> greedyColor(Map<int, List<int>> graph) {
  Map<int, int> colors = {};
  for (var node in graph.keys) {
    Set<int> neighborColors = {};
    for (var n in graph[node] ?? []) {
      if (colors.containsKey(n)) neighborColors.add(colors[n]!);
    }
    int color = 0;
    while (neighborColors.contains(color)) color++;
    colors[node] = color;
  }
  return colors;
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_039'..topicId='dsa'..title='DP - Longest Increasing Subsequence'..description='Find length of LIS. O(n log n) with patience sorting or O(n^2) with basic DP.'..code='''// O(n^2) DP
int lisDP(List<int> arr) {
  List<int> dp = List.filled(arr.length, 1);
  for (int i = 1; i < arr.length; i++) {
    for (int j = 0; j < i; j++) {
      if (arr[j] < arr[i] && dp[j] + 1 > dp[i]) dp[i] = dp[j] + 1;
    }
  }
  return dp.reduce((a, b) => a > b ? a : b);
}
// O(n log n) with binary search
int lisBinarySearch(List<int> arr) {
  List<int> tails = [];
  for (var x in arr) {
    int lo = 0, hi = tails.length;
    while (lo < hi) {
      int mid = (lo + hi) ~/ 2;
      if (tails[mid] < x) lo = mid + 1; else hi = mid;
    }
    if (lo == tails.length) tails.add(x);
    else tails[lo] = x;
  }
  return tails.length;
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dsa_040'..topicId='dsa'..title='A* Pathfinding'..description='Informed search using heuristic f(n) = g(n) + h(n). Optimal when heuristic is admissible.'..code='''class AStarNode implements Comparable<AStarNode> {
  final int x, y;
  final int g, h;
  int get f => g + h;
  final AStarNode? parent;
  AStarNode(this.x, this.y, this.g, this.h, [this.parent]);
  @override int compareTo(AStarNode o) => f.compareTo(o.f);
}
List<(int,int)>? astar(List<List<int>> grid, (int,int) start, (int,int) end) {
  int rows = grid.length, cols = grid[0].length;
  int heuristic(int x, int y) => (x - end.\$1).abs() + (y - end.\$2).abs();
  List<AStarNode> open = [AStarNode(start.\$1, start.\$2, 0, heuristic(start.\$1, start.\$2))];
  Set<String> closed = {};
  while (open.isNotEmpty) {
    open.sort();
    AStarNode cur = open.removeAt(0);
    if (cur.x == end.\$1 && cur.y == end.\$2) {
      List<(int,int)> path = [];
      AStarNode? n = cur;
      while (n != null) { path.add((n.x, n.y)); n = n.parent; }
      return path.reversed.toList();
    }
    closed.add("\${cur.x},\${cur.y}");
    for (var (dx, dy) in [(0,1),(0,-1),(1,0),(-1,0)]) {
      int nx = cur.x+dx, ny = cur.y+dy;
      if (nx<0||ny<0||nx>=rows||ny>=cols) continue;
      if (grid[nx][ny]==1||closed.contains("\$nx,\$ny")) continue;
      open.add(AStarNode(nx,ny,cur.g+1,heuristic(nx,ny),cur));
    }
  }
  return null;
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
  ];
}
