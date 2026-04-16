import '../models/snippet.dart';

List<Snippet> getDartSnippets() {
  return [

    // ═══════════════════════════════════════════════════════════
    // 1. BASICS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_001'
      ..topicId = 'dart'
      ..title = 'Variables & final / const'
      ..description = 'var infers type. final is set-once at runtime. const is a compile-time constant.'
      ..code = '''// var — type inferred, mutable
var name = 'Dart';
var version = 3.0;
var isAwesome = true;

name = 'Flutter';   // ✅ mutable

// Explicit type
String city = 'Bangalore';
int pin = 560001;
double price = 99.99;

// final — set once at runtime (like val in Kotlin)
final createdAt = DateTime.now();  // computed at runtime
final userId = 42;
// userId = 99;   // ❌ ERROR

// const — compile-time constant (even more restrictive)
const pi = 3.14159;
const appName = 'MyApp';
const timeout = Duration(seconds: 30);
// const now = DateTime.now();   // ❌ ERROR — not compile-time

// Late — declare now, initialize later (non-nullable)
late String fullName;
// use fullName before assigning = LateInitializationError
fullName = 'Aryant Dev';
print(fullName);   // safe now

// Dynamic — opt out of type system (use sparingly)
dynamic anything = 'hello';
anything = 42;     // allowed

print(name.runtimeType);   // String'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Basics'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_002'
      ..topicId = 'dart'
      ..title = 'Data Types'
      ..description = 'Dart\'s core types: int, double, num, bool, String, List, Map, Set, and Symbol.'
      ..code = '''// Numbers
int age = 22;
int bigNum = 1_000_000;
int hex = 0xFF;          // 255

double gravity = 9.8;
double sci = 1.5e10;     // 15000000000.0

num flexible = 42;       // int or double
flexible = 3.14;         // ✅ both work

// Boolean
bool isLoggedIn = true;
bool isEmpty = false;

// String
String greeting = 'Hello, Dart!';
String multiline = \'\'\'
  This is a
  multiline string
\'\'\';

// Type checks and conversions
print(42 is int);           // true
print(3.14 is double);      // true
print(42 is num);           // true

// Conversions
print(int.parse('42'));         // 42
print(double.parse('3.14'));    // 3.14
print(42.toString());           // '42'
print(3.14159.toStringAsFixed(2));  // '3.14'

// Runes and symbols
var heart = '\\u2764';   // ❤
var clap  = '\\u{1F44F}'; // 👏

// Useful int/double methods
print((-5).abs());         // 5
print(3.7.round());        // 4
print(3.7.floor());        // 3
print(3.2.ceil());         // 4
print(3.7.truncate());     // 3'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Basics'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_003'
      ..topicId = 'dart'
      ..title = 'Null Safety'
      ..description = 'Dart has sound null safety. ? makes a type nullable. ?? provides a default. ! asserts non-null.'
      ..code = '''// Non-nullable — can NEVER be null (default)
String name = 'Aryant';
// name = null;  // ❌ compile error

// Nullable — add ? to allow null
String? nickname = null;
nickname = 'Dev';   // ✅ also fine

// Safe access — returns null instead of crashing
print(nickname?.length);       // 3
String? nullStr = null;
print(nullStr?.toUpperCase()); // null (no crash)

// Null-coalescing — provide a default
String display = nickname ?? 'Anonymous';
print(display);    // Dev

// Null-coalescing assignment
String? cached;
cached ??= 'computed value';   // only assigns if null
print(cached);     // computed value

// Null assertion — throws if null (use carefully!)
String definitelyNotNull = nickname!;  // throws if nickname is null

// Late — for non-nullable fields initialized after declaration
class Config {
  late String apiKey;

  void init(String key) {
    apiKey = key;  // set before use
  }
}

// Conditional member access in chains
List<String>? tags = ['flutter', 'dart'];
int? count = tags?.length;   // 2
String? first = tags?.first; // 'flutter'
tags?.add('mobile');

// Null-aware cascade
tags?..add('app')..add('mobile');

// if-null in expressions
int result = int.tryParse('bad') ?? 0;
print(result);   // 0'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'Basics'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_004'
      ..topicId = 'dart'
      ..title = 'String Interpolation & Multiline'
      ..description = 'Use \$ for interpolation. Triple quotes for multiline. Raw strings with r prefix.'
      ..code = '''final name = 'Aryant';
final age = 22;

// Simple interpolation
print('Name: \$name');              // Name: Aryant

// Expression interpolation with \${}
print('In 5 years: \${age + 5}');   // In 5 years: 27
print('Upper: \${name.toUpperCase()}');  // Upper: ARYANT

// Multiline string (single or double quotes, triple)
final json = """
{
  "name": "\$name",
  "age": \$age,
  "city": "Bangalore"
}
""";
print(json);

// Raw string — no escape processing
final path = r'C:\\Users\\Aryant';
final regex = r'\\d+\\.\\d+';
print(path);   // C:\\Users\\Aryant (literal backslashes)

// String methods
final s = '  Hello, Dart!  ';
print(s.trim());           // 'Hello, Dart!'
print(s.toLowerCase());    // '  hello, dart!  '
print(s.toUpperCase());    // '  HELLO, DART!  '
print(s.contains('Dart')); // true
print(s.replaceAll('Dart', 'Flutter'));
print('a,b,c'.split(','));  // [a, b, c]

// String building
final sb = StringBuffer();
sb.write('Hello');
sb.write(', ');
sb.writeln('World!');    // adds newline
print(sb.toString());   // Hello, World!

// Padding
print('42'.padLeft(5));        // '   42'
print('hi'.padRight(6, '-'));  // 'hi----'
'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Basics'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 2. CONTROL FLOW
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_005'
      ..topicId = 'dart'
      ..title = 'If / Else & Switch'
      ..description = 'Standard conditionals plus Dart\'s exhaustive switch expressions (Dart 3+).'
      ..code = '''final temperature = 35;

// Standard if-else
if (temperature > 30) {
  print('Hot day!');
} else if (temperature >= 20) {
  print('Pleasant day');
} else {
  print('Cold day');
}

// Ternary
final weather = temperature > 30 ? 'Hot' : 'Cool';
print('Weather: \$weather');

// Traditional switch (statement)
final day = 3;
switch (day) {
  case 1:
    print('Monday');
    break;
  case 2:
    print('Tuesday');
    break;
  case 3:
  case 4:
    print('Mid-week');
    break;
  default:
    print('Weekend');
}

// Switch EXPRESSION (Dart 3+) — exhaustive, returns a value
final dayName = switch (day) {
  1 => 'Monday',
  2 => 'Tuesday',
  3 => 'Wednesday',
  4 || 5 => 'Thu or Fri',     // pattern: OR
  6 || 7 => 'Weekend',
  _ => 'Unknown'               // wildcard (else)
};
print(dayName);   // Wednesday

// Pattern matching in switch (Dart 3+)
Object value = 42;
final description = switch (value) {
  int n when n > 100 => 'big integer',
  int n => 'integer: \$n',
  String s => 'string: \$s',
  _ => 'other'
};
print(description);   // integer: 42'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Control Flow'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_006'
      ..topicId = 'dart'
      ..title = 'Loops'
      ..description = 'for, for-in, forEach, while, and do-while. Plus break, continue, and labeled loops.'
      ..code = '''// Traditional for loop
for (var i = 0; i < 5; i++) {
  print(i);  // 0 1 2 3 4
}

// for-in — iterate over any Iterable
final fruits = ['Apple', 'Banana', 'Cherry'];
for (final fruit in fruits) {
  print(fruit);
}

// forEach with lambda
fruits.forEach((fruit) => print(fruit));
// or with method tear-off:
fruits.forEach(print);

// Iterate with index using asMap()
fruits.asMap().forEach((i, fruit) {
  print('\$i: \$fruit');
});

// while loop
var count = 0;
while (count < 3) {
  print('Count: \$count');
  count++;
}

// do-while — always runs at least once
var attempts = 0;
do {
  print('Attempt \${++attempts}');
} while (attempts < 3);

// break and continue
for (var n = 1; n <= 10; n++) {
  if (n == 4) continue;   // skip 4
  if (n == 7) break;      // stop at 7
  print(n);               // 1 2 3 5 6
}

// Labeled break — exit outer loop from inner loop
outer:
for (var i = 0; i < 3; i++) {
  for (var j = 0; j < 3; j++) {
    if (j == 1) continue outer;  // skip to next i
    print('(\$i, \$j)');
  }
}'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Control Flow'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 3. FUNCTIONS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_007'
      ..topicId = 'dart'
      ..title = 'Function Basics'
      ..description = 'Named, anonymous, arrow functions. Named and optional parameters with defaults.'
      ..code = '''// Named function
String greet(String name) {
  return 'Hello, \$name!';
}
print(greet('Aryant'));   // Hello, Aryant!

// Arrow function — single expression
int square(int x) => x * x;
String upper(String s) => s.toUpperCase();

// Optional positional params — wrap in []
String greetFull(String name, [String title = 'Mr/Ms']) {
  return 'Hello, \$title \$name!';
}
print(greetFull('Aryant'));        // Hello, Mr/Ms Aryant!
print(greetFull('Aryant', 'Dr')); // Hello, Dr Aryant!

// Named params — wrap in {}
String createUser({
  required String name,           // required
  String role = 'user',           // optional with default
  bool isActive = true,
}) {
  return '[\${isActive ? "ACTIVE" : "INACTIVE"}] \$name (\$role)';
}

print(createUser(name: 'Aryant'));
// [ACTIVE] Aryant (user)
print(createUser(name: 'Admin', role: 'admin'));
// [ACTIVE] Admin (admin)

// Function as a value
int Function(int, int) add = (a, b) => a + b;
print(add(3, 4));   // 7

// Anonymous function (closure)
final multiply = (int a, int b) {
  return a * b;
};

// Passing functions as arguments
List<int> nums = [1, 2, 3, 4, 5];
final doubled = nums.map((n) => n * 2).toList();
final evens   = nums.where((n) => n.isEven).toList();

// Returning functions
Function multiplierOf(int factor) {
  return (int n) => n * factor;
}
final triple = multiplierOf(3);
print(triple(7));   // 21'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Functions'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_008'
      ..topicId = 'dart'
      ..title = 'Extension Methods'
      ..description = 'Add methods to existing types without subclassing. The same as Kotlin extension functions.'
      ..code = '''// Extend String
extension StringExtensions on String {
  bool get isPalindrome {
    final cleaned = toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
    return cleaned == cleaned.split('').reversed.join();
  }

  String get titleCase => split(' ')
      .map((w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1))
      .join(' ');

  String? get nullIfEmpty => isEmpty ? null : this;
}

print('racecar'.isPalindrome);    // true
print('hello world'.titleCase);   // Hello World
print(''.nullIfEmpty);            // null

// Extend int
extension IntExtensions on int {
  bool get isEven => this % 2 == 0;
  bool get isOdd  => this % 2 != 0;
  int  get factorial {
    if (this <= 1) return 1;
    return this * (this - 1).factorial;
  }
  Duration get seconds => Duration(seconds: this);
  Duration get milliseconds => Duration(milliseconds: this);
}

print(6.isEven);       // true
print(5.factorial);    // 120
await Future.delayed(2.seconds);  // clean API!

// Extend a custom class
class User {
  final String name;
  final int score;
  const User(this.name, this.score);
}

extension UserBadge on User {
  String get badge => switch (score) {
    >= 90 => '\$name 🏆 Gold',
    >= 70 => '\$name 🥈 Silver',
    _     => '\$name 🥉 Bronze',
  };
}

const user = User('Aryant', 92);
print(user.badge);   // Aryant 🏆 Gold

// Extension on nullable type
extension NullableString on String? {
  String orDefault([String fallback = 'N/A']) => this ?? fallback;
}

String? nullName;
print(nullName.orDefault());  // N/A'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Functions'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 4. COLLECTIONS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_009'
      ..topicId = 'dart'
      ..title = 'Lists'
      ..description = 'Ordered collection. List is growable by default. Use const [] for compile-time constants.'
      ..code = '''// Immutable list (compile-time constant)
const fruits = ['Apple', 'Banana', 'Cherry'];

// Growable list
final tasks = <String>['Code', 'Test', 'Deploy'];
tasks.add('Monitor');
tasks.addAll(['Review', 'Merge']);
tasks.insert(0, 'Plan');
tasks.remove('Test');
tasks.removeAt(0);
tasks.removeLast();

// Fixed-length list
final fixed = List<int>.filled(5, 0);   // [0, 0, 0, 0, 0]
final generated = List<int>.generate(5, (i) => i * i);  // [0,1,4,9,16]

// Access
print(fruits[0]);         // Apple
print(fruits.first);      // Apple
print(fruits.last);       // Cherry
print(fruits.length);     // 3

// Useful methods
final nums = [3, 1, 4, 1, 5, 9, 2, 6];
print(nums.contains(4));               // true
print(nums.indexOf(4));                // 2
print(nums.where((n) => n > 3).toList());  // [4, 5, 9, 6]
print(nums.map((n) => n * 2).toList());
print(nums.reduce((a, b) => a + b));   // 31
print(nums.fold(0, (acc, n) => acc + n)); // 31
print(nums.any((n) => n > 8));         // true
print(nums.every((n) => n > 0));       // true

// Sorting
final sorted = [...nums]..sort();      // copy then sort
final sortedDesc = [...nums]..sort((a, b) => b.compareTo(a));

// Spread operator
final a = [1, 2, 3];
final b = [4, 5, 6];
final combined = [...a, ...b];         // [1,2,3,4,5,6]
final withNull = [...a, ...?null];     // null-aware spread

// Collection if / for (Dart feature!)
final showExtra = true;
final items = [
  'always',
  if (showExtra) 'conditional',
  for (var i = 1; i <= 3; i++) 'item_\$i',
];
print(items);  // [always, conditional, item_1, item_2, item_3]'''
      ..language = 'dart'
      ..difficulty = 'very_easy'
      ..section = 'Collections'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_010'
      ..topicId = 'dart'
      ..title = 'Maps & Sets'
      ..description = 'Map for key-value pairs, Set for unique elements. Both support collection-if/for.'
      ..code = '''// Map — key-value store
final userRoles = <String, String>{
  'alice': 'admin',
  'bob':   'editor',
  'carol': 'viewer',
};

print(userRoles['alice']);                         // admin
print(userRoles['dave']);                          // null
print(userRoles['dave'] ?? 'guest');               // guest
print(userRoles.containsKey('alice'));             // true
print(userRoles.containsValue('admin'));           // true

// Modify
userRoles['dave'] = 'viewer';                     // add/update
userRoles.remove('carol');
userRoles.addAll({'eve': 'editor', 'frank': 'viewer'});

// Iteration
userRoles.forEach((key, value) => print('\$key → \$value'));
for (final entry in userRoles.entries) {
  print('\${entry.key}: \${entry.value}');
}

print(userRoles.keys.toList());
print(userRoles.values.toList());

// Map.fromIterables / fromEntries
final keys   = ['a', 'b', 'c'];
final values = [1, 2, 3];
final mapFromLists = Map.fromIterables(keys, values);

// Map transformation
final scores = {'Alice': 90, 'Bob': 75, 'Carol': 85};
final grades = scores.map((name, score) =>
  MapEntry(name, score >= 80 ? 'Pass' : 'Fail')
);

// ────── SET ──────
final ids = <int>{1, 2, 3, 2, 1};   // duplicates removed
print(ids);    // {1, 2, 3}

final mutable = {'Kotlin', 'Dart', 'Swift'};
mutable.add('Flutter');
mutable.remove('Swift');

// Set operations
final a = {1, 2, 3, 4};
final b = {3, 4, 5, 6};
print(a.union(b));        // {1, 2, 3, 4, 5, 6}
print(a.intersection(b)); // {3, 4}
print(a.difference(b));   // {1, 2}'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'Collections'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 5. OOP
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_011'
      ..topicId = 'dart'
      ..title = 'Classes & Constructors'
      ..description = 'Named, named-optional, factory, and const constructors. Initializer lists and redirecting constructors.'
      ..code = '''class User {
  final int id;
  String name;
  final String email;

  // Shorthand constructor — auto-assigns to fields
  User({required this.id, required this.name, required this.email}) {
    assert(name.isNotEmpty, 'Name cannot be blank');
    assert(email.contains('@'), 'Invalid email');
  }

  // Named constructor
  User.guest() : this(id: 0, name: 'Guest', email: 'guest@anon.com');

  // Factory constructor — can return existing instance
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id:    json['id'] as int,
      name:  json['name'] as String,
      email: json['email'] as String,
    );
  }

  // Computed property (getter)
  String get displayName => name.trim().isEmpty ? 'Anonymous' : name;

  // Setter with validation
  set nickname(String value) {
    if (value.length < 2) throw ArgumentError('Nickname too short');
    name = value;
  }

  // Instance method
  String greet() => 'Hi, I\\'m \$displayName (\$email)';

  // toString for readable debug output
  @override
  String toString() => 'User(id: \$id, name: \$name, email: \$email)';
}

// Const constructor — object is compile-time constant
class Point {
  final double x;
  final double y;

  const Point(this.x, this.y);

  double get distanceToOrigin => (x * x + y * y).toDouble();
}

const origin = Point(0, 0);   // compile-time constant!
const p1 = Point(3, 4);

final u1 = User(id: 1, name: 'Aryant', email: 'a@dev.com');
final u2 = User.guest();
final u3 = User.fromJson({'id': 2, 'name': 'Bob', 'email': 'b@x.com'});
print(u1.greet());     // Hi, I'm Aryant (a@dev.com)
print(u2.displayName); // Guest'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_012'
      ..topicId = 'dart'
      ..title = 'Inheritance & Mixins'
      ..description = 'Extend classes with extends, add capabilities with mixins, and define contracts with abstract classes.'
      ..code = '''// Abstract class — defines a contract
abstract class Animal {
  final String name;
  const Animal(this.name);

  // Abstract method — must be implemented
  String makeSound();

  // Concrete method — inherited as-is
  String breathe() => '\$name is breathing';

  @override
  String toString() => '\${runtimeType}(\$name)';
}

class Dog extends Animal {
  const Dog(String name) : super(name);

  @override
  String makeSound() => '\$name says: Woof!';

  String fetch() => '\$name fetches the ball!';
}

class Cat extends Animal {
  const Cat(String name) : super(name);

  @override
  String makeSound() => '\$name says: Meow...';
}

// Mixin — add capabilities without inheritance
mixin Flyable {
  String fly() => '\${(this as dynamic).name} is flying';
}

mixin Swimmable {
  String swim() => '\${(this as dynamic).name} is swimming';
}

// Duck gets BOTH mixins
class Duck extends Animal with Flyable, Swimmable {
  const Duck(String name) : super(name);

  @override
  String makeSound() => '\$name says: Quack!';
}

void main() {
  final animals = <Animal>[Dog('Rex'), Cat('Luna'), Duck('Donald')];
  for (final a in animals) {
    print(a.makeSound());    // polymorphism
  }

  final duck = Duck('Donald');
  print(duck.fly());         // Donald is flying
  print(duck.swim());        // Donald is swimming

  // Type checking
  print(duck is Animal);     // true
  print(duck is Flyable);    // true
  print(duck is Swimmable);  // true
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_013'
      ..topicId = 'dart'
      ..title = 'Sealed Classes (Dart 3+)'
      ..description = 'Sealed classes restrict subclassing to the same library — perfect for exhaustive switch.'
      ..code = '''// Sealed class — all subtypes must be in same library
sealed class NetworkResult<T> {}

class Loading<T> extends NetworkResult<T> {}

class Success<T> extends NetworkResult<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends NetworkResult<T> {
  final int? statusCode;
  final String message;
  const Failure({this.statusCode, required this.message});
}

// Exhaustive switch — compiler knows ALL cases
void handleResult(NetworkResult<List<String>> result) {
  switch (result) {
    case Loading():
      showProgressIndicator();
    case Success(:final data):           // destructuring!
      displayItems(data);
    case Failure(:final statusCode, :final message):
      showError('\$statusCode: \$message');
    // No default needed — compiler verifies exhaustiveness
  }
}

// UI State pattern
sealed class UiState<T> {}
class Idle<T>    extends UiState<T> {}
class Busy<T>    extends UiState<T> {}
class Data<T>    extends UiState<T> { final T value; const Data(this.value); }
class Err<T>     extends UiState<T> { final String reason; const Err(this.reason); }

// Pattern matching in expressions
String describe(UiState state) => switch (state) {
  Idle()   => 'Waiting...',
  Busy()   => 'Loading...',
  Data()   => 'Loaded!',
  Err(:final reason) => 'Error: \$reason',
};

// Use with switch expression for value extraction
UiState<int> s = Data(42);
final display = switch (s) {
  Data(:final value) => 'Value: \$value',
  Err(:final reason) => 'Error: \$reason',
  _ => 'Transitioning...',
};'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_014'
      ..topicId = 'dart'
      ..title = 'Interfaces & implements'
      ..description = 'Every class is implicitly an interface in Dart. Use implements to satisfy a contract without inheritance.'
      ..code = '''// Interface defined as abstract class
abstract interface class Logger {
  void log(String message);
  void debug(String message) => log('[DEBUG] \$message');
  void error(String message) => log('[ERROR] \$message');
}

abstract interface class Analytics {
  void track(String event, {Map<String, Object> properties = const {}});
}

// Implement multiple interfaces
class ConsoleLogger implements Logger {
  @override
  void log(String message) => print(message);
}

// Class can implement AND extend
class ProductionLogger extends Object implements Logger, Analytics {
  final String prefix;
  const ProductionLogger(this.prefix);

  @override
  void log(String message) => print('[\$prefix] \$message');

  @override
  void track(String event, {Map<String, Object> properties = const {}}) {
    print('[ANALYTICS] \$event: \$properties');
  }
}

// Implements makes the class satisfy the interface —
// but does NOT inherit implementation (unlike extends)
class MockLogger implements Logger {
  final List<String> logs = [];

  @override
  void log(String message) => logs.add(message);
}

// Usage: program to interfaces
class UserService {
  final Logger _logger;
  final Analytics _analytics;

  const UserService(this._logger, this._analytics);

  void createUser(String name) {
    _logger.log('Creating user: \$name');
    _logger.debug('Validation passed');
    _analytics.track('user_created', properties: {'name': name});
  }
}

// In tests — inject mock
final mockLogger = MockLogger();
final service = UserService(mockLogger, ProductionLogger('Test'));
service.createUser('Aryant');
print(mockLogger.logs);  // ['Creating user: Aryant', ...]'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 6. ASYNC / AWAIT
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_015'
      ..topicId = 'dart'
      ..title = 'Future & async/await'
      ..description = 'Future represents a value available in the future. async/await makes async code read like sync code.'
      ..code = '''import 'dart:async';

// async function returns a Future
Future<User> fetchUser(int id) async {
  await Future.delayed(const Duration(seconds: 1)); // simulate network
  return User(id: id, name: 'User_\$id', email: 'u\$id@dev.com');
}

// await unwraps the Future
Future<void> main() async {
  print('Fetching user...');
  final user = await fetchUser(1);   // non-blocking wait
  print('Got: \${user.name}');
}

// Error handling with async/await
Future<String> readFile(String path) async {
  try {
    final file = File(path);
    return await file.readAsString();
  } on FileSystemException catch (e) {
    print('File error: \${e.message}');
    return '';
  }
}

// Future.wait — run multiple futures concurrently
Future<void> loadDashboard() async {
  // All three start at the same time!
  final results = await Future.wait([
    fetchUser(1),
    fetchPosts(1),
    fetchNotifications(1),
  ]);
  final user  = results[0] as User;
  final posts = results[1] as List;
  print('Loaded \${posts.length} posts for \${user.name}');
}

// Future API (without async/await)
fetchUser(1)
  .then((user) => print(user.name))
  .catchError((e) => print('Error: \$e'))
  .whenComplete(() => print('Done'));

// Future.delayed — useful in tests / demos
Future.delayed(const Duration(seconds: 2), () => print('After 2s'));

// Compute — run heavy work in isolate (no UI jank)
import 'package:flutter/foundation.dart';
final sorted = await compute(_sortList, hugeList);

List<int> _sortList(List<int> list) => list..sort();'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Async / Await'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_016'
      ..topicId = 'dart'
      ..title = 'Streams'
      ..description = 'Stream is a sequence of async events. Like Flow in Kotlin. Single-subscription or broadcast.'
      ..code = '''import 'dart:async';

// Create a Stream with StreamController
Stream<int> countStream(int to) async* {
  for (var i = 1; i <= to; i++) {
    await Future.delayed(const Duration(milliseconds: 500));
    yield i;   // emit a value
  }
}

// Consume with await for
Future<void> main() async {
  await for (final n in countStream(5)) {
    print(n);   // 1, 2, 3, 4, 5 (one every 0.5s)
  }
}

// StreamController — manually push events
final controller = StreamController<String>();
final stream = controller.stream;

// Push events
controller.sink.add('Hello');
controller.sink.add('World');
controller.sink.close();

// Listen
stream.listen(
  (data) => print(data),
  onError: (e) => print('Error: \$e'),
  onDone: () => print('Stream closed'),
);

// Broadcast stream — multiple listeners
final broadcast = StreamController<String>.broadcast();
broadcast.stream.listen((d) => print('L1: \$d'));
broadcast.stream.listen((d) => print('L2: \$d'));
broadcast.sink.add('event');   // both listeners receive it

// Stream transformations
final numbers = Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8]);
numbers
  .where((n) => n.isEven)       // filter
  .map((n) => n * n)            // transform
  .take(3)                      // limit
  .listen(print);               // 4, 16, 36

// StreamBuilder in Flutter
StreamBuilder<User>(
  stream: userStream,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    }
    if (snapshot.hasError) return Text('Error: \${snapshot.error}');
    final user = snapshot.data!;
    return Text('Hello, \${user.name}!');
  },
)'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Async / Await'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 7. GENERICS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_017'
      ..topicId = 'dart'
      ..title = 'Generics'
      ..description = 'Write type-safe reusable code. Dart supports generic classes, functions, and bounded type parameters.'
      ..code = '''// Generic function
T first<T>(List<T> items) {
  if (items.isEmpty) throw StateError('List is empty');
  return items.first;
}

final str = first(['a', 'b', 'c']);   // String inferred
final num = first([1, 2, 3]);          // int inferred

// Generic class
class Stack<T> {
  final _items = <T>[];

  void push(T item) => _items.add(item);
  T pop() => _items.removeLast();
  T get peek => _items.last;
  bool get isEmpty => _items.isEmpty;
  int get size => _items.length;
}

final intStack = Stack<int>();
intStack.push(10);
intStack.push(20);
print(intStack.pop());   // 20

// Bounded type parameter
T biggest<T extends Comparable<T>>(T a, T b) => a.compareTo(b) >= 0 ? a : b;

print(biggest(10, 20));         // 20
print(biggest('apple', 'zap')); // zap

// Generic Result type
class Result<T> {
  final T? data;
  final String? error;

  const Result.success(T this.data) : error = null;
  const Result.failure(String this.error) : data = null;

  bool get isSuccess => error == null;

  R when<R>({required R Function(T) success, required R Function(String) failure}) {
    if (isSuccess) return success(data as T);
    return failure(error!);
  }
}

Result<User> getUser(int id) {
  try {
    return Result.success(fetchUserSync(id));
  } catch (e) {
    return Result.failure(e.toString());
  }
}

final result = getUser(1);
result.when(
  success: (user) => print('Got: \${user.name}'),
  failure: (err) => print('Error: \$err'),
);

// Covariance — List<String> is a subtype of List<Object> in Dart
List<String> strings = ['a', 'b'];
List<Object> objects = strings;   // ✅ works in Dart (covariant by default)'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Generics'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 8. FLUTTER — WIDGETS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_018'
      ..topicId = 'dart'
      ..title = 'StatelessWidget'
      ..description = 'Stateless widgets rebuild only when their input changes. Use for pure, display-only UI.'
      ..code = '''import 'package:flutter/material.dart';

// Stateless — no internal state, just renders from props
class ProfileCard extends StatelessWidget {
  final String name;
  final String role;
  final String? avatarUrl;
  final VoidCallback? onTap;

  const ProfileCard({
    super.key,
    required this.name,
    required this.role,
    this.avatarUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: avatarUrl != null
                    ? NetworkImage(avatarUrl!)
                    : null,
                child: avatarUrl == null
                    ? Text(name[0].toUpperCase())
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      role,
                      style: Theme.of(context).textTheme.bodySmall
                          ?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

// Usage
ProfileCard(
  name: 'Aryant',
  role: 'Flutter Developer',
  onTap: () => print('Tapped!'),
)'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'Flutter — Widgets'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_019'
      ..topicId = 'dart'
      ..title = 'StatefulWidget'
      ..description = 'Stateful widgets hold mutable state. setState() triggers a rebuild. Use for local UI state.'
      ..code = '''import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final int initialValue;
  const CounterWidget({super.key, this.initialValue = 0});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = widget.initialValue;  // access widget's props via widget.
  }

  @override
  void dispose() {
    // Clean up controllers, timers, subscriptions here
    super.dispose();
  }

  void _increment() => setState(() => _count++);
  void _decrement() => setState(() => _count--);
  void _reset()     => setState(() => _count = widget.initialValue);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '\$_count',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: _count > 0 ? _decrement : null,
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _reset,
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: _increment,
            ),
          ],
        ),
      ],
    );
  }
}'''
      ..language = 'dart'
      ..difficulty = 'easy'
      ..section = 'Flutter — Widgets'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_020'
      ..topicId = 'dart'
      ..title = 'ListView & Custom Scroll'
      ..description = 'ListView.builder for long lists (like RecyclerView). CustomScrollView for complex layouts.'
      ..code = '''import 'package:flutter/material.dart';

// ListView.builder — only renders visible items (efficient)
class UserListScreen extends StatelessWidget {
  final List<User> users;
  final void Function(User) onUserTap;

  const UserListScreen({
    super.key,
    required this.users,
    required this.onUserTap,
  });

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return const Center(child: Text('No users yet'));
    }

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          leading: CircleAvatar(child: Text(user.name[0])),
          title: Text(user.name),
          subtitle: Text(user.email),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => onUserTap(user),
        );
      },
    );
  }
}

// CustomScrollView — sliver-based for complex scrolling
CustomScrollView(
  slivers: [
    // Collapsing app bar with image
    SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('My App'),
        background: Image.network(headerUrl, fit: BoxFit.cover),
      ),
    ),

    // Sticky header
    SliverPersistentHeader(
      pinned: true,
      delegate: _SectionHeaderDelegate('Featured'),
    ),

    // Horizontal scroll section
    SliverToBoxAdapter(
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: featured.length,
          itemBuilder: (_, i) => FeaturedCard(featured[i]),
        ),
      ),
    ),

    // Main grid
    SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (ctx, i) => ProductCard(products[i]),
        childCount: products.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
    ),
  ],
)'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Flutter — Widgets'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 9. STATE MANAGEMENT
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_021'
      ..topicId = 'dart'
      ..title = 'Riverpod — Providers'
      ..description = 'Riverpod is a reactive caching and state management library. Providers replace ViewModels and repositories.'
      ..code = '''import 'package:flutter_riverpod/flutter_riverpod.dart';

// Simple value provider
final greetingProvider = Provider<String>((ref) => 'Hello, Dart!');

// StateProvider — simple mutable state (counter, theme toggle)
final counterProvider = StateProvider<int>((ref) => 0);

// FutureProvider — async data (API calls, DB reads)
final userProvider = FutureProvider.family<User, int>((ref, userId) async {
  final repo = ref.read(userRepositoryProvider);
  return repo.fetchUser(userId);
});

// StateNotifierProvider — complex state with logic
class UsersNotifier extends StateNotifier<AsyncValue<List<User>>> {
  final UserRepository _repo;

  UsersNotifier(this._repo) : super(const AsyncValue.loading()) {
    loadUsers();
  }

  Future<void> loadUsers() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repo.fetchAll());
  }

  Future<void> deleteUser(int id) async {
    await _repo.delete(id);
    state.whenData((users) {
      state = AsyncValue.data(users.where((u) => u.id != id).toList());
    });
  }
}

final usersProvider = StateNotifierProvider<UsersNotifier, AsyncValue<List<User>>>(
  (ref) => UsersNotifier(ref.read(userRepositoryProvider)),
);

// Using providers in widgets
class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersProvider);

    return usersAsync.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, _) => Text('Error: \$err'),
      data: (users) => ListView(
        children: users.map((u) => ListTile(title: Text(u.name))).toList(),
      ),
    );
  }
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'State Management'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_022'
      ..topicId = 'dart'
      ..title = 'Riverpod — Notifier (Riverpod 2+)'
      ..description = 'Notifier and AsyncNotifier are the modern way to manage state in Riverpod 2.x.'
      ..code = '''import 'package:flutter_riverpod/flutter_riverpod.dart';

// Notifier — synchronous state with logic
class CounterNotifier extends Notifier<int> {
  @override
  int build() => 0;   // initial state

  void increment() => state++;
  void decrement() => state--;
  void reset() => state = 0;
}

final counterProvider = NotifierProvider<CounterNotifier, int>(CounterNotifier.new);

// AsyncNotifier — async state (replaces StateNotifier + FutureProvider)
class UserListNotifier extends AsyncNotifier<List<User>> {
  @override
  Future<List<User>> build() async {
    // Runs when provider is first created
    return ref.read(userRepoProvider).fetchAll();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(userRepoProvider).fetchAll());
  }

  Future<void> addUser(UserCreate data) async {
    final newUser = await ref.read(userRepoProvider).create(data);
    state.whenData((users) {
      state = AsyncValue.data([...users, newUser]);
    });
  }

  Future<void> deleteUser(int id) async {
    await ref.read(userRepoProvider).delete(id);
    state.whenData((users) {
      state = AsyncValue.data(users.where((u) => u.id != id).toList());
    });
  }
}

final userListProvider =
    AsyncNotifierProvider<UserListNotifier, List<User>>(UserListNotifier.new);

// Using in a ConsumerWidget
class UserListScreen extends ConsumerWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(userListProvider);
    final notifier   = ref.read(userListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: notifier.refresh,
          ),
        ],
      ),
      body: usersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: \$e')),
        data: (users) => ListView.builder(
          itemCount: users.length,
          itemBuilder: (ctx, i) => UserTile(
            user: users[i],
            onDelete: () => notifier.deleteUser(users[i].id),
          ),
        ),
      ),
    );
  }
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'State Management'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 10. NETWORKING
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_023'
      ..topicId = 'dart'
      ..title = 'Dio HTTP Client'
      ..description = 'Dio is a powerful HTTP client for Dart with interceptors, timeouts, and FormData support.'
      ..code = '''import 'package:dio/dio.dart';

// Set up Dio instance (ideally in a provider)
final dio = Dio(BaseOptions(
  baseUrl: 'https://api.github.com',
  connectTimeout: const Duration(seconds: 30),
  receiveTimeout: const Duration(seconds: 30),
  headers: {
    'Accept': 'application/vnd.github+json',
    'Content-Type': 'application/json',
  },
));

// Add interceptors
dio.interceptors.add(
  InterceptorsWrapper(
    onRequest: (options, handler) {
      final token = storage.read('token');
      if (token != null) {
        options.headers['Authorization'] = 'Bearer \$token';
      }
      return handler.next(options);
    },
    onError: (DioException error, handler) {
      if (error.response?.statusCode == 401) {
        // Handle token refresh
        refreshToken().then((_) => handler.resolve(error.response!));
      }
      return handler.next(error);
    },
  ),
);

// GET request
Future<GithubUser> getUser(String username) async {
  final response = await dio.get('/users/\$username');
  return GithubUser.fromJson(response.data as Map<String, dynamic>);
}

// POST request
Future<Issue> createIssue(String repo, String title, String body) async {
  final response = await dio.post(
    '/repos/\$repo/issues',
    data: {'title': title, 'body': body},
  );
  return Issue.fromJson(response.data as Map<String, dynamic>);
}

// Error handling
Future<T?> safeGet<T>(String path, T Function(dynamic) fromJson) async {
  try {
    final response = await dio.get(path);
    return fromJson(response.data);
  } on DioException catch (e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        print('Timeout');
      case DioExceptionType.badResponse:
        print('HTTP \${e.response?.statusCode}: \${e.response?.statusMessage}');
      case DioExceptionType.connectionError:
        print('No internet connection');
      default:
        print('Error: \${e.message}');
    }
    return null;
  }
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Networking'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_024'
      ..topicId = 'dart'
      ..title = 'JSON Serialization'
      ..description = 'Use json_serializable + freezed for type-safe, boilerplate-free JSON models.'
      ..code = '''// With json_annotation + json_serializable
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';   // generated file

@JsonSerializable()
class User {
  final int id;
  final String name;

  @JsonKey(name: 'email_address')   // map different JSON key
  final String email;

  @JsonKey(defaultValue: true)      // default if key missing
  final bool isActive;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? sessionToken;       // excluded from JSON

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.isActive,
    this.sessionToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => _\$UserFromJson(json);
  Map<String, dynamic> toJson() => _\$UserToJson(this);
}

// With Freezed (recommended — adds copyWith, equality, pattern matching)
@freezed
class Product with _\$Product {
  const factory Product({
    required int id,
    required String name,
    required double price,
    @Default(true) bool inStock,
    @Default([]) List<String> tags,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _\$ProductFromJson(json);
}

// Usage
final json = {'id': 1, 'name': 'Keyboard', 'email_address': 'a@dev.com', 'is_active': true};
final user = User.fromJson(json);
print(user.name);               // Keyboard
print(user.toJson());           // {id: 1, name: Keyboard, ...}

// Generic API response wrapper
@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final bool success;
  final T data;
  final String? message;

  const ApiResponse({required this.success, required this.data, this.message});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _\$ApiResponseFromJson(json, fromJsonT);
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Networking'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 11. PERSISTENCE
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_025'
      ..topicId = 'dart'
      ..title = 'SharedPreferences & Hive'
      ..description = 'SharedPreferences for simple key-value data. Hive for fast, typed local storage.'
      ..code = '''import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ── SharedPreferences ──
class PrefsService {
  static const _themeKey       = 'theme';
  static const _authTokenKey   = 'auth_token';
  static const _onboardingKey  = 'onboarding_done';

  Future<void> setTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, theme);
  }

  Future<String> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeKey) ?? 'light';
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_authTokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authTokenKey);
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

// ── Hive (fast key-value DB for larger data) ──

// 1. Register adapters and open boxes at startup
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());   // generated
  await Hive.openBox<User>('users');
  await Hive.openBox('settings');
  runApp(const MyApp());
}

// 2. Use boxes
class UserCache {
  late final Box<User> _box;

  Future<void> init() async {
    _box = await Hive.openBox<User>('users');
  }

  Future<void> save(User user) => _box.put(user.id, user);

  User? get(int id) => _box.get(id);

  List<User> getAll() => _box.values.toList();

  Future<void> delete(int id) => _box.delete(id);

  // ValueListenable — auto-rebuilds Flutter widgets
  ValueListenable<Box<User>> get listenable => _box.listenable();
}

// In Flutter widget
ValueListenableBuilder<Box<User>>(
  valueListenable: userCache.listenable,
  builder: (context, box, _) {
    final users = box.values.toList();
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, i) => ListTile(title: Text(users[i].name)),
    );
  },
)'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Persistence'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'dart_026'
      ..topicId = 'dart'
      ..title = 'Drift (SQLite ORM)'
      ..description = 'Drift provides type-safe SQLite queries with reactive streams for auto-updating UI.'
      ..code = '''import 'package:drift/drift.dart';
import 'package:drift/native.dart';

// 1. Table definition
class Users extends Table {
  IntColumn    get id        => integer().autoIncrement()();
  TextColumn   get name      => text().withLength(min: 1, max: 100)();
  TextColumn   get email     => text().unique()();
  BoolColumn   get isActive  => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// 2. Database class
@DriftDatabase(tables: [Users])
class AppDatabase extends _\$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override int get schemaVersion => 1;

  // Type-safe queries
  Future<List<User>> getActiveUsers() =>
      (select(users)..where((u) => u.isActive.equals(true))).get();

  // Stream — auto-updates when data changes
  Stream<List<User>> watchAllUsers() => select(users).watch();

  Future<int> insertUser(UsersCompanion user) => into(users).insert(user);

  Future<bool> updateUser(User user) => update(users).replace(user);

  Future<int> deleteUser(int id) =>
      (delete(users)..where((u) => u.id.equals(id))).go();

  // Custom query
  Future<List<User>> searchUsers(String query) =>
      (select(users)..where((u) => u.name.like('%\$query%'))).get();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'app.db'));
    return NativeDatabase.createInBackground(file);
  });
}

// 3. Usage in provider
@riverpod
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}

// 4. Stream in widget
StreamBuilder<List<User>>(
  stream: db.watchAllUsers(),
  builder: (ctx, snapshot) {
    if (!snapshot.hasData) return const CircularProgressIndicator();
    return ListView(
      children: snapshot.data!.map((u) => ListTile(title: Text(u.name))).toList(),
    );
  },
)'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Persistence'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 12. FLUTTER — NAVIGATION
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_027'
      ..topicId = 'dart'
      ..title = 'GoRouter Navigation'
      ..description = 'GoRouter is the declarative router for Flutter. URL-based, supports deep links and nested routes.'
      ..code = '''import 'package:go_router/go_router.dart';

// 1. Define routes
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/users',
      builder: (context, state) => const UserListScreen(),
      routes: [
        // Nested route — /users/:id
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final userId = int.parse(state.pathParameters['id']!);
            return UserDetailScreen(userId: userId);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
  // Redirect — e.g. auth guard
  redirect: (context, state) {
    final isLoggedIn = AuthService.instance.isLoggedIn;
    final isLoginPage = state.matchedLocation == '/login';
    if (!isLoggedIn && !isLoginPage) return '/login';
    if (isLoggedIn && isLoginPage) return '/';
    return null;
  },
);

// 2. Attach to MaterialApp
MaterialApp.router(
  routerConfig: router,
);

// 3. Navigate
// Push
context.go('/users');                         // replace current
context.push('/users/42');                    // add to stack
context.goNamed('user-detail', pathParameters: {'id': '42'});

// Pop
context.pop();
context.pop({'result': 'success'});           // pop with result

// Pass and receive data
GoRoute(
  path: '/product/:id',
  builder: (context, state) {
    final id  = state.pathParameters['id'];
    final tab = state.uri.queryParameters['tab'] ?? 'info';
    return ProductScreen(productId: id!, tab: tab);
  },
)

// Navigate: /product/99?tab=reviews
context.go('/product/99', queryParameters: {'tab': 'reviews'});'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Flutter — Navigation'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 13. ERROR HANDLING
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_028'
      ..topicId = 'dart'
      ..title = 'try / catch & Custom Exceptions'
      ..description = 'Handle errors with try/catch/finally. Define domain exceptions for meaningful error messages.'
      ..code = '''// Basic try/catch/finally
Future<String> readFile(String path) async {
  try {
    final file = File(path);
    return await file.readAsString();
  } on FileSystemException catch (e) {
    print('File error: \${e.message}');
    return '';
  } on FormatException catch (e) {
    print('Format error: \${e.message}');
    return '';
  } catch (e, stackTrace) {
    // Catch ALL exceptions
    print('Unexpected: \$e');
    print(stackTrace);
    return '';
  } finally {
    print('readFile() completed');   // always runs
  }
}

// Custom exception hierarchy
sealed class AppException implements Exception {
  final String message;
  const AppException(this.message);

  @override
  String toString() => '\${runtimeType}: \$message';
}

class NetworkException extends AppException {
  final int? statusCode;
  const NetworkException(super.message, {this.statusCode});
}

class AuthException extends AppException {
  const AuthException([String message = 'Unauthorized']) : super(message);
}

class NotFoundException extends AppException {
  final String resource;
  const NotFoundException(this.resource, Object id)
      : super('\$resource with id=\$id not found');
}

class ValidationException extends AppException {
  final String field;
  const ValidationException(this.field, String message)
      : super('\$field: \$message');
}

// Using custom exceptions
Future<User> getUser(int id) async {
  if (id <= 0) throw ValidationException('id', 'must be positive');

  final response = await dio.get('/users/\$id').catchError((e) {
    if (e is DioException && e.response?.statusCode == 404) {
      throw NotFoundException('User', id);
    }
    throw NetworkException('Failed to fetch user', statusCode: e.response?.statusCode);
  });

  return User.fromJson(response.data as Map<String, dynamic>);
}

// Handle with switch expression (Dart 3+)
try {
  final user = await getUser(id);
  print(user.name);
} on AppException catch (e) {
  final message = switch (e) {
    AuthException()       => 'Please log in again',
    NotFoundException()   => 'User not found',
    NetworkException()    => 'Network error: \${e.statusCode}',
    ValidationException() => 'Invalid input: \${e.field}',
    _                     => 'Something went wrong',
  };
  showErrorSnackBar(message);
}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Error Handling'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 14. ISOLATES
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_029'
      ..topicId = 'dart'
      ..title = 'Isolates & compute()'
      ..description = 'Isolates are Dart\\\'s threads — separate memory, communicate by messages. Use compute() for heavy work.'
      ..code = '''import 'dart:isolate';
import 'package:flutter/foundation.dart';

// compute() — simplest way to offload CPU work to another isolate
// Function must be a top-level or static function
List<int> _heavySort(List<int> numbers) {
  return numbers..sort();
}

Future<List<int>> sortInBackground(List<int> data) async {
  return compute(_heavySort, data);
}

// Parse JSON in background (prevents UI jank on large payloads)
List<User> _parseUsers(String jsonStr) {
  final list = jsonDecode(jsonStr) as List;
  return list.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
}

Future<List<User>> fetchAndParseUsers() async {
  final response = await dio.get('/users');
  return compute(_parseUsers, response.data as String);
}

// Low-level Isolate — for long-running background tasks
Future<void> runIsolate() async {
  final receivePort = ReceivePort();

  // Spawn a new isolate
  await Isolate.spawn(backgroundTask, receivePort.sendPort);

  // Listen for messages from the isolate
  await for (final message in receivePort) {
    if (message is String) {
      print('Received: \$message');
    }
    if (message == 'done') {
      receivePort.close();
      break;
    }
  }
}

// This runs in a separate isolate
void backgroundTask(SendPort sendPort) {
  for (var i = 0; i < 5; i++) {
    sendPort.send('Progress: \$i');
  }
  sendPort.send('done');
}

// Isolate.run (Dart 2.19+) — simplest API for one-shot isolates
Future<List<User>> fetchUsersIsolated() async {
  return Isolate.run(() async {
    // Runs in a background isolate automatically
    final json = await File('users.json').readAsString();
    return _parseUsers(json);
  });
}'''
      ..language = 'dart'
      ..difficulty = 'hard'
      ..section = 'Isolates'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 15. TESTING
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'dart_030'
      ..topicId = 'dart'
      ..title = 'Unit & Widget Testing'
      ..description = 'Test pure Dart code with test package. Test Flutter widgets with flutter_test.'
      ..code = '''import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ── Unit Test ──
class Calculator {
  int add(int a, int b) => a + b;
  int divide(int a, int b) {
    if (b == 0) throw ArgumentError('Cannot divide by zero');
    return a ~/ b;
  }
}

void main() {
  group('Calculator', () {
    late Calculator calc;

    setUp(() {
      calc = Calculator();   // runs before each test
    });

    test('add returns correct sum', () {
      expect(calc.add(2, 3), equals(5));
      expect(calc.add(-1, 1), equals(0));
    });

    test('divide throws on zero', () {
      expect(() => calc.divide(10, 0), throwsArgumentError);
    });

    test('divide returns integer result', () {
      expect(calc.divide(10, 3), equals(3));
    });
  });

  // ── Mock with mocktail ──
  group('UserViewModel', () {
    late MockUserRepository mockRepo;
    late UserViewModel viewModel;

    setUp(() {
      mockRepo = MockUserRepository();
      viewModel = UserViewModel(mockRepo);
    });

    test('loadUsers — sets state to data on success', () async {
      final fakeUsers = [User(id: 1, name: 'Alice', email: 'a@x.com')];
      when(() => mockRepo.fetchAll()).thenAnswer((_) async => fakeUsers);

      await viewModel.loadUsers();

      expect(viewModel.state, isA<AsyncData<List<User>>>());
      expect(viewModel.state.value, fakeUsers);
      verify(() => mockRepo.fetchAll()).called(1);
    });
  });

  // ── Widget Test ──
  testWidgets('ProfileCard shows name and role', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProfileCard(name: 'Aryant', role: 'Developer'),
      ),
    );

    expect(find.text('Aryant'), findsOneWidget);
    expect(find.text('Developer'), findsOneWidget);

    // Tap and verify
    await tester.tap(find.byType(ProfileCard));
    await tester.pump();  // trigger rebuild
  });
}

class MockUserRepository extends Mock implements UserRepository {}'''
      ..language = 'dart'
      ..difficulty = 'medium'
      ..section = 'Testing'
      ..isSaved = false
      ..lastViewedAt = null,

  ];
}
