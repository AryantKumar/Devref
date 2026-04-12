import '../models/snippet.dart';

List<Snippet> getDartSnippets() {
  return [
    // ── Very Easy (10) ──
    Snippet()..snippetId='dart_001'..topicId='dart'..title='Hello World'..description='Dart programs start from the main() function. print() outputs text to the console.'..code='''void main() {
  print('Hello, World!');
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_002'..topicId='dart'..title='Variables and Types'..description='Dart supports type inference with var, explicit types, final (runtime constant), and const (compile-time constant).'..code='''void main() {
  var name = 'Dart';          // type inferred as String
  int age = 10;                // explicit type
  final version = 3.0;        // runtime constant
  const pi = 3.14159;         // compile-time constant
  double? nullable;            // nullable, default null

  print('Name: \$name, Age: \$age');
  print('Version: \$version, Pi: \$pi');
  print('Nullable: \$nullable');
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_003'..topicId='dart'..title='String Interpolation'..description='Dart uses \$ for simple variables and \${} for expressions inside strings.'..code='''void main() {
  var name = 'Dart';
  var version = 3;

  print('Hello \$name!');
  print('Next version: \${version + 1}');
  print('Uppercase: \${name.toUpperCase()}');

  // Multi-line string
  var multiLine = \'\'\'
    This is a
    multi-line string
    in \$name
  \'\'\';
  print(multiLine);

  // Raw string (no interpolation)
  var raw = r'No \$interpolation here';
  print(raw);
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_004'..topicId='dart'..title='Lists'..description='Dart Lists are ordered collections. They support generics, spread operator, and collection if/for.'..code='''void main() {
  var numbers = [1, 2, 3, 4, 5];
  var fruits = <String>['apple', 'banana'];

  fruits.add('cherry');
  fruits.insert(0, 'avocado');
  print(fruits);

  // Spread
  var combined = [...numbers, ...fruits.length as dynamic > 0 ? [6, 7] : []];

  // Collection if
  var isLoggedIn = true;
  var nav = ['Home', 'Browse', if (isLoggedIn) 'Profile'];

  // Collection for
  var doubled = [for (var n in numbers) n * 2];

  print('Nav: \$nav');
  print('Doubled: \$doubled');
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_005'..topicId='dart'..title='Maps and Sets'..description='Maps store key-value pairs, Sets store unique values. Both support literals and typed generics.'..code='''void main() {
  // Map
  var person = {
    'name': 'Alice',
    'age': 30,
    'city': 'Berlin',
  };
  person['email'] = 'alice@example.com';

  person.forEach((key, value) {
    print('\$key: \$value');
  });

  // Set
  var uniqueNumbers = {1, 2, 3, 2, 1};
  print('Set: \$uniqueNumbers'); // {1, 2, 3}

  uniqueNumbers.add(4);
  print('Contains 3: \${uniqueNumbers.contains(3)}');

  // Set operations
  var a = {1, 2, 3};
  var b = {2, 3, 4};
  print('Union: \${a.union(b)}');
  print('Intersection: \${a.intersection(b)}');
  print('Difference: \${a.difference(b)}');
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_006'..topicId='dart'..title='Functions'..description='Dart functions support positional, named, optional, and default parameters with arrow syntax.'..code='''// Arrow function
int add(int a, int b) => a + b;

// Named parameters with defaults
String greet({required String name, String greeting = 'Hello'}) {
  return '\$greeting, \$name!';
}

// Optional positional parameter
String repeat(String text, [int times = 1]) {
  return text * times;
}

// Function as first-class
void applyToAll(List<int> list, int Function(int) fn) {
  for (var i = 0; i < list.length; i++) {
    list[i] = fn(list[i]);
  }
}

void main() {
  print(add(2, 3));
  print(greet(name: 'Dart'));
  print(greet(name: 'World', greeting: 'Hi'));
  print(repeat('Ha', 3));

  var nums = [1, 2, 3, 4];
  applyToAll(nums, (n) => n * n);
  print(nums);
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_007'..topicId='dart'..title='Classes'..description='Dart classes support constructors, named constructors, initializer lists, and getter/setters.'..code='''class Point {
  final double x;
  final double y;

  // Primary constructor with initializer list
  Point(this.x, this.y);

  // Named constructor
  Point.origin() : x = 0, y = 0;

  // Factory constructor
  factory Point.fromJson(Map<String, double> json) {
    return Point(json['x']!, json['y']!);
  }

  double distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return (dx * dx + dy * dy).sqrt();
  }

  @override
  String toString() => 'Point(\$x, \$y)';
}

void main() {
  var p1 = Point(3, 4);
  var p2 = Point.origin();
  var p3 = Point.fromJson({'x': 1.0, 'y': 2.0});

  print(p1);
  print('Distance: \${p1.distanceTo(p2)}');
  print(p3);
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_008'..topicId='dart'..title='Null Safety'..description='Dart null safety prevents null errors at compile time. Use ?, ?., ??, and ! operators.'..code='''void main() {
  String? name;          // nullable
  print(name?.length);   // null (safe call)
  print(name ?? 'default'); // 'default' (null coalescing)

  name = 'Dart';
  print(name.length);    // 4 (promoted to non-null)

  // Late initialization
  late String description;
  description = 'Initialized later';
  print(description);

  // Null-aware cascade
  List<int>? numbers;
  numbers ??= [1, 2, 3];
  print(numbers);

  // Null-aware index
  var list = [1, 2, 3];
  var map = {'key': 'value'};
  print(map['missing']?.toUpperCase()); // null
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_009'..topicId='dart'..title='Control Flow'..description='Dart supports if-else, switch expressions, for loops, while, do-while, and pattern matching.'..code='''void main() {
  // Switch expression (Dart 3+)
  var status = 'active';
  var message = switch (status) {
    'active' => 'User is active',
    'inactive' => 'User is inactive',
    'banned' => 'User is banned',
    _ => 'Unknown status',
  };
  print(message);

  // For-in loop
  var colors = ['red', 'green', 'blue'];
  for (var color in colors) {
    print(color);
  }

  // forEach with lambda
  colors.forEach((c) => print('Color: \$c'));

  // While
  var count = 3;
  while (count > 0) {
    print('Countdown: \$count');
    count--;
  }
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_010'..topicId='dart'..title='Enums'..description='Dart enums can have fields, constructors, and methods making them powerful type-safe constants.'..code='''enum Priority {
  low('Low', 1),
  medium('Medium', 2),
  high('High', 3),
  critical('Critical', 4);

  final String label;
  final int level;

  const Priority(this.label, this.level);

  bool get isUrgent => level >= 3;

  @override
  String toString() => '\$label (level \$level)';
}

void main() {
  var p = Priority.high;
  print(p);                  // High (level 3)
  print(p.isUrgent);        // true
  print(Priority.values);   // all values

  // Pattern matching on enum
  var action = switch (p) {
    Priority.low => 'Log it',
    Priority.medium => 'Schedule it',
    Priority.high => 'Do it now',
    Priority.critical => 'Wake everyone up',
  };
  print(action);
}'''..language='dart'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,

    // ── Medium (10) ──
    Snippet()..snippetId='dart_011'..topicId='dart'..title='Futures and async/await'..description='Futures represent values available in the future. async/await makes asynchronous code readable.'..code='''Future<String> fetchUser() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Alice';
}

Future<List<String>> fetchOrders(String user) async {
  await Future.delayed(Duration(milliseconds: 500));
  return ['Order-1', 'Order-2'];
}

void main() async {
  // Sequential
  var user = await fetchUser();
  var orders = await fetchOrders(user);
  print('\$user: \$orders');

  // Parallel
  var results = await Future.wait([
    fetchUser(),
    Future.delayed(Duration(seconds: 1), () => 'Bob'),
  ]);
  print('Parallel: \$results');

  // Error handling
  try {
    await Future.error('Network error');
  } catch (e) {
    print('Error: \$e');
  }
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_012'..topicId='dart'..title='Streams'..description='Streams deliver asynchronous sequences of data events. Use async* and yield to create custom streams.'..code='''Stream<int> countDown(int from) async* {
  for (var i = from; i >= 0; i--) {
    await Future.delayed(Duration(milliseconds: 100));
    yield i;
  }
}

Stream<int> fibonacci() async* {
  int a = 0, b = 1;
  while (true) {
    yield a;
    final next = a + b;
    a = b;
    b = next;
  }
}

void main() async {
  // Listen to stream
  await for (var n in countDown(5)) {
    print('Countdown: \$n');
  }

  // Stream transformations
  var fibs = fibonacci()
      .take(10)
      .where((n) => n.isEven)
      .map((n) => 'fib: \$n');

  await for (var s in fibs) {
    print(s);
  }
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_013'..topicId='dart'..title='Mixins'..description='Mixins allow reusing code across class hierarchies without multiple inheritance.'..code='''mixin Loggable {
  void log(String message) => print('[\${runtimeType}] \$message');
}

mixin Serializable {
  Map<String, dynamic> toJson();
  String serialize() => toJson().toString();
}

class Validator {
  bool validate(String value) => value.isNotEmpty;
}

class User with Loggable, Serializable {
  final String name;
  final String email;

  User(this.name, this.email);

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
  };

  void save() {
    log('Saving user \$name');
    log('Data: \${serialize()}');
  }
}

void main() {
  var user = User('Alice', 'alice@example.com');
  user.save();
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_014'..topicId='dart'..title='Extension Methods'..description='Extension methods add new functionality to existing types without modifying them.'..code='''extension StringExtensions on String {
  String get capitalize =>
      isEmpty ? '' : '\${this[0].toUpperCase()}\${substring(1)}';

  bool get isEmail => RegExp(r'^[\\w.+-]+@[\\w-]+\\.[\\w.]+\$').hasMatch(this);

  String truncate(int maxLength, {String ellipsis = '...'}) =>
      length <= maxLength ? this : '\${substring(0, maxLength)}\$ellipsis';
}

extension ListExtensions<T> on List<T> {
  List<List<T>> chunk(int size) {
    var chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      var end = (i + size < length) ? i + size : length;
      chunks.add(sublist(i, end));
    }
    return chunks;
  }

  T? get secondOrNull => length >= 2 ? this[1] : null;
}

void main() {
  print('hello'.capitalize);          // Hello
  print('alice@mail.com'.isEmail);    // true
  print('Long text here'.truncate(8)); // Long tex...

  print([1,2,3,4,5,6,7].chunk(3));    // [[1,2,3],[4,5,6],[7]]
  print([1].secondOrNull);             // null
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_015'..topicId='dart'..title='Generics'..description='Dart generics enable type-safe reusable code with type parameters on classes, methods, and extensions.'..code='''class Result<T> {
  final T? data;
  final String? error;
  final bool isSuccess;

  Result.success(this.data) : error = null, isSuccess = true;
  Result.failure(this.error) : data = null, isSuccess = false;

  R when<R>({
    required R Function(T data) success,
    required R Function(String error) failure,
  }) {
    if (isSuccess) return success(data as T);
    return failure(error!);
  }
}

class Cache<K, V> {
  final _store = <K, V>{};
  final Duration ttl;

  Cache({this.ttl = const Duration(minutes: 5)});

  void put(K key, V value) => _store[key] = value;
  V? get(K key) => _store[key];
  bool containsKey(K key) => _store.containsKey(key);
}

void main() {
  var result = Result<String>.success('Hello');
  var message = result.when(
    success: (data) => 'Got: \$data',
    failure: (error) => 'Error: \$error',
  );
  print(message);

  var cache = Cache<String, int>();
  cache.put('counter', 42);
  print(cache.get('counter'));
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_016'..topicId='dart'..title='Pattern Matching (Dart 3)'..description='Dart 3 introduces patterns for destructuring, switch expressions, and if-case statements.'..code='''sealed class Shape {}
class Circle extends Shape { final double radius; Circle(this.radius); }
class Rectangle extends Shape { final double w, h; Rectangle(this.w, this.h); }
class Triangle extends Shape { final double b, h; Triangle(this.b, this.h); }

double area(Shape shape) => switch (shape) {
  Circle(radius: var r) => 3.14159 * r * r,
  Rectangle(w: var w, h: var h) => w * h,
  Triangle(b: var b, h: var h) => 0.5 * b * h,
};

void main() {
  // Record pattern
  var (name, age) = ('Alice', 30);
  print('\$name is \$age');

  // Map pattern
  var json = {'name': 'Bob', 'age': 25};
  if (json case {'name': String n, 'age': int a}) {
    print('\$n is \$a years old');
  }

  // List pattern
  var [first, second, ...rest] = [1, 2, 3, 4, 5];
  print('First: \$first, Rest: \$rest');

  // Shape pattern
  var shapes = [Circle(5), Rectangle(4, 6), Triangle(3, 8)];
  for (var s in shapes) {
    print('Area: \${area(s).toStringAsFixed(2)}');
  }
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_017'..topicId='dart'..title='Abstract Classes & Interfaces'..description='Every class is implicitly an interface. Abstract classes define contracts with optional implementations.'..code='''abstract class Repository<T> {
  Future<T?> findById(int id);
  Future<List<T>> findAll();
  Future<void> save(T entity);
  Future<bool> delete(int id);
}

abstract class Cacheable {
  String get cacheKey;
  Duration get cacheDuration => const Duration(minutes: 5);
}

class User implements Cacheable {
  final int id;
  final String name;
  User(this.id, this.name);

  @override
  String get cacheKey => 'user_\$id';

  @override
  String toString() => 'User(\$id, \$name)';
}

class InMemoryUserRepo implements Repository<User> {
  final _store = <int, User>{};
  int _nextId = 1;

  @override
  Future<User?> findById(int id) async => _store[id];

  @override
  Future<List<User>> findAll() async => _store.values.toList();

  @override
  Future<void> save(User entity) async {
    _store[_nextId++] = entity;
  }

  @override
  Future<bool> delete(int id) async => _store.remove(id) != null;
}

void main() async {
  var repo = InMemoryUserRepo();
  await repo.save(User(1, 'Alice'));
  print(await repo.findAll());
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_018'..topicId='dart'..title='Error Handling'..description='Dart exception handling with try-catch-on-finally. Custom exceptions for domain-specific errors.'..code='''class AppException implements Exception {
  final String message;
  final String? code;
  AppException(this.message, {this.code});

  @override
  String toString() => 'AppException[\$code]: \$message';
}

class NetworkException extends AppException {
  final int statusCode;
  NetworkException(String message, this.statusCode)
      : super(message, code: 'NETWORK');
}

class ValidationException extends AppException {
  final Map<String, String> fieldErrors;
  ValidationException(this.fieldErrors)
      : super('Validation failed', code: 'VALIDATION');
}

Future<String> fetchData(bool shouldFail) async {
  if (shouldFail) throw NetworkException('Server error', 500);
  return 'data';
}

void main() async {
  try {
    await fetchData(true);
  } on NetworkException catch (e) {
    print('Network error \${e.statusCode}: \${e.message}');
  } on AppException catch (e) {
    print('App error: \$e');
  } catch (e, stackTrace) {
    print('Unknown error: \$e');
    print(stackTrace);
  } finally {
    print('Done');
  }
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_019'..topicId='dart'..title='Typedef and Function Types'..description='Typedef creates reusable function type aliases for cleaner code and better documentation.'..code='''typedef Predicate<T> = bool Function(T);
typedef Mapper<T, R> = R Function(T);
typedef AsyncCallback = Future<void> Function();
typedef JsonMap = Map<String, dynamic>;

// Using typedefs
List<T> customWhere<T>(List<T> list, Predicate<T> test) {
  return [for (var item in list) if (test(item)) item];
}

List<R> customMap<T, R>(List<T> list, Mapper<T, R> mapper) {
  return [for (var item in list) mapper(item)];
}

Future<void> runWithRetry(AsyncCallback callback, {int retries = 3}) async {
  for (var i = 0; i < retries; i++) {
    try {
      await callback();
      return;
    } catch (e) {
      print('Attempt \${i + 1} failed: \$e');
      if (i == retries - 1) rethrow;
    }
  }
}

void main() {
  var nums = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  print(customWhere(nums, (n) => n.isEven));
  print(customMap(nums, (n) => n * n));
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_020'..topicId='dart'..title='Cascade Notation'..description='Cascades (..) allow chaining multiple operations on the same object without repeating the variable name.'..code='''class QueryBuilder {
  String _table = '';
  final _conditions = <String>[];
  String _orderBy = '';
  int? _limit;

  QueryBuilder from(String table) {
    _table = table;
    return this;
  }
  QueryBuilder where(String condition) {
    _conditions.add(condition);
    return this;
  }
  QueryBuilder orderBy(String field) {
    _orderBy = field;
    return this;
  }
  QueryBuilder limit(int n) {
    _limit = n;
    return this;
  }

  String build() {
    var sql = 'SELECT * FROM \$_table';
    if (_conditions.isNotEmpty) {
      sql += ' WHERE \${_conditions.join(" AND ")}';
    }
    if (_orderBy.isNotEmpty) sql += ' ORDER BY \$_orderBy';
    if (_limit != null) sql += ' LIMIT \$_limit';
    return sql;
  }
}

void main() {
  var query = QueryBuilder()
    ..from('users')
    ..where('age > 18')
    ..where('active = true')
    ..orderBy('name')
    ..limit(10);

  print(query.build());
}'''..language='dart'..difficulty='medium'..isSaved=false..lastViewedAt=null,

    // ── Hard (10) ──
    Snippet()..snippetId='dart_021'..topicId='dart'..title='Isolates'..description='Isolates are Dart\'s concurrency model — independent workers with no shared memory communicating via messages.'..code='''import 'dart:isolate';

// Heavy computation in isolate
int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

Future<int> computeInIsolate(int n) async {
  return await Isolate.run(() => fibonacci(n));
}

// Bidirectional communication
Future<void> workerIsolate(SendPort mainSendPort) async {
  var receivePort = ReceivePort();
  mainSendPort.send(receivePort.sendPort);

  await for (var message in receivePort) {
    if (message is int) {
      var result = fibonacci(message);
      mainSendPort.send(result);
    } else if (message == 'close') {
      receivePort.close();
      break;
    }
  }
}

void main() async {
  // Simple isolate.run
  var sw = Stopwatch()..start();
  var result = await computeInIsolate(35);
  print('fib(35) = \$result in \${sw.elapsedMilliseconds}ms');
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_022'..topicId='dart'..title='Stream Controllers'..description='StreamController creates custom streams for broadcasting events to multiple listeners.'..code='''import 'dart:async';

class EventBus {
  final _controller = StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> on(String eventType) {
    return _controller.stream
        .where((event) => event['type'] == eventType);
  }

  void emit(String type, [dynamic data]) {
    _controller.add({'type': type, 'data': data, 'timestamp': DateTime.now()});
  }

  void dispose() => _controller.close();
}

void main() async {
  var bus = EventBus();

  // Subscribe to specific events
  bus.on('user_login').listen((event) {
    print('Login: \${event['data']}');
  });

  bus.on('purchase').listen((event) {
    print('Purchase: \${event['data']}');
  });

  // Emit events
  bus.emit('user_login', {'userId': 42, 'name': 'Alice'});
  bus.emit('purchase', {'item': 'Book', 'price': 29.99});
  bus.emit('user_login', {'userId': 43, 'name': 'Bob'});

  await Future.delayed(Duration(milliseconds: 100));
  bus.dispose();
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_023'..topicId='dart'..title='Sealed Classes & Exhaustive Matching'..description='Sealed class hierarchies enable exhaustive switch expressions — the compiler ensures all cases are handled.'..code='''sealed class AuthState {}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final String userId;
  final String token;
  AuthSuccess(this.userId, this.token);
}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

String renderAuth(AuthState state) => switch (state) {
  AuthInitial() => 'Please log in',
  AuthLoading() => 'Logging in...',
  AuthSuccess(userId: var id) => 'Welcome, user \$id!',
  AuthError(message: var msg) => 'Error: \$msg',
};

// Nested sealed class
sealed class NetworkResult<T> {}
class Success<T> extends NetworkResult<T> { final T data; Success(this.data); }
class Failure<T> extends NetworkResult<T> { final Exception error; Failure(this.error); }
class Loading<T> extends NetworkResult<T> {}

void main() {
  AuthState state = AuthSuccess('user_42', 'token_abc');
  print(renderAuth(state));

  NetworkResult<String> result = Success('Hello');
  var output = switch (result) {
    Success(data: var d) => 'Data: \$d',
    Failure(error: var e) => 'Error: \$e',
    Loading() => 'Loading...',
  };
  print(output);
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_024'..topicId='dart'..title='Annotations & Metadata'..description='Create custom annotations for documentation, code generation hints, and runtime processing via mirrors.'..code='''class Deprecated {
  final String message;
  const Deprecated(this.message);
}

class Route {
  final String path;
  final String method;
  const Route(this.path, {this.method = 'GET'});
}

class Validate {
  final int minLength;
  final int maxLength;
  const Validate({this.minLength = 0, this.maxLength = 255});
}

class UserController {
  @Route('/users', method: 'GET')
  List<String> getUsers() => ['Alice', 'Bob'];

  @Route('/users', method: 'POST')
  void createUser(@Validate(minLength: 2, maxLength: 50) String name) {
    print('Creating user: \$name');
  }

  @Deprecated('Use getUsers instead')
  List<String> listUsers() => getUsers();
}

void main() {
  var controller = UserController();
  print(controller.getUsers());
  controller.createUser('Alice');
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_025'..topicId='dart'..title='Zone Error Handling'..description='Zones provide execution contexts for error handling, scheduling, and async tracking in Dart.'..code='''import 'dart:async';

void main() {
  // Run code in a custom zone
  runZonedGuarded(
    () {
      // This zone catches all uncaught errors
      Timer(Duration(milliseconds: 100), () {
        throw Exception('Async error in zone!');
      });

      // Synchronous error
      try {
        throw FormatException('Bad format');
      } catch (e) {
        print('Caught sync: \$e');
      }

      Future.delayed(Duration(milliseconds: 50), () {
        print('Zone task completed');
      });

      print('Zone code running');
    },
    (error, stackTrace) {
      print('Zone caught error: \$error');
      // In production: send to crash reporting
    },
  );

  // Custom zone specification
  var spec = ZoneSpecification(
    print: (self, parent, zone, line) {
      parent.print(zone, '[\${DateTime.now()}] \$line');
    },
  );

  Zone.current.fork(specification: spec).run(() {
    print('Timestamped log message');
  });
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_026'..topicId='dart'..title='Completer'..description='Completer creates a Future that you can complete manually, useful for bridging callback-based APIs.'..code='''import 'dart:async';

class TaskQueue {
  final _queue = <_Task>[];
  bool _processing = false;

  Future<T> enqueue<T>(Future<T> Function() task) {
    var completer = Completer<T>();
    _queue.add(_Task(() async {
      try {
        var result = await task();
        completer.complete(result);
      } catch (e, st) {
        completer.completeError(e, st);
      }
    }));
    _processQueue();
    return completer.future;
  }

  Future<void> _processQueue() async {
    if (_processing) return;
    _processing = true;
    while (_queue.isNotEmpty) {
      var task = _queue.removeAt(0);
      await task.run();
    }
    _processing = false;
  }
}

class _Task {
  final Future<void> Function() run;
  _Task(this.run);
}

void main() async {
  var queue = TaskQueue();

  var r1 = queue.enqueue(() async {
    await Future.delayed(Duration(milliseconds: 100));
    print('Task 1 done');
    return 'Result 1';
  });
  var r2 = queue.enqueue(() async {
    await Future.delayed(Duration(milliseconds: 50));
    print('Task 2 done');
    return 'Result 2';
  });

  print(await r1);
  print(await r2);
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_027'..topicId='dart'..title='Operator Overloading'..description='Dart allows overloading operators like +, -, *, ==, [], and []= for custom types.'..code='''class Vector2 {
  final double x, y;
  const Vector2(this.x, this.y);

  Vector2 operator +(Vector2 other) => Vector2(x + other.x, y + other.y);
  Vector2 operator -(Vector2 other) => Vector2(x - other.x, y - other.y);
  Vector2 operator *(double scalar) => Vector2(x * scalar, y * scalar);
  double operator [](int index) => index == 0 ? x : y;
  bool operator >(Vector2 other) => magnitude > other.magnitude;

  double get magnitude => (x * x + y * y);

  @override
  bool operator ==(Object other) =>
      other is Vector2 && x == other.x && y == other.y;

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => 'Vector2(\$x, \$y)';
}

void main() {
  var a = Vector2(3, 4);
  var b = Vector2(1, 2);

  print(a + b);       // Vector2(4.0, 6.0)
  print(a - b);       // Vector2(2.0, 2.0)
  print(a * 2);       // Vector2(6.0, 8.0)
  print(a[0]);        // 3.0
  print(a == Vector2(3, 4)); // true
  print(a > b);       // true
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_028'..topicId='dart'..title='Records'..description='Records are immutable anonymous aggregate types that support structural equality and pattern matching.'..code='''// Named fields record
typedef UserRecord = ({String name, int age, String email});

// Positional record
typedef Pair<A, B> = (A, B);

UserRecord createUser(String name, int age, String email) {
  return (name: name, age: age, email: email);
}

(int, int) divmod(int a, int b) {
  return (a ~/ b, a % b);
}

void main() {
  // Named record
  var user = createUser('Alice', 30, 'alice@mail.com');
  print('\${user.name} is \${user.age}');

  // Positional record
  var (quotient, remainder) = divmod(17, 5);
  print('17 / 5 = \$quotient remainder \$remainder');

  // Record in collections
  var scores = <(String, int)>[
    ('Alice', 95),
    ('Bob', 87),
    ('Charlie', 92),
  ];

  scores.sort((a, b) => b.\$2.compareTo(a.\$2));
  for (var (name, score) in scores) {
    print('\$name: \$score');
  }

  // Record equality (structural)
  var p1 = (x: 1, y: 2);
  var p2 = (x: 1, y: 2);
  print(p1 == p2); // true
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_029'..topicId='dart'..title='Class Modifiers (Dart 3)'..description='Dart 3 class modifiers: base, interface, final, sealed control inheritance and implementation.'..code='''// interface: can only be implemented, not extended
interface class Printable {
  void printInfo() => print(runtimeType);
}

// base: can only be extended, not implemented
base class Animal {
  final String name;
  Animal(this.name);
  void speak() => print('\$name speaks');
}

// final: cannot be extended or implemented outside library
final class Config {
  final String apiUrl;
  final int timeout;
  Config(this.apiUrl, {this.timeout = 30});
}

// Combining: base + mixin
base mixin Walkable {
  void walk() => print('\${runtimeType} is walking');
}

// Using modifiers
class Dog extends Animal with Walkable {
  Dog(String name) : super(name);

  @override
  void speak() => print('\$name: Woof!');
}

class Report implements Printable {
  @override
  void printInfo() => print('Custom Report');
}

void main() {
  Dog('Rex')..speak()..walk();
  Report().printInfo();
  var config = Config('https://api.example.com', timeout: 60);
  print('\${config.apiUrl} (timeout: \${config.timeout}s)');
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_030'..topicId='dart'..title='Stream Transformers'..description='Stream transformers modify streams by mapping, buffering, debouncing, or combining events.'..code='''import 'dart:async';

// Custom debounce transformer
StreamTransformer<T, T> debounce<T>(Duration duration) {
  Timer? timer;
  return StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      timer?.cancel();
      timer = Timer(duration, () => sink.add(data));
    },
    handleDone: (sink) {
      timer?.cancel();
      sink.close();
    },
  );
}

// Buffer transformer: collect N items
StreamTransformer<T, List<T>> buffer<T>(int count) {
  var batch = <T>[];
  return StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      batch.add(data);
      if (batch.length >= count) {
        sink.add(List.from(batch));
        batch.clear();
      }
    },
    handleDone: (sink) {
      if (batch.isNotEmpty) sink.add(List.from(batch));
      sink.close();
    },
  );
}

void main() async {
  // Buffered stream
  var numbers = Stream.fromIterable(List.generate(10, (i) => i));
  await numbers.transform(buffer(3)).forEach(print);
  // [0, 1, 2], [3, 4, 5], [6, 7, 8], [9]
}'''..language='dart'..difficulty='hard'..isSaved=false..lastViewedAt=null,

    // ── Very Hard (10) ──
    Snippet()..snippetId='dart_031'..topicId='dart'..title='Custom Iterable'..description='Implement Iterable interface for lazy evaluation of custom sequences with iterator protocol.'..code='''class PrimeSequence extends Iterable<int> {
  final int limit;
  PrimeSequence(this.limit);

  @override
  Iterator<int> get iterator => _PrimeIterator(limit);
}

class _PrimeIterator implements Iterator<int> {
  final int limit;
  int _current = 1;
  int _count = 0;

  _PrimeIterator(this.limit);

  bool _isPrime(int n) {
    if (n < 2) return false;
    for (var i = 2; i * i <= n; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  @override
  int get current => _current;

  @override
  bool moveNext() {
    if (_count >= limit) return false;
    _current++;
    while (!_isPrime(_current)) _current++;
    _count++;
    return true;
  }
}

void main() {
  var primes = PrimeSequence(20);

  // Lazy evaluation
  print('First 10: \${primes.take(10).toList()}');
  print('Sum: \${primes.reduce((a, b) => a + b)}');
  print('Above 50: \${primes.where((p) => p > 50).toList()}');
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_032'..topicId='dart'..title='Dependency Injection Container'..description='A simple service locator / DI container supporting singleton and factory registrations.'..code='''class ServiceContainer {
  static final _instance = ServiceContainer._();
  factory ServiceContainer() => _instance;
  ServiceContainer._();

  final _singletons = <Type, dynamic>{};
  final _factories = <Type, Function>{};

  void registerSingleton<T>(T instance) {
    _singletons[T] = instance;
  }

  void registerFactory<T>(T Function(ServiceContainer) factory) {
    _factories[T] = factory;
  }

  T get<T>() {
    if (_singletons.containsKey(T)) return _singletons[T] as T;
    if (_factories.containsKey(T)) {
      return (_factories[T] as T Function(ServiceContainer))(this);
    }
    throw Exception('Service not registered: \$T');
  }

  void reset() {
    _singletons.clear();
    _factories.clear();
  }
}

// Services
class Logger {
  void log(String msg) => print('[LOG] \$msg');
}

class ApiClient {
  final Logger logger;
  ApiClient(this.logger);
  String fetch(String url) {
    logger.log('Fetching \$url');
    return 'Response from \$url';
  }
}

void main() {
  var di = ServiceContainer();
  di.registerSingleton(Logger());
  di.registerFactory<ApiClient>((c) => ApiClient(c.get<Logger>()));

  var client = di.get<ApiClient>();
  print(client.fetch('/api/users'));
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_033'..topicId='dart'..title='Macro-like Code Generation'..description='Simulate compile-time code generation using builder patterns and reflective techniques.'..code='''// JSON serialization without code gen
abstract class JsonSerializable<T> {
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}

class FieldMapper<T> {
  final String key;
  final T Function(dynamic) fromJson;
  final dynamic Function(T) toJsonValue;

  FieldMapper(this.key, {required this.fromJson, dynamic Function(T)? toJson})
      : toJsonValue = toJson ?? ((v) => v);
}

class ModelBuilder<T> {
  final Map<String, FieldMapper> _fields = {};
  final T Function(Map<String, dynamic>) _constructor;

  ModelBuilder(this._constructor);

  void field<F>(String name, F Function(dynamic) parser) {
    _fields[name] = FieldMapper<F>(name, fromJson: parser);
  }

  T fromJson(Map<String, dynamic> json) {
    var mapped = <String, dynamic>{};
    for (var entry in _fields.entries) {
      mapped[entry.key] = entry.value.fromJson(json[entry.key]);
    }
    return _constructor(mapped);
  }

  Map<String, dynamic> toJson(Map<String, dynamic> data) {
    return Map.fromEntries(
      _fields.entries.map((e) => MapEntry(e.key, data[e.key])),
    );
  }
}

void main() {
  var builder = ModelBuilder<Map<String, dynamic>>((m) => m);
  builder.field<String>('name', (v) => v as String);
  builder.field<int>('age', (v) => v as int);

  var user = builder.fromJson({'name': 'Alice', 'age': 30});
  print(user);
  print(builder.toJson(user));
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_034'..topicId='dart'..title='Compute Isolates with Ports'..description='Advanced isolate communication using SendPort and ReceivePort for bidirectional message passing.'..code='''import 'dart:isolate';
import 'dart:async';

class IsolatePool {
  final int size;
  final _workers = <_Worker>[];
  int _nextWorker = 0;

  IsolatePool(this.size);

  Future<void> start() async {
    for (var i = 0; i < size; i++) {
      var worker = _Worker(i);
      await worker.start();
      _workers.add(worker);
    }
  }

  Future<R> execute<R>(R Function() task) {
    var worker = _workers[_nextWorker % size];
    _nextWorker++;
    return worker.execute(task);
  }

  void shutdown() {
    for (var w in _workers) w.shutdown();
  }
}

class _Worker {
  final int id;
  late Isolate _isolate;
  late SendPort _sendPort;
  final _receivePort = ReceivePort();
  final _completers = <int, Completer>{};
  int _taskId = 0;

  _Worker(this.id);

  Future<void> start() async {
    _isolate = await Isolate.spawn(_workerMain, _receivePort.sendPort);
    _sendPort = await _receivePort.first as SendPort;
  }

  static void _workerMain(SendPort mainPort) {
    var port = ReceivePort();
    mainPort.send(port.sendPort);
    port.listen((msg) {
      var [taskId, fn] = msg as List;
      var result = (fn as Function)();
      mainPort.send([taskId, result]);
    });
  }

  Future<R> execute<R>(R Function() task) {
    var completer = Completer<R>();
    var id = _taskId++;
    _completers[id] = completer;
    _sendPort.send([id, task]);
    return completer.future;
  }

  void shutdown() => _isolate.kill();
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_035'..topicId='dart'..title='Custom Lint Rules'..description='Create custom analysis rules using Dart analyzer plugin API for enforcing code standards.'..code='''// analyzer_plugin example (conceptual)
// In practice, use custom_lint package

/// Rule: All public methods must have documentation
class DocumentationRule {
  final List<String> violations = [];

  void checkClass(String className, List<MethodInfo> methods) {
    for (var method in methods) {
      if (method.isPublic && !method.hasDocComment) {
        violations.add(
          '\$className.\${method.name}: Missing documentation'
        );
      }
    }
  }

  void report() {
    if (violations.isEmpty) {
      print('All public methods are documented');
    } else {
      print('Documentation violations:');
      for (var v in violations) print('  - \$v');
    }
  }
}

class MethodInfo {
  final String name;
  final bool isPublic;
  final bool hasDocComment;
  MethodInfo(this.name, {required this.isPublic, required this.hasDocComment});
}

void main() {
  var rule = DocumentationRule();
  rule.checkClass('UserService', [
    MethodInfo('getUser', isPublic: true, hasDocComment: true),
    MethodInfo('deleteUser', isPublic: true, hasDocComment: false),
    MethodInfo('_validate', isPublic: false, hasDocComment: false),
  ]);
  rule.report();
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_036'..topicId='dart'..title='Memory-Efficient Data Processing'..description='Use generators and sync*/async* for processing large datasets without loading everything into memory.'..code='''import 'dart:math';

// Lazy data pipeline
Iterable<Map<String, dynamic>> generateRecords(int count) sync* {
  var rng = Random(42);
  for (var i = 0; i < count; i++) {
    yield {
      'id': i,
      'value': rng.nextDouble() * 1000,
      'category': ['A', 'B', 'C'][rng.nextInt(3)],
    };
  }
}

// Chunked processing
Iterable<List<T>> chunk<T>(Iterable<T> source, int size) sync* {
  var batch = <T>[];
  for (var item in source) {
    batch.add(item);
    if (batch.length >= size) {
      yield List.from(batch);
      batch.clear();
    }
  }
  if (batch.isNotEmpty) yield batch;
}

void main() {
  // Process 1 million records in chunks of 1000
  var records = generateRecords(1000000);

  var categoryTotals = <String, double>{};
  var processedCount = 0;

  for (var batch in chunk(records, 1000)) {
    for (var record in batch) {
      var cat = record['category'] as String;
      categoryTotals[cat] = (categoryTotals[cat] ?? 0) + (record['value'] as double);
      processedCount++;
    }
  }

  print('Processed: \$processedCount records');
  categoryTotals.forEach((k, v) =>
    print('\$k: \${v.toStringAsFixed(2)}'));
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_037'..topicId='dart'..title='Type System Tricks'..description='Advanced type system usage: phantom types, type-safe builders, and branded types for compile-time safety.'..code='''// Phantom types for state tracking
class Unvalidated {}
class Validated {}

class Form<State> {
  final Map<String, String> _data;
  Form._(this._data);

  factory Form.create(Map<String, String> data) {
    return Form<Unvalidated>._(data) as Form<State>;
  }
}

Form<Validated> validate(Form<Unvalidated> form) {
  // Perform validation...
  return Form<Validated>._(form._data);
}

void submit(Form<Validated> form) {
  print('Submitting validated form: \${form._data}');
}

// Type-safe units
extension type Meters(double value) {
  Meters operator +(Meters other) => Meters(value + other.value);
  Meters operator *(double factor) => Meters(value * factor);
  Kilometers toKilometers() => Kilometers(value / 1000);
}

extension type Kilometers(double value) {
  Meters toMeters() => Meters(value * 1000);
}

void main() {
  var distance1 = Meters(100);
  var distance2 = Meters(250);
  var total = distance1 + distance2;
  print('Total: \${total.value}m = \${total.toKilometers().value}km');

  // Form<Unvalidated> can't be submitted
  // submit(Form.create({'name': 'test'})); // Compile error
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_038'..topicId='dart'..title='FFI (Foreign Function Interface)'..description='Call native C code from Dart using dart:ffi for performance-critical operations.'..code='''import 'dart:ffi';
import 'dart:io';

// Load native library
// final dylib = Platform.isWindows
//     ? DynamicLibrary.open('native.dll')
//     : DynamicLibrary.open('libnative.so');

// Define C function signatures
typedef AddFunc = Int32 Function(Int32, Int32);
typedef AddDart = int Function(int, int);

typedef StrLenFunc = Int32 Function(Pointer<Utf8>);
typedef StrLenDart = int Function(Pointer<Utf8>);

// Struct mapping
final class Point extends Struct {
  @Double()
  external double x;

  @Double()
  external double y;
}

// Simulated FFI usage
void main() {
  print('Dart FFI Example');
  print('Platform: \${Platform.operatingSystem}');

  // In real code:
  // final add = dylib.lookupFunction<AddFunc, AddDart>('add');
  // print(add(3, 4)); // 7

  // Allocate native memory
  // final ptr = calloc<Point>();
  // ptr.ref.x = 3.0;
  // ptr.ref.y = 4.0;
  // print('Point: (\${ptr.ref.x}, \${ptr.ref.y})');
  // calloc.free(ptr);

  print('FFI enables calling C/C++ from Dart');
  print('Use cases: crypto, compression, game engines');
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_039'..topicId='dart'..title='Custom Zone Specification'..description='Zones intercept and customize async operations, timer creation, and microtask scheduling.'..code='''import 'dart:async';

class ProfilingZone {
  final _timings = <String, List<Duration>>{};
  int _totalAsync = 0;
  int _totalTimers = 0;

  ZoneSpecification get specification => ZoneSpecification(
    print: (self, parent, zone, line) {
      parent.print(zone, '[\${DateTime.now().toIso8601String()}] \$line');
    },
    scheduleMicrotask: (self, parent, zone, f) {
      _totalAsync++;
      parent.scheduleMicrotask(zone, () {
        var sw = Stopwatch()..start();
        f();
        sw.stop();
        _record('microtask', sw.elapsed);
      });
    },
    createTimer: (self, parent, zone, duration, f) {
      _totalTimers++;
      return parent.createTimer(zone, duration, () {
        var sw = Stopwatch()..start();
        f();
        sw.stop();
        _record('timer', sw.elapsed);
      });
    },
  );

  void _record(String type, Duration duration) {
    _timings.putIfAbsent(type, () => []).add(duration);
  }

  void printReport() {
    print('=== Profiling Report ===');
    print('Async tasks: \$_totalAsync');
    print('Timers: \$_totalTimers');
    _timings.forEach((type, durations) {
      var total = durations.fold<int>(0, (s, d) => s + d.inMicroseconds);
      print('\$type: \${durations.length} calls, \${total}us total');
    });
  }
}

void main() async {
  var profiler = ProfilingZone();
  await runZoned(
    () async {
      print('Starting profiled work');
      await Future.delayed(Duration(milliseconds: 10));
      await Future.microtask(() => print('Microtask'));
      print('Done');
    },
    zoneSpecification: profiler.specification,
  );
  profiler.printReport();
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='dart_040'..topicId='dart'..title='Extension Types (Dart 3.3)'..description='Extension types provide zero-cost wrappers around existing types for type-safe APIs without runtime overhead.'..code='''// Extension type wraps int with no overhead
extension type const UserId(int value) {
  bool get isValid => value > 0;
  UserId next() => UserId(value + 1);
}

extension type const Email(String value) {
  bool get isValid => value.contains('@') && value.contains('.');
  String get domain => value.split('@').last;
  String get masked {
    var parts = value.split('@');
    var name = parts[0];
    var masked = name[0] + '***' + name[name.length - 1];
    return '\$masked@\${parts[1]}';
  }
}

extension type JsonMap(Map<String, dynamic> _map) {
  T? get<T>(String key) => _map[key] as T?;
  T require<T>(String key) {
    if (!_map.containsKey(key)) throw ArgumentError('Missing key: \$key');
    return _map[key] as T;
  }
  JsonMap? nested(String key) {
    var val = _map[key];
    return val is Map<String, dynamic> ? JsonMap(val) : null;
  }
}

void main() {
  var userId = UserId(42);
  print('Valid: \${userId.isValid}');
  print('Next: \${userId.next().value}');

  var email = Email('alice@example.com');
  print('Domain: \${email.domain}');
  print('Masked: \${email.masked}');

  var json = JsonMap({'name': 'Alice', 'age': 30, 'address': {'city': 'Berlin'}});
  print('Name: \${json.require<String>("name")}');
  print('City: \${json.nested("address")?.get<String>("city")}');
}'''..language='dart'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
  ];
}
