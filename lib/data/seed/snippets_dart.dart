import '../models/snippet.dart';

List<Snippet> getDartSnippets() {
  return [

    // ═══════════════════════════════════════════════════════════
    // 1. BASICS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_001'
      ..topicId = 'dart'
      ..title = 'Variables & Constants'
      ..description = 'Dart uses var for inference, final for runtime constants, and const for compile-time constants.'
      ..code = '''void main() {
  // Use 'var' when type is obvious or inferred
  var name = 'Dart';
  var version = 3.0;

  // Explicit types (optional if inferred)
  String city = 'Bangalore';
  int population = 12000000;

  // 'final' - value can only be set once (runtime constant)
  final currentTime = DateTime.now();

  // 'const' - constant at compile-time
  const pi = 3.14159;
  const gravity = 9.8;

  // Dynamic - skip type checking (use sparingly)
  dynamic value = 10;
  value = 'Changing to string';

  print('\$name v\$version is used in \$city');
}'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Basics'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_002'
      ..topicId = 'dart'
      ..title = 'Null Safety'
      ..description = 'Dart is soundly null-safe. Use ? for nullable types, ! for assertion, and ?? for defaults.'
      ..code = '''void main() {
  // Nullable type
  String? name;

  // Null-aware access (?.)
  print(name?.length); // Prints 'null', doesn't crash

  // Null-coalescing (??)
  var displayName = name ?? 'Guest';

  // Null-aware assignment (??=)
  name ??= 'Developer';

  // Bang operator (!) - Force cast to non-null
  // Use ONLY when you are 100% sure it's not null
  print(name!.toUpperCase());

  // Late initialization
  // Prompts Dart that the value WILL be set before use
  late String description;
  description = 'Sounds like a plan!';
  print(description);
}'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Basics'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_003'
      ..topicId = 'dart'
      ..title = 'Strings & Interpolation'
      ..description = 'Use \$variable or \${expression} for interpolation. Support multi-line and raw strings.'
      ..code = '''void main() {
  var name = 'Alice';
  var age = 22;

  // Interpolation
  print('Hello, \$name!');
  print('In 5 years: \${age + 5}');

  // Multi-line strings
  var bio = \'\'\'
Dart is a client-optimized
language for fast apps
on any platform.
\'\'\';

  // Raw strings (ignore escape characters)
  var path = r'C:\\Users\\Documents\\Code';

  // Methods
  print('dart'.toUpperCase());
  print(' hello '.trim());
  print('abc'.split('')); // ['a', 'b', 'c']
}'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Basics'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_004'
      ..topicId = 'dart'
      ..title = 'Records (Dart 3+)'
      ..description = 'Records allow grouping multiple values into a single object without defining a class.'
      ..code = '''void main() {
  // Positional and named fields in a record
  var user = ('Alice', age: 22, role: 'Dev');

  // Accessing positional fields (\$1, \$2...)
  print(user.\$1); // Alice

  // Accessing named fields
  print(user.role); // Dev

  // Destructuring a record
  var (name, :age) = ('Bob', age: 25);
  print('\$name is \$age');

  // Typed records
  (int, int) swap((int, int) record) {
    var (a, b) = record;
    return (b, a);
  }

  final point = (10, 20);
  final swapped = swap(point);
  print(swapped); // (20, 10)
}'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'Basics'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 2. COLLECTIONS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_005'
      ..topicId = 'dart'
      ..title = 'Lists & Spread'
      ..description = 'Lists are ordered collections. Support spread operator and collection-if/for.'
      ..code = '''void main() {
  var fruits = ['apple', 'banana', 'cherry'];

  // Add/Remove
  fruits.add('mango');
  fruits.removeAt(0);

  // Spread operator (...)
  var moreFruits = ['orange', ...fruits];

  // Collection if
  var showPromo = true;
  var items = [
    'Home',
    'Search',
    if (showPromo) 'Special Offer',
  ];

  // Collection for
  var numbers = [1, 2, 3];
  var strings = ['#0', for (var n in numbers) '#\$n'];

  print(strings); // [#0, #1, #2, #3]

  // Map/Filter
  var upper = fruits.map((f) => f.toUpperCase()).toList();
  var longNames = fruits.where((f) => f.length > 5).toList();
}'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'Collections'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_006'
      ..topicId = 'dart'
      ..title = 'Maps & Sets'
      ..description = 'Maps store key-value pairs. Sets store unique elements only.'
      ..code = '''void main() {
  // --- Sets (Unique items) ---
  var uniqueIds = {101, 102, 103, 101}; // the second 101 is ignored
  print(uniqueIds.length); // 3

  // --- Maps (K,V pairs) ---
  var config = {
    'env': 'prod',
    'version': 1.2,
    'retries': 3,
  };

  // Safe access
  print(config['env'] ?? 'dev');

  // Iteration
  config.forEach((key, value) {
    print('\$key consumes \$value');
  });

  // Spread and Collection-if in Maps
  var overrides = {'env': 'staging'};
  var finalConfig = {
    ...config,
    ...overrides,
    if (true) 'debug': false,
  };
}'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'Collections'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 3. FUNCTIONS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_007'
      ..topicId = 'dart'
      ..title = 'Functions & Parameters'
      ..description = 'Dart supports positional and named parameters (optional or required).'
      ..code = '''// Standard function
int sum(int a, int b) {
  return a + b;
}

// Arrow syntax (for single expressions)
int multiply(int a, int b) => a * b;

// Named parameters - wrapped in {}
// 'required' ensures the caller provides it
void logUser({required String name, int? age, String role = 'Guest'}) {
  print('\$name [\$role] - Age: \${age ?? "N/A"}');
}

// Optional positional parameters - wrapped in []
String greet(String name, [String? prefix]) {
  return '\${prefix ?? "Hello"}, \$name';
}

void main() {
  logUser(name: 'Alice', role: 'Dev');
  print(greet('Bob'));
  print(greet('Alice', 'Hi'));
}'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Functions'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_008'
      ..topicId = 'dart'
      ..title = 'Typedefs & Function Types'
      ..description = 'Typedefs allow you to define custom function types for cleaner signatures.'
      ..code = '''// Define a function signature
typedef Filter = bool Function(int value);

List<int> customFilter(List<int> list, Filter test) {
  var result = <int>[];
  for (var item in list) {
    if (test(item)) result.add(item);
  }
  return result;
}

// Modern inline typedef handles generics too
typedef Json = Map<String, dynamic>;

void main() {
  var nums = [1, 2, 3, 4, 5, 6];

  // Using the filter
  var evens = customFilter(nums, (n) => n % 2 == 0);

  // Passing a named function
  bool isLarge(int n) => n > 4;
  var large = customFilter(nums, isLarge);

  print(evens); // [2, 4, 6]
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Functions'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 4. CONTROL FLOW
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_009'
      ..topicId = 'dart'
      ..title = 'Modern Switch (Dart 3+)'
      ..description = 'Switch is now an expression and supports powerful pattern matching.'
      ..code = '''enum Status { pending, active, deleted }

void main() {
  var status = Status.active;

  // Switch Expression - returns a value
  var label = switch (status) {
    Status.pending => 'Work in Progress',
    Status.active  => 'Online',
    Status.deleted => 'Archived',
  };

  // Pattern Matching in Switch
  var score = (10, 20); // Record
  switch (score) {
    case (0, 0):
      print('Origin');
    case (int x, int y) when x == y:
      print('On the line');
    case (var x, var y):
      print('Point: \$x, \$y');
  }

  // Guard clauses with 'when'
  var age = 22;
  var category = switch (age) {
    < 13 => 'Child',
    >= 13 && < 20 => 'Teen',
    _ => 'Adult', // Default case
  };
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Control Flow'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_010'
      ..topicId = 'dart'
      ..title = 'If-Case Statement'
      ..description = 'The if-case statement allows matching patterns inside a conditional block.'
      ..code = '''void main() {
  dynamic data = [1, 2, 3];

  // Match list pattern and destructure
  if (data case [int a, int b, int c]) {
    print('Sum: \${a + b + c}');
  }

  // Match specific shapes
  Map<String, dynamic> json = {'user': 'Alice', 'age': 22};

  if (json case {'user': String name, 'age': int age}) {
    print('\$name is \$age years old');
  }

  // Logical patterns in if-case
  var pair = (1, 5);
  if (pair case (1, 5) || (5, 1)) {
    print('Found the pair!');
  }
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Control Flow'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 5. OOP
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_011'
      ..topicId = 'dart'
      ..title = 'Classes & Constructors'
      ..description = 'Dart classes with formal parameters, named constructors, and initializer lists.'
      ..code = '''class Point {
  final double x;
  final double y;

  // Primary constructor (auto-assigns parameters)
  Point(this.x, this.y);

  // Named constructor
  Point.origin()
      : x = 0,
        y = 0; // Initializer list

  // Factory constructor
  factory Point.at(double value) {
    return Point(value, value);
  }

  // Method
  double distanceTo(Point other) {
    return 5.0; // Placeholder
  }

  // Override toString
  @override
  String toString() => 'Point(\$x, \$y)';
}

void main() {
  var p1 = Point(10, 20);
  var p2 = Point.origin();
  var p3 = Point.at(5.0);
}'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_012'
      ..topicId = 'dart'
      ..title = 'Getter & Setter'
      ..description = 'Encapsulate fields with custom logic using the get and set keywords.'
      ..code = '''class Rectangle {
  double _width = 0;
  double _height = 0;

  // Private field (starts with _)
  // Getter
  double get area => _width * _height;

  // Setter
  set width(double val) {
    if (val < 0) throw Exception('Width must be positive');
    _width = val;
  }

  set height(double val) {
    _height = val;
  }
}

void main() {
  var rect = Rectangle();
  rect.width = 10;
  rect.height = 5;
  print(rect.area); // 50
}'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_013'
      ..topicId = 'dart'
      ..title = 'Mixins'
      ..description = 'Mixins allow code reuse across class hierarchies without strict inheritance.'
      ..code = '''mixin Logger {
  void log(String msg) => print('[LOG] \$msg');
}

mixin DataOperations {
  void save() => print('Saving to DB...');
}

class UserService with Logger, DataOperations {
  void createUser(String name) {
    log('Creating user: \$name');
    save();
  }
}

// Mixins can be restricted to specific superclasses
mixin DetailLogger on Logger {
  void logFine(String msg) => log('FINE: \$msg');
}

void main() {
  UserService().createUser('Alice');
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_014'
      ..topicId = 'dart'
      ..title = 'Extension Methods'
      ..description = 'Add new functionality to existing classes (even built-in ones) without subclassing.'
      ..code = '''extension StringParsing on String {
  bool get isEmail {
    return contains('@') && contains('.');
  }

  String get capitalize {
    if (isEmpty) return this;
    return '\${this[0].toUpperCase()}\${substring(1)}';
  }
}

extension IntListExt on List<int> {
  int get sum => fold(0, (a, b) => a + b);
}

void main() {
  var email = 'hello@dart.dev';
  print(email.isEmail); // true

  var name = 'alice';
  print(name.capitalize); // Aryant

  var nums = [1, 2, 3];
  print(nums.sum); // 6
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_015'
      ..topicId = 'dart'
      ..title = 'Sealed Classes'
      ..description = 'Sealed classes restrict the class hierarchy, allowing for exhaustive switch checks.'
      ..code = '''sealed class Result {}

class Success extends Result {
  final String data;
  Success(this.data);
}

class Failure extends Result {
  final Exception error;
  Failure(this.error);
}

class Loading extends Result {}

// Compiler enforces that all subtypes of Result are handled
String handleResult(Result r) {
  return switch (r) {
    Success s => 'Data: \${s.data}',
    Failure f => 'Error: \${f.error}',
    Loading _ => 'Please wait...',
  };
}

void main() {
  print(handleResult(Success('Hello')));
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_016'
      ..topicId = 'dart'
      ..title = 'Enhanced Enums'
      ..description = 'Enums in Dart can have fields, constructors, and methods.'
      ..code = '''enum AppState {
  initial(0, 'App is starting'),
  loading(1, 'Fetching data'),
  ready(2, 'App is live');

  // Fields
  final int code;
  final String message;

  // Constant Constructor
  const AppState(this.code, this.message);

  // Getter
  bool get isWorking => code < 2;

  // Method
  void printInfo() => print('[\$code] \$message');
}

void main() {
  var state = AppState.loading;
  state.printInfo();
  print(state.isWorking); // true
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_017'
      ..topicId = 'dart'
      ..title = 'Abstract Class & Interface'
      ..description = 'Every class is implicitly an interface. Use abstract classes to define contracts.'
      ..code = '''// Implicit Interface
class Mock {
  void shout() => print('HELLO');
}

// User has to implement 'shout'
class RealUser implements Mock {
  @override
  void shout() => print('Hello');
}

// Abstract class (cannot be instantiated)
abstract class Repository {
  void save(String data); // Abstract method
  void log() => print('Action logged'); // Concrete method
}

class DiskRepo extends Repository {
  @override
  void save(String data) => print('Saving \$data to disk');
}

void main() {
  DiskRepo().save('Secret');
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 6. ASYNC
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_018'
      ..topicId = 'dart'
      ..title = 'async / await & Future'
      ..description = 'Handling asynchronous operations gracefully with Futures.'
      ..code = '''Future<String> fetchUserData() async {
  // Simulate network delay
  await Future.delayed(Duration(seconds: 2));
  return 'User: Alice';
}

void main() async {
  print('Fetching...');

  try {
    var result = await fetchUserData();
    print(result);
  } catch (err) {
    print('Failed: \$err');
  } finally {
    print('Request ended');
  }

  // Chained approach
  fetchUserData()
      .then((val) => print('Then: \$val'))
      .catchError((e) => print(e));
}'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'Async'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_019'
      ..topicId = 'dart'
      ..title = 'Parallel Tasks & Timeouts'
      ..description = 'Run multiple Futures in parallel using Future.wait and handle timeouts.'
      ..code = '''Future<String> fetchData(int id) async {
  await Future.delayed(Duration(seconds: 1));
  return 'Data from \$id';
}

void main() async {
  // Parallel execution
  var results = await Future.wait([
    fetchData(1),
    fetchData(2),
    fetchData(3),
  ]);
  print(results); // [Data from 1, Data from 2, Data from 3]

  // Handling timeouts
  try {
    var fastRes = await fetchData(1).timeout(
      Duration(milliseconds: 500),
      onTimeout: () => 'Fallback',
    );
    print(fastRes);
  } catch (e) {
    print('Too slow!');
  }
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Async'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_020'
      ..topicId = 'dart'
      ..title = 'Streams & async*'
      ..description = 'Streams provide a sequence of asynchronous events. Use async* and yield to generate them.'
      ..code = '''Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // Push value to the stream
  }
}

void main() async {
  var stream = countStream(5);

  // Consuming via for-each
  await for (var val in stream) {
    print('Stream Value: \$val');
  }

  // Consuming via listen
  var sub = countStream(3).listen(
    (data) => print('Data: \$data'),
    onDone: () => print('Done!'),
  );
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Async'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_021'
      ..topicId = 'dart'
      ..title = 'StreamController'
      ..description = 'Manual management of streams via StreamController. Useful for Event Buses.'
      ..code = '''import 'dart:async';

class EventBus {
  final _controller = StreamController<String>.broadcast();

  // Sink for adding events
  StreamSink<String> get eventSink => _controller.sink;

  // Stream for listening
  Stream<String> get eventStream => _controller.stream;

  void dispose() => _controller.close();
}

void main() {
  var bus = EventBus();

  bus.eventStream.listen((msg) => print('Listener 1: \$msg'));
  bus.eventStream.listen((msg) => print('Listener 2: \$msg'));

  bus.eventSink.add('User Logged In');
  bus.eventSink.add('Button Clicked');
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Async'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_022'
      ..topicId = 'dart'
      ..title = 'Completer'
      ..description = 'A Completer allows you to manually produce a Future result at any point.'
      ..code = '''import 'dart:async';

Future<String> bridgeLegacyCallback() {
  var completer = Completer<String>();

  // Simulate an old callback API
  Timer(Duration(seconds: 1), () {
    if (true) {
      completer.complete('Data from callback');
    } else {
      completer.completeError('Something went wrong');
    }
  });

  return completer.future;
}

void main() async {
  var result = await bridgeLegacyCallback();
  print(result);
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Async'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 7. ADVANCED & ERRORS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_023'
      ..topicId = 'dart'
      ..title = 'Exceptions & Custom Errors'
      ..description = 'Handle errors with try-catch and define custom exceptions.'
      ..code = '''class ApiException implements Exception {
  final String message;
  final int code;

  ApiException(this.message, this.code);

  @override
  String toString() => 'ApiException [\$code]: \$message';
}

void sendRequest() {
  throw ApiException('Unauthorized', 401);
}

void main() {
  try {
    sendRequest();
  } on ApiException catch (e) {
    // Catch specific type
    print('Caught API problem: \${e.message}');
  } catch (e) {
    // Catch generic errors
    print('Unknown error: \$e');
  } finally {
    print('Log: Request attempted');
  }
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Advanced'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_024'
      ..topicId = 'dart'
      ..title = 'Isolates'
      ..description = 'Isolates are independent workers. Use them for heavy computation to avoid frame drops.'
      ..code = '''import 'dart:isolate';

// Must be a top-level or static function
void heavyTask(SendPort sendPort) {
  var result = 0;
  for (var i = 0; i < 1000000000; i++) {
    result += i;
  }
  sendPort.send(result);
}

void main() async {
  print('Starting heavy task...');
  var receivePort = ReceivePort();

  // Spawn an isolate
  await Isolate.spawn(heavyTask, receivePort.sendPort);

  // Wait for response
  receivePort.listen((data) {
    print('Computed value: \$data');
    receivePort.close();
  });

  print('Main thread is still responsive!');
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Advanced'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_025'
      ..topicId = 'dart'
      ..title = 'Zones'
      ..description = 'Zones allow you to scope error handling and intercept print calls.'
      ..code = '''import 'dart:async';

void main() {
  runZonedGuarded(() {
    // Errors inside this block won't crash the program
    Timer(Duration(seconds: 1), () {
      throw Exception('Async error inside zone');
    });

    print('Hello from the zone');
  }, (error, stack) {
    print('Zone caught an error: \$error');
  });

  // Custom print logic via specification
  var spec = ZoneSpecification(
    print: (self, parent, zone, msg) {
      parent.print(zone, '[LOG]: \$msg');
    },
  );

  Zone.current.fork(specification: spec).run(() {
    print('This message is prefixed!');
  });
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Advanced'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_026'
      ..topicId = 'dart'
      ..title = 'Cascade Notation'
      ..description = 'The .. operator allows multiple operations on the same object.'
      ..code = '''class User {
  String name = '';
  int age = 0;
  List<String> roles = [];

  void save() => print('Saved \$name');
}

void main() {
  // Cascades - the expression evaluates to the User object
  var user = User()
    ..name = 'Alice'
    ..age = 22
    ..roles.add('Admin')
    ..roles.add('Developer')
    ..save();

  // Null-aware cascade (?..)
  User? nullableUser;
  nullableUser?..name = 'Guest'
              ..save();
}'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'Advanced'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_027'
      ..topicId = 'dart'
      ..title = 'Spread & Destructuring'
      ..description = 'Powerful list and map manipulation using spread and modern destructuring syntax.'
      ..code = '''void main() {
  // --- Spread ---
  var listA = [1, 2];
  var listB = [0, ...listA, 3]; // [0, 1, 2, 3]

  // --- De-structuring Records ---
  var (id, name) = (101, 'Alice');

  // --- Map Pattern Matching ---
  var userJson = {'id': 1, 'name': 'Bob'};
  var {'id': userId, 'name': userName} = userJson;

  // --- Patterns in Loops ---
  var scores = [(1, 90), (2, 85)];
  for (var (id, val) in scores) {
    print('User \$id scored \$val');
  }
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Advanced'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 8. OTHER
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_028'
      ..topicId = 'dart'
      ..title = 'HTTP Requests'
      ..description = 'A typical pattern for handling HTTP API calls in Dart.'
      ..code = '''import 'dart:convert';

// Hypothetical implementation using http package patterns
Future<Map<String, dynamic>> fetchProfile(int id) async {
  // final response = await http.get(Uri.parse('api/v1/user/\$id'));
  // if (response.statusCode == 200) return jsonDecode(response.body);

  // Mock
  return {'id': id, 'name': 'Alice', 'verified': true};
}

void main() async {
  var profile = await fetchProfile(42);
  print('User: \${profile['name']}');
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Networking'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_029'
      ..topicId = 'dart'
      ..title = 'Generics'
      ..description = 'Use generics to write flexible, type-safe reusable logic.'
      ..code = '''class Box<T> {
  T? _content;

  void put(T value) => _content = value;
  T? fetch() => _content;
}

// Generic function
R transform<T, R>(T input, R Function(T) mapper) {
  return mapper(input);
}

void main() {
  var intBox = Box<int>();
  intBox.put(10);

  var strBox = Box<String>();
  strBox.put('Hello');

  var result = transform(5, (n) => 'Number: \$n');
  print(result); // Number: 5
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Advanced'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_030'
      ..topicId = 'dart'
      ..title = 'Unit Testing'
      ..description = 'The standard way to write tests in Dart using the test package.'
      ..code = '''/*
import 'package:test/test.dart';

void main() {
  group('Calculator Tests', () {
    test('Addition should work', () {
      expect(2 + 2, equals(4));
    });

    test('String contains', () {
      expect('Dart is cool', contains('cool'));
    });
  });
}
*/

void main() {
  print('Run "dart test" to execute these.');
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Testing'
      ..isSaved = false
      ..lastViewedAt = null,

  ];
}
