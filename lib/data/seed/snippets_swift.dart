import '../models/snippet.dart';

List<Snippet> getSwiftSnippets() {
  return [
    Snippet()..snippetId='swift_001'..topicId='swift'..title='Hello World'..description='Swift programs can run as scripts or with a main entry point. print() outputs to console.'..code='''print("Hello, World!")

let name = "Swift"
var version = 5
print("\\(name) \\(version)")'''..language='swift'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_002'..topicId='swift'..title='Variables and Constants'..description='Use let for constants and var for variables. Swift is type-safe with type inference.'..code='''let name: String = "Swift"
var age: Int = 10
let pi = 3.14159           // inferred Double
var active = true          // inferred Bool
let emoji: Character = "S"

var optional: String? = nil  // Optional
optional = "hello"
print(optional ?? "default")

let (x, y) = (10, 20)     // tuple destructuring
print("\\(name) \\(age) \\(pi) \\(x),\\(y)")'''..language='swift'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_003'..topicId='swift'..title='Control Flow'..description='Swift supports if-else, guard, switch with pattern matching, for-in, while, and repeat-while loops.'..code='''let score = 85

// If-else
if score >= 90 { print("A") }
else if score >= 80 { print("B") }
else { print("C") }

// Guard
func validate(age: Int?) {
    guard let age = age, age >= 0 else {
        print("Invalid"); return
    }
    print("Age: \\(age)")
}
validate(age: 25)

// Switch with ranges
switch score {
case 90...100: print("Excellent")
case 80..<90:  print("Good")
default:       print("OK")
}

// For-in
for i in 1...5 { print(i, terminator: " ") }
print()'''..language='swift'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_004'..topicId='swift'..title='Functions'..description='Swift functions support argument labels, default values, variadic params, and multiple return values.'..code='''func greet(_ name: String, with greeting: String = "Hello") -> String {
    return "\\(greeting), \\(name)!"
}

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    guard !array.isEmpty else { return nil }
    return (array.min()!, array.max()!)
}

func sum(_ numbers: Int...) -> Int {
    return numbers.reduce(0, +)
}

// Closures
let double = { (n: Int) -> Int in n * 2 }
let sorted = [3, 1, 4, 1, 5].sorted { \$0 > \$1 }

print(greet("Swift"))
print(greet("World", with: "Hi"))
if let result = minMax(array: [3, 1, 4, 1, 5]) {
    print("Min: \\(result.min), Max: \\(result.max)")
}
print(sum(1, 2, 3, 4, 5))
print(sorted)'''..language='swift'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_005'..topicId='swift'..title='Optionals'..description='Optionals handle the absence of a value. Use if-let, guard-let, optional chaining, and nil coalescing.'..code='''var name: String? = "Alice"

// Optional binding
if let unwrapped = name {
    print("Name: \\(unwrapped)")
}

// Guard let
func greet(name: String?) {
    guard let name = name else {
        print("No name"); return
    }
    print("Hello, \\(name)")
}

// Nil coalescing
let displayName = name ?? "Anonymous"
print(displayName)

// Optional chaining
let length = name?.count
print("Length: \\(length ?? 0)")

// Forced unwrap (use carefully!)
// let forced = name!

// Map on optionals
let upper = name.map { \$0.uppercased() }
print(upper ?? "nil")'''..language='swift'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_006'..topicId='swift'..title='Arrays and Dictionaries'..description='Swift collections are generic and type-safe. Arrays, Dictionaries, and Sets have rich APIs.'..code='''var fruits = ["Apple", "Banana", "Cherry"]
fruits.append("Date")
fruits.insert("Avocado", at: 1)
let sorted = fruits.sorted()
print(sorted)

// Dictionary
var scores: [String: Int] = ["Alice": 95, "Bob": 87]
scores["Charlie"] = 92
for (name, score) in scores {
    print("\\(name): \\(score)")
}

// Set
var colors: Set<String> = ["Red", "Green", "Blue"]
colors.insert("Yellow")
let more: Set = ["Blue", "Purple"]
print("Union:", colors.union(more))
print("Intersect:", colors.intersection(more))

// Higher-order
let doubled = [1, 2, 3, 4, 5].map { \$0 * 2 }
let evens = [1, 2, 3, 4, 5].filter { \$0 % 2 == 0 }
let sum = [1, 2, 3, 4, 5].reduce(0, +)
print(doubled, evens, sum)'''..language='swift'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_007'..topicId='swift'..title='Structs and Classes'..description='Structs are value types (copied). Classes are reference types (shared). Structs are preferred in Swift.'..code='''struct Point {
    var x: Double
    var y: Double
    func distance(to other: Point) -> Double {
        let dx = x - other.x
        let dy = y - other.y
        return (dx*dx + dy*dy).squareRoot()
    }
    mutating func translate(dx: Double, dy: Double) {
        x += dx; y += dy
    }
}

class Vehicle {
    let make: String
    var speed: Double = 0
    init(make: String) { self.make = make }
    func accelerate(by amount: Double) { speed += amount }
}

var p1 = Point(x: 0, y: 0)
var p2 = p1  // Copy!
p2.translate(dx: 3, dy: 4)
print("p1:", p1.x, p1.y)  // unchanged
print("Distance:", p1.distance(to: p2))

let car = Vehicle(make: "Tesla")
car.accelerate(by: 60)
print("\\(car.make): \\(car.speed) mph")'''..language='swift'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_008'..topicId='swift'..title='Enums with Associated Values'..description='Swift enums can carry associated values, computed properties, and methods. Powerful with pattern matching.'..code='''enum NetworkResult {
    case success(data: Data, statusCode: Int)
    case failure(error: String, retryable: Bool)
    case loading(progress: Double)
}

extension NetworkResult {
    var isSuccess: Bool {
        if case .success = self { return true }
        return false
    }
    var statusMessage: String {
        switch self {
        case .success(_, let code): return "OK (\\(code))"
        case .failure(let err, _): return "Error: \\(err)"
        case .loading(let p): return "Loading \\(Int(p*100))%"
        }
    }
}

let result = NetworkResult.success(data: Data(), statusCode: 200)
print(result.statusMessage)

if case .success(let data, let code) = result {
    print("Got \\(data.count) bytes, status \\(code)")
}'''..language='swift'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_009'..topicId='swift'..title='String Manipulation'..description='Swift strings are Unicode-correct with rich APIs for searching, transforming, and iterating.'..code='''let s = "Hello, World!"
print(s.count)
print(s.uppercased())
print(s.contains("World"))
print(s.hasPrefix("Hello"))
print(s.replacingOccurrences(of: "World", with: "Swift"))

// Substring
let start = s.index(s.startIndex, offsetBy: 7)
let end = s.index(s.endIndex, offsetBy: -1)
let sub = s[start..<end]
print(sub)  // World

// Split and join
let parts = "a,b,c,d".split(separator: ",")
let joined = parts.joined(separator: " - ")
print(joined)

// String interpolation
let name = "Swift"
let version = 5.9
let msg = "\\(name) \\(version) released"
print(msg)

// Character iteration
for char in "Hello" { print(char, terminator: " ") }
print()'''..language='swift'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_010'..topicId='swift'..title='Error Handling'..description='Swift uses throws/try/catch for error handling with typed errors and do-catch blocks.'..code='''enum AppError: Error {
    case notFound(String)
    case validation(field: String, message: String)
    case network(code: Int)
}

func findUser(id: Int) throws -> String {
    guard id > 0 else {
        throw AppError.validation(field: "id", message: "Must be positive")
    }
    guard id != 999 else {
        throw AppError.notFound("User \\(id)")
    }
    return "User_\\(id)"
}

do {
    let user = try findUser(id: 1)
    print("Found: \\(user)")
} catch AppError.notFound(let name) {
    print("Not found: \\(name)")
} catch AppError.validation(let field, let msg) {
    print("\\(field): \\(msg)")
} catch {
    print("Error: \\(error)")
}

// try? returns optional
let maybe = try? findUser(id: 999)
print(maybe ?? "nil")'''..language='swift'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_011'..topicId='swift'..title='Protocols'..description='Protocols define contracts. Types conform to protocols. Protocol extensions provide default implementations.'..code='''protocol Drawable {
    func draw() -> String
    var area: Double { get }
}

protocol CustomStringConvertible {
    var description: String { get }
}

struct Circle: Drawable {
    let radius: Double
    func draw() -> String { "Circle(r=\\(radius))" }
    var area: Double { .pi * radius * radius }
}

struct Rectangle: Drawable {
    let width, height: Double
    func draw() -> String { "Rect(\\(width)x\\(height))" }
    var area: Double { width * height }
}

extension Drawable {
    func describe() -> String {
        "\\(draw()) area=\\(String(format: "%.2f", area))"
    }
}

let shapes: [Drawable] = [Circle(radius: 5), Rectangle(width: 4, height: 6)]
shapes.forEach { print(\$0.describe()) }'''..language='swift'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_012'..topicId='swift'..title='Generics'..description='Swift generics enable type-safe reusable code with type constraints and associated types.'..code='''func findMax<T: Comparable>(_ array: [T]) -> T? {
    guard !array.isEmpty else { return nil }
    return array.max()
}

struct Stack<Element> {
    private var items: [Element] = []
    mutating func push(_ item: Element) { items.append(item) }
    mutating func pop() -> Element? { items.popLast() }
    var peek: Element? { items.last }
    var count: Int { items.count }
    var isEmpty: Bool { items.isEmpty }
}

// Generic with constraint
func sorted<T: Comparable>(_ array: [T]) -> [T] {
    array.sorted()
}

var stack = Stack<Int>()
stack.push(1); stack.push(2); stack.push(3)
print("Pop:", stack.pop() ?? 0)
print("Peek:", stack.peek ?? 0)

print(findMax([3, 1, 4, 1, 5]) ?? 0)
print(sorted(["cherry", "apple", "banana"]))'''..language='swift'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_013'..topicId='swift'..title='Closures and Higher-Order Functions'..description='Closures are self-contained blocks of functionality. They capture and store references to variables.'..code='''// Trailing closure syntax
let numbers = [5, 3, 8, 1, 9, 2]
let sorted = numbers.sorted { \$0 < \$1 }
let doubled = numbers.map { \$0 * 2 }
let evens = numbers.filter { \$0 % 2 == 0 }
let sum = numbers.reduce(0) { \$0 + \$1 }

print("Sorted:", sorted)
print("Doubled:", doubled)
print("Sum:", sum)

// Capturing values
func makeCounter() -> () -> Int {
    var count = 0
    return {
        count += 1
        return count
    }
}

let counter = makeCounter()
print(counter())  // 1
print(counter())  // 2

// Escaping closures
func delayed(_ action: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        action()
    }
}'''..language='swift'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_014'..topicId='swift'..title='Extensions'..description='Extensions add new functionality to existing types including computed properties, methods, and conformance.'..code='''extension Int {
    var isEven: Bool { self % 2 == 0 }
    var squared: Int { self * self }
    func times(_ action: (Int) -> Void) {
        for i in 0..<self { action(i) }
    }
}

extension String {
    var isEmail: Bool {
        contains("@") && contains(".")
    }
    func truncated(to length: Int) -> String {
        count <= length ? self : String(prefix(length)) + "..."
    }
}

extension Array where Element: Numeric {
    var sum: Element { reduce(0, +) }
}

print(42.isEven)           // true
print(5.squared)           // 25
3.times { print("Go \\(\$0)") }
print("test@mail.com".isEmail)
print("Hello World".truncated(to: 5))
print([1, 2, 3, 4, 5].sum)'''..language='swift'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_015'..topicId='swift'..title='Property Wrappers'..description='Property wrappers encapsulate property access patterns like clamping, validation, or lazy init.'..code='''@propertyWrapper
struct Clamped {
    var wrappedValue: Int {
        didSet { wrappedValue = min(max(wrappedValue, range.lowerBound), range.upperBound) }
    }
    let range: ClosedRange<Int>
    init(wrappedValue: Int, _ range: ClosedRange<Int>) {
        self.range = range
        self.wrappedValue = min(max(wrappedValue, range.lowerBound), range.upperBound)
    }
}

@propertyWrapper
struct Trimmed {
    private var value = ""
    var wrappedValue: String {
        get { value }
        set { value = newValue.trimmingCharacters(in: .whitespaces) }
    }
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}

struct Player {
    @Clamped(0...100) var health = 100
    @Trimmed var name: String
}

var player = Player(name: "  Alice  ")
print(player.name)     // "Alice"
player.health = 150
print(player.health)   // 100
player.health = -10
print(player.health)   // 0'''..language='swift'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_016'..topicId='swift'..title='Async/Await and Structured Concurrency'..description='Swift async/await provides structured concurrency with async let, TaskGroup, and actors.'..code='''func fetchUser(id: Int) async throws -> String {
    try await Task.sleep(nanoseconds: 100_000_000)
    return "User_\\(id)"
}

func fetchOrders(userId: String) async -> [String] {
    return ["Order-1", "Order-2"]
}

// Sequential
func loadProfile() async throws {
    let user = try await fetchUser(id: 1)
    let orders = await fetchOrders(userId: user)
    print("\\(user): \\(orders)")
}

// Parallel with async let
func loadDashboard() async throws {
    async let user1 = fetchUser(id: 1)
    async let user2 = fetchUser(id: 2)
    let users = try await [user1, user2]
    print("Users:", users)
}

// TaskGroup
func fetchMultiple(ids: [Int]) async throws -> [String] {
    try await withThrowingTaskGroup(of: String.self) { group in
        for id in ids {
            group.addTask { try await fetchUser(id: id) }
        }
        var results: [String] = []
        for try await result in group {
            results.append(result)
        }
        return results
    }
}'''..language='swift'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_017'..topicId='swift'..title='Result Type'..description='Result type encapsulates success or failure. Combine with map, flatMap for functional error handling.'..code='''enum APIError: Error {
    case notFound, serverError(Int), invalidData
}

func fetchData(from url: String) -> Result<String, APIError> {
    if url.isEmpty { return .failure(.notFound) }
    return .success("data from \\(url)")
}

// Map and flatMap
let result = fetchData(from: "https://api.test.com")
    .map { \$0.uppercased() }
    .flatMap { data -> Result<Int, APIError> in
        guard let count = Int(data.count.description) else {
            return .failure(.invalidData)
        }
        return .success(count)
    }

switch result {
case .success(let value): print("Count: \\(value)")
case .failure(let error): print("Error: \\(error)")
}

// Convert to optional
let optionalData = try? fetchData(from: "test").get()
print(optionalData ?? "nil")'''..language='swift'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_018'..topicId='swift'..title='Codable'..description='Codable protocol enables automatic JSON encoding and decoding with customizable key mappings.'..code='''struct User: Codable {
    let id: Int
    let name: String
    let email: String
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id, name, email
        case createdAt = "created_at"
    }
}

// Encode
let user = User(id: 1, name: "Alice", email: "a@b.com", createdAt: Date())
let encoder = JSONEncoder()
encoder.dateEncodingStrategy = .iso8601
encoder.outputFormatting = .prettyPrinted
let data = try! encoder.encode(user)
print(String(data: data, encoding: .utf8)!)

// Decode
let json = """
{"id": 2, "name": "Bob", "email": "b@c.com", "created_at": "2024-01-01T00:00:00Z"}
""".data(using: .utf8)!

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601
let decoded = try! decoder.decode(User.self, from: json)
print(decoded.name, decoded.createdAt)'''..language='swift'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_019'..topicId='swift'..title='Memory Management (ARC)'..description='Swift uses Automatic Reference Counting. Use weak and unowned to break retain cycles.'..code='''class Person {
    let name: String
    var apartment: Apartment?
    init(name: String) {
        self.name = name
        print("\\(name) init")
    }
    deinit { print("\\(name) deinit") }
}

class Apartment {
    let unit: String
    weak var tenant: Person?  // weak to break cycle
    init(unit: String) { self.unit = unit }
    deinit { print("Apt \\(unit) deinit") }
}

// No retain cycle due to weak
var alice: Person? = Person(name: "Alice")
var apt: Apartment? = Apartment(unit: "4A")
alice?.apartment = apt
apt?.tenant = alice
alice = nil  // Alice deinit called
apt = nil    // Apt deinit called

// Closure capture list
class Timer {
    var tick = 0
    lazy var increment: () -> Void = { [weak self] in
        self?.tick += 1
    }
}'''..language='swift'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_020'..topicId='swift'..title='KeyPaths'..description='KeyPaths provide type-safe references to properties for dynamic access without reflection.'..code='''struct Person {
    var name: String
    var age: Int
    var address: Address
}

struct Address {
    var city: String
    var zip: String
}

// Using keypaths
let nameKeyPath = \\Person.name
let cityKeyPath = \\Person.address.city

var person = Person(name: "Alice", age: 30,
                    address: Address(city: "NYC", zip: "10001"))

print(person[keyPath: nameKeyPath])
print(person[keyPath: cityKeyPath])
person[keyPath: nameKeyPath] = "Bob"

// Sort by keypath
func sortBy<T, V: Comparable>(_ keyPath: KeyPath<T, V>) -> (T, T) -> Bool {
    return { \$0[keyPath: keyPath] < \$1[keyPath: keyPath] }
}

let people = [
    Person(name: "Charlie", age: 25, address: Address(city: "LA", zip: "")),
    Person(name: "Alice", age: 30, address: Address(city: "NYC", zip: "")),
]
let sorted = people.sorted(by: sortBy(\\.name))
print(sorted.map { \$0.name })'''..language='swift'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_021'..topicId='swift'..title='Actors'..description='Actors provide data-race safety by isolating mutable state and serializing access.'..code='''actor BankAccount {
    let id: String
    private(set) var balance: Double

    init(id: String, balance: Double) {
        self.id = id
        self.balance = balance
    }

    func deposit(_ amount: Double) {
        balance += amount
    }

    func withdraw(_ amount: Double) throws -> Double {
        guard balance >= amount else {
            throw BankError.insufficientFunds
        }
        balance -= amount
        return amount
    }
}

enum BankError: Error { case insufficientFunds }

// Usage
func main() async {
    let account = BankAccount(id: "001", balance: 1000)
    await account.deposit(500)
    let balance = await account.balance
    print("Balance: \\(balance)")

    do {
        let withdrawn = try await account.withdraw(200)
        print("Withdrew: \\(withdrawn)")
    } catch {
        print("Error: \\(error)")
    }
}'''..language='swift'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_022'..topicId='swift'..title='Opaque Types (some)'..description='Opaque return types hide concrete types behind protocols while preserving type identity.'..code='''protocol Shape {
    func area() -> Double
    func describe() -> String
}

struct Circle: Shape {
    let radius: Double
    func area() -> Double { .pi * radius * radius }
    func describe() -> String { "Circle(r=\\(radius))" }
}

struct Square: Shape {
    let side: Double
    func area() -> Double { side * side }
    func describe() -> String { "Square(s=\\(side))" }
}

// Opaque return type
func makeShape(round: Bool) -> some Shape {
    if round {
        return Circle(radius: 5)
    } else {
        return Square(side: 4)
    }
}

// With primary associated types (Swift 5.7+)
func doubled(_ shape: some Shape) -> String {
    "\\(shape.describe()) x2 = \\(shape.area() * 2)"
}

let s = makeShape(round: true)
print(s.describe())
print("Area:", s.area())'''..language='swift'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_023'..topicId='swift'..title='Result Builders'..description='Result builders enable DSL-like syntax for building complex values declaratively.'..code='''@resultBuilder
struct HTMLBuilder {
    static func buildBlock(_ components: String...) -> String {
        components.joined(separator: "\\n")
    }
    static func buildOptional(_ component: String?) -> String {
        component ?? ""
    }
    static func buildEither(first: String) -> String { first }
    static func buildEither(second: String) -> String { second }
}

func tag(_ name: String, @HTMLBuilder content: () -> String) -> String {
    "<\\(name)>\\n\\(content())\\n</\\(name)>"
}

func div(@HTMLBuilder content: () -> String) -> String {
    tag("div", content: content)
}

func p(_ text: String) -> String { "<p>\\(text)</p>" }
func h1(_ text: String) -> String { "<h1>\\(text)</h1>" }

let html = div {
    h1("Hello")
    p("Welcome to Swift")
    p("Result builders are powerful")
}
print(html)'''..language='swift'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_024'..topicId='swift'..title='Protocol-Oriented Programming'..description='Swift favors protocols over inheritance. Protocol extensions provide shared default implementations.'..code='''protocol Identifiable {
    associatedtype ID: Hashable
    var id: ID { get }
}

protocol Timestamped {
    var createdAt: Date { get }
    var updatedAt: Date { get }
}

protocol Model: Identifiable, Timestamped, Codable {
    static var entityName: String { get }
}

extension Model {
    static var entityName: String { String(describing: Self.self) }
}

struct User: Model {
    let id: UUID
    var name: String
    let createdAt: Date
    var updatedAt: Date
}

struct Post: Model {
    let id: Int
    var title: String
    let createdAt: Date
    var updatedAt: Date
}

// Generic repository
protocol Repository {
    associatedtype Entity: Model
    func find(id: Entity.ID) -> Entity?
    func save(_ entity: Entity) throws
}

print(User.entityName)  // "User"
print(Post.entityName)  // "Post"'''..language='swift'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_025'..topicId='swift'..title='Combine Framework'..description='Combine provides declarative reactive programming with Publishers, Subscribers, and Operators.'..code='''import Combine

// Publisher and subscriber
let publisher = [1, 2, 3, 4, 5].publisher
let subscription = publisher
    .filter { \$0 % 2 == 0 }
    .map { \$0 * 10 }
    .sink { print("Value: \\(\$0)") }

// Subject
let subject = PassthroughSubject<String, Never>()
let sub = subject
    .map { \$0.uppercased() }
    .sink { print("Got: \\(\$0)") }
subject.send("hello")
subject.send("world")

// CurrentValueSubject
let current = CurrentValueSubject<Int, Never>(0)
let sub2 = current.sink { print("Current: \\(\$0)") }
current.send(1)
current.send(2)
print("Latest:", current.value)

// Future
func asyncOperation() -> Future<String, Error> {
    Future { promise in
        DispatchQueue.global().async {
            promise(.success("Done!"))
        }
    }
}'''..language='swift'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_026'..topicId='swift'..title='Existential Types'..description='any keyword makes protocol types explicit. Primary associated types constrain existential containers.'..code='''protocol Collection {
    associatedtype Element
    var count: Int { get }
    func element(at index: Int) -> Element
}

// any for existential types (Swift 5.6+)
func processItems(_ items: any Collection) {
    print("Count: \\(items.count)")
}

// Constrained existential (Swift 5.7+)
protocol Container<Element> {
    associatedtype Element
    var items: [Element] { get }
}

struct IntBox: Container {
    var items: [Int]
}

struct StringBox: Container {
    var items: [String]
}

func printContainer(_ c: any Container<Int>) {
    print("Ints:", c.items)
}

let box = IntBox(items: [1, 2, 3])
printContainer(box)'''..language='swift'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_027'..topicId='swift'..title='Macros (Swift 5.9)'..description='Swift macros generate code at compile time. Freestanding and attached macros reduce boilerplate.'..code='''// Freestanding expression macro
// #stringify generates tuple of (value, code-string)
let (result, code) = #stringify(2 + 3)
// result = 5, code = "2 + 3"

// @Observable macro (Swift 5.9)
import Observation

@Observable
class UserModel {
    var name: String = ""
    var age: Int = 0
    var email: String = ""

    var isValid: Bool {
        !name.isEmpty && age > 0 && email.contains("@")
    }
}

// @Model macro (SwiftData)
// @Model
class Item {
    var name: String
    var timestamp: Date
    var isComplete: Bool

    init(name: String) {
        self.name = name
        self.timestamp = Date()
        self.isComplete = false
    }
}

let user = UserModel()
user.name = "Alice"
user.age = 30
print(user.isValid)'''..language='swift'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_028'..topicId='swift'..title='Dependency Injection'..description='Protocol-based DI for testable and modular Swift code with property wrapper injection.'..code='''protocol NetworkService {
    func fetch(url: String) async throws -> Data
}

protocol StorageService {
    func save(key: String, data: Data) throws
    func load(key: String) throws -> Data?
}

class RealNetwork: NetworkService {
    func fetch(url: String) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
        return data
    }
}

class MockNetwork: NetworkService {
    func fetch(url: String) async throws -> Data {
        return "mock data".data(using: .utf8)!
    }
}

class UserRepository {
    private let network: NetworkService
    private let storage: StorageService

    init(network: NetworkService, storage: StorageService) {
        self.network = network
        self.storage = storage
    }

    func getUser(id: Int) async throws -> Data {
        if let cached = try? storage.load(key: "user_\\(id)") {
            return cached
        }
        return try await network.fetch(url: "/users/\\(id)")
    }
}'''..language='swift'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_029'..topicId='swift'..title='Distributed Actors'..description='Distributed actors enable transparent remote communication with location-independent code.'..code='''// Distributed actor system (Swift 5.7+)
// distributed actor ChatRoom {
//     distributed func sendMessage(_ text: String) async throws
// }

// Local actor simulation
actor ChatRoom {
    private var messages: [(user: String, text: String)] = []
    private var users: Set<String> = []

    func join(user: String) {
        users.insert(user)
        messages.append((user: "System", text: "\\(user) joined"))
    }

    func leave(user: String) {
        users.remove(user)
        messages.append((user: "System", text: "\\(user) left"))
    }

    func send(from user: String, text: String) {
        messages.append((user: user, text: text))
    }

    func recentMessages(count: Int) -> [(user: String, text: String)] {
        Array(messages.suffix(count))
    }
}

func demo() async {
    let room = ChatRoom()
    await room.join(user: "Alice")
    await room.send(from: "Alice", text: "Hello!")
    let msgs = await room.recentMessages(count: 5)
    msgs.forEach { print("\\(\$0.user): \\(\$0.text)") }
}'''..language='swift'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_030'..topicId='swift'..title='Advanced Pattern Matching'..description='Swift pattern matching with where clauses, tuple patterns, enum case patterns, and custom operators.'..code='''enum Expr {
    case num(Double)
    case add(Expr, Expr)
    case mul(Expr, Expr)
    case neg(Expr)
}

func evaluate(_ expr: Expr) -> Double {
    switch expr {
    case .num(let n): return n
    case .add(let a, let b): return evaluate(a) + evaluate(b)
    case .mul(let a, let b): return evaluate(a) * evaluate(b)
    case .neg(let e): return -evaluate(e)
    }
}

func simplify(_ expr: Expr) -> Expr {
    switch expr {
    case .add(.num(0), let e), .add(let e, .num(0)):
        return simplify(e)
    case .mul(.num(1), let e), .mul(let e, .num(1)):
        return simplify(e)
    case .mul(.num(0), _), .mul(_, .num(0)):
        return .num(0)
    case .neg(.neg(let e)):
        return simplify(e)
    default:
        return expr
    }
}

let expr = Expr.add(.mul(.num(2), .num(3)), .neg(.neg(.num(4))))
print("Result:", evaluate(expr))
let simplified = simplify(.add(.num(0), .mul(.num(1), .num(5))))
print("Simplified:", evaluate(simplified))'''..language='swift'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_031'..topicId='swift'..title='Custom Operators'..description='Define custom operators with precedence groups for domain-specific syntax and mathematical notation.'..code='''// Custom operator for pipe/chain
precedencegroup PipePrecedence {
    associativity: left
    lowerThan: AdditionPrecedence
}
infix operator |>: PipePrecedence
func |><A, B>(value: A, transform: (A) -> B) -> B {
    transform(value)
}

// Usage
let result = 5
    |> { \$0 * 2 }
    |> { \$0 + 1 }
    |> String.init
print(result)  // "11"

// Power operator
infix operator **: MultiplicationPrecedence
func **(base: Double, exp: Double) -> Double {
    pow(base, exp)
}
print(2.0 ** 10.0)  // 1024

// Nil-throwing operator
prefix operator ¿
prefix func ¿<T>(_ optional: T?) throws -> T {
    guard let value = optional else {
        throw NSError(domain: "nil", code: 0)
    }
    return value
}

let val: Int? = 42
print(try! ¿val)'''..language='swift'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_032'..topicId='swift'..title='AsyncSequence'..description='AsyncSequence enables async iteration over values produced over time, like network streams.'..code='''struct AsyncCounter: AsyncSequence {
    typealias Element = Int
    let limit: Int

    struct AsyncIterator: AsyncIteratorProtocol {
        var current = 0
        let limit: Int
        mutating func next() async -> Int? {
            guard current < limit else { return nil }
            current += 1
            try? await Task.sleep(nanoseconds: 100_000_000)
            return current
        }
    }

    func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(limit: limit)
    }
}

// Usage
func demo() async {
    // Basic iteration
    for await n in AsyncCounter(limit: 5) {
        print("Count:", n)
    }

    // With operators
    let evens = AsyncCounter(limit: 10)
        .filter { \$0 % 2 == 0 }
        .prefix(3)
    for await n in evens {
        print("Even:", n)
    }
}'''..language='swift'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_033'..topicId='swift'..title='Type Erasure'..description='Type erasure creates wrapper types that hide concrete types behind a protocol interface.'..code='''protocol AnyPublisher {
    associatedtype Output
    func subscribe(_ handler: @escaping (Output) -> Void)
}

// Type eraser
struct ErasedPublisher<Output>: AnyPublisher {
    private let _subscribe: (@escaping (Output) -> Void) -> Void
    init<P: AnyPublisher>(_ publisher: P) where P.Output == Output {
        _subscribe = publisher.subscribe
    }
    func subscribe(_ handler: @escaping (Output) -> Void) {
        _subscribe(handler)
    }
}

class TimerPublisher: AnyPublisher {
    func subscribe(_ handler: @escaping (Date) -> Void) {
        handler(Date())
    }
}

class ValuePublisher<T>: AnyPublisher {
    let value: T
    init(_ value: T) { self.value = value }
    func subscribe(_ handler: @escaping (T) -> Void) {
        handler(value)
    }
}

// Store different publishers in same collection
let publishers: [ErasedPublisher<String>] = [
    ErasedPublisher(ValuePublisher("Hello")),
    ErasedPublisher(ValuePublisher("World")),
]
publishers.forEach { p in
    p.subscribe { print(\$0) }
}'''..language='swift'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_034'..topicId='swift'..title='Phantom Types in Swift'..description='Phantom types carry type-level information without runtime overhead for compile-time safety.'..code='''enum Locked {}
enum Unlocked {}

struct Door<State> {
    let name: String
    private init(name: String) { self.name = name }

    static func create(name: String) -> Door<Locked> {
        Door<Locked>(name: name)
    }
}

extension Door where State == Locked {
    func unlock() -> Door<Unlocked> {
        print("Unlocking \\(name)")
        return Door<Unlocked>(name: name)
    }
}

extension Door where State == Unlocked {
    func lock() -> Door<Locked> {
        print("Locking \\(name)")
        return Door<Locked>(name: name)
    }
    func open() {
        print("Opening \\(name)")
    }
}

let door = Door<Locked>.create(name: "Front")
// door.open()  // Compile error!
let unlocked = door.unlock()
unlocked.open()  // OK
let relocked = unlocked.lock()'''..language='swift'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_035'..topicId='swift'..title='Dynamic Member Lookup'..description='@dynamicMemberLookup enables dot-syntax access to dynamic properties for DSLs and JSON wrappers.'..code='''@dynamicMemberLookup
struct JSON {
    let data: Any

    init(_ data: Any) { self.data = data }

    subscript(dynamicMember member: String) -> JSON {
        if let dict = data as? [String: Any] {
            return JSON(dict[member] ?? NSNull())
        }
        return JSON(NSNull())
    }

    subscript(index: Int) -> JSON {
        if let arr = data as? [Any] {
            return JSON(arr[index])
        }
        return JSON(NSNull())
    }

    var string: String? { data as? String }
    var int: Int? { data as? Int }
    var double: Double? { data as? Double }
    var bool: Bool? { data as? Bool }
}

let json = JSON([
    "name": "Alice",
    "age": 30,
    "address": [
        "city": "NYC",
        "zip": "10001"
    ]
] as [String: Any])

print(json.name.string ?? "nil")
print(json.age.int ?? 0)
print(json.address.city.string ?? "nil")'''..language='swift'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_036'..topicId='swift'..title='Generic Where Clauses'..description='Conditional conformance and generic where clauses enable precise type constraints.'..code='''// Conditional conformance
extension Array: CustomStringConvertible where Element: CustomStringConvertible {
    public var description: String {
        "[" + map { \$0.description }.joined(separator: ", ") + "]"
    }
}

extension Optional: CustomStringConvertible where Wrapped: CustomStringConvertible {
    public var description: String {
        switch self {
        case .some(let v): return v.description
        case .none: return "nil"
        }
    }
}

// Generic where on methods
extension Array {
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        sorted { \$0[keyPath: keyPath] < \$1[keyPath: keyPath] }
    }

    func unique<T: Hashable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        var seen = Set<T>()
        return filter { seen.insert(\$0[keyPath: keyPath]).inserted }
    }
}

struct Person { let name: String; let age: Int }
let people = [Person(name: "Charlie", age: 25), Person(name: "Alice", age: 30)]
let sorted = people.sorted(by: \\.name)
print(sorted.map { \$0.name })'''..language='swift'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_037'..topicId='swift'..title='Sendable and Transferable'..description='Sendable protocol marks types safe to transfer across concurrency domains.'..code='''// Sendable types
struct Point: Sendable {
    let x: Double
    let y: Double
}

// Sendable class requires immutable state
final class Config: Sendable {
    let host: String
    let port: Int
    init(host: String, port: Int) {
        self.host = host
        self.port = port
    }
}

// @Sendable closures
func runInBackground(_ work: @Sendable @escaping () -> Void) {
    Task { work() }
}

// Actor with sendable transfer
actor DataStore {
    private var items: [String: Sendable] = [:]

    func set(_ key: String, value: some Sendable) {
        items[key] = value
    }

    func get(_ key: String) -> (any Sendable)? {
        items[key]
    }
}

func demo() async {
    let store = DataStore()
    await store.set("point", value: Point(x: 1, y: 2))
    let val = await store.get("point")
    print(val ?? "nil")
}'''..language='swift'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_038'..topicId='swift'..title='Custom Collections'..description='Conform to Collection protocol for custom sequences with index-based access and iteration.'..code='''struct CircularBuffer<Element>: Collection {
    private var storage: [Element?]
    private var head = 0
    private var count_ = 0
    let capacity: Int

    init(capacity: Int) {
        self.capacity = capacity
        self.storage = Array(repeating: nil, count: capacity)
    }

    mutating func append(_ element: Element) {
        let idx = (head + count_) % capacity
        storage[idx] = element
        if count_ == capacity { head = (head + 1) % capacity }
        else { count_ += 1 }
    }

    var startIndex: Int { 0 }
    var endIndex: Int { count_ }
    func index(after i: Int) -> Int { i + 1 }

    subscript(position: Int) -> Element {
        storage[(head + position) % capacity]!
    }
}

var buffer = CircularBuffer<Int>(capacity: 3)
buffer.append(1); buffer.append(2); buffer.append(3)
buffer.append(4)  // overwrites 1
for item in buffer { print(item, terminator: " ") }
print()  // 2 3 4
print("Count:", buffer.count)'''..language='swift'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_039'..topicId='swift'..title='Copy-on-Write (COW)'..description='Implement copy-on-write semantics for value types that wrap reference types for efficient copying.'..code='''final class StorageRef<T> {
    var value: T
    init(_ value: T) { self.value = value }
}

struct COWArray<Element> {
    private var storage: StorageRef<[Element]>

    init(_ elements: [Element] = []) {
        storage = StorageRef(elements)
    }

    private mutating func ensureUnique() {
        if !isKnownUniquelyReferenced(&storage) {
            print("Copying storage!")
            storage = StorageRef(storage.value)
        }
    }

    mutating func append(_ element: Element) {
        ensureUnique()
        storage.value.append(element)
    }

    var count: Int { storage.value.count }

    subscript(index: Int) -> Element {
        get { storage.value[index] }
        set {
            ensureUnique()
            storage.value[index] = newValue
        }
    }
}

var a = COWArray([1, 2, 3])
var b = a           // No copy yet (shared reference)
b.append(4)         // Copy happens here
print("a:", a.count) // 3
print("b:", b.count) // 4'''..language='swift'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='swift_040'..topicId='swift'..title='Regex Builder (Swift 5.7)'..description='Swift Regex provides type-safe, composable regex patterns with a builder DSL.'..code='''import RegexBuilder

// Traditional regex
let emailPattern = /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}/

// Regex builder DSL
let dateRegex = Regex {
    Capture { OneOrMore(.digit) }  // year
    "-"
    Capture { OneOrMore(.digit) }  // month
    "-"
    Capture { OneOrMore(.digit) }  // day
}

let input = "Date: 2024-01-15"
if let match = input.firstMatch(of: dateRegex) {
    print("Year:", match.1)
    print("Month:", match.2)
    print("Day:", match.3)
}

// Complex pattern
let logRegex = Regex {
    "["
    Capture { ChoiceOf { "INFO"; "WARN"; "ERROR" } }
    "] "
    Capture { OneOrMore(.any) }
}

let log = "[ERROR] Connection timeout"
if let match = log.firstMatch(of: logRegex) {
    print("Level:", match.1)
    print("Message:", match.2)
}'''..language='swift'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
  ];
}
