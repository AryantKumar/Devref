import '../models/snippet.dart';

List<Snippet> getKotlinSnippets() {
  return [

    // ═══════════════════════════════════════════════════════════
    // 1. BASICS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_001'
      ..topicId = 'kotlin'
      ..title = 'val vs var'
      ..description = 'val is immutable (read-only), var is mutable. Prefer val whenever possible.'
      ..code = '''// val = read-only (like final in Java)
val name = "Kotlin"
val version = 3.0

// var = mutable, can be reassigned
var score = 0
score = 10   // ✅ works
score += 5   // ✅ works

// name = "Java"  // ❌ ERROR: val cannot be reassigned

// Type can be explicit or inferred
val city: String = "Bangalore"
val pin = 560001   // Int inferred automatically'''
      ..language = 'kotlin'..difficulty = 'very_easy'..section = 'Basics'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_002'
      ..topicId = 'kotlin'
      ..title = 'Data Types'
      ..description = 'Kotlin\'s core built-in types: Int, Long, Double, Boolean, Char, String.'
      ..code = '''// Integer types
val age: Int = 22            // 32-bit
val population: Long = 8_000_000_000L  // 64-bit (L suffix)

// Floating point
val pi: Double = 3.14159     // 64-bit (default)
val gravity: Float = 9.8f    // 32-bit (f suffix)

// Boolean
val isLoggedIn: Boolean = true
val hasInternet = false      // inferred as Boolean

// Character
val grade: Char = 'A'

// String
val language: String = "Kotlin"

// Type checking
println(age is Int)          // true
println(language.length)     // 6'''
      ..language = 'kotlin'..difficulty = 'very_easy'..section = 'Basics'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_003'
      ..topicId = 'kotlin'
      ..title = 'Null Safety'
      ..description = 'Kotlin prevents NullPointerExceptions by making nullability explicit in the type system.'
      ..code = '''// Non-nullable — can NEVER be null
var name: String = "Aryant"
// name = null  // ❌ compile error

// Nullable — use ? to allow null
var nickname: String? = null
nickname = "Dev"   // ✅ also fine

// Safe call — returns null instead of crashing
println(nickname?.length)      // 3
println(null?.length)          // null (no crash)

// Elvis operator — provide a default if null
val display = nickname ?: "Anonymous"
println(display)               // "Dev"

// Not-null assertion — throws if null (use carefully!)
val len = nickname!!.length    // crashes if nickname is null

// Safe cast
val obj: Any = "Hello"
val str: String? = obj as? String   // null if cast fails
println(str?.uppercase())           // HELLO'''
      ..language = 'kotlin'..difficulty = 'easy'..section = 'Basics'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_004'
      ..topicId = 'kotlin'
      ..title = 'String Templates & Multiline'
      ..description = 'Embed expressions directly in strings using \$ and use triple quotes for multiline.'
      ..code = '''val name = "Aryant"
val age = 22

// Simple variable interpolation
println("Name: \$name")                  // Name: Aryant

// Expression interpolation with \${}
println("In 5 years: \${age + 5}")       // In 5 years: 27
println("Uppercase: \${name.uppercase()}") // Uppercase: ARYANT

// Multiline string (raw string — no escape needed)
val json = """
    {
        "name": "\$name",
        "age": \$age,
        "role": "developer"
    }
""".trimIndent()  // removes leading whitespace
println(json)

// String operations
val greeting = "Hello, \$name!"
println(greeting.length)        // 14
println(greeting.contains("Ary")) // true
println(greeting.replace("Hello", "Hi")) // Hi, Aryant!'''
      ..language = 'kotlin'..difficulty = 'very_easy'..section = 'Basics'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_005'
      ..topicId = 'kotlin'
      ..title = 'Destructuring Declarations'
      ..description = 'Unpack data classes, Pairs, and Maps into multiple variables at once.'
      ..code = '''data class User(val name: String, val age: Int, val city: String)

val user = User("Aryant", 22, "Bangalore")

// Destructure into separate variables
val (name, age, city) = user
println("Name: \$name, Age: \$age, City: \$city")

// Skip fields you don't need with _
val (_, _, userCity) = user
println("City only: \$userCity")

// Destructure a Pair
val coordinates = Pair(12.97, 77.59)
val (lat, lng) = coordinates
println("Lat: \$lat, Lng: \$lng")

// Destructure in for loops
val scores = mapOf("Alice" to 95, "Bob" to 88, "Carol" to 91)
for ((playerName, score) in scores) {
    println("\$playerName scored \$score")
}
// Alice scored 95
// Bob scored 88
// Carol scored 91'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'Basics'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 2. OPERATORS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_006'
      ..topicId = 'kotlin'
      ..title = 'Arithmetic Operators'
      ..description = 'Standard math operators plus useful stdlib math functions.'
      ..code = '''val a = 17
val b = 5

println(a + b)   // 22  — addition
println(a - b)   // 12  — subtraction
println(a * b)   // 85  — multiplication
println(a / b)   // 3   — integer division (truncates)
println(a % b)   // 2   — modulo (remainder)

// Double division
println(a.toDouble() / b)  // 3.4

// Augmented assignment
var count = 10
count += 5   // 15
count -= 2   // 13
count *= 2   // 26
count /= 2   // 13

// Math functions from kotlin.math
import kotlin.math.*
println(sqrt(16.0))   // 4.0
println(pow(2.0, 8.0)) // 256.0
println(abs(-42))     // 42
println(max(10, 20))  // 20'''
      ..language = 'kotlin'..difficulty = 'very_easy'..section = 'Operators'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_007'
      ..topicId = 'kotlin'
      ..title = 'Comparison & Logical Operators'
      ..description = 'Compare values and combine conditions with logical operators.'
      ..code = '''val x = 10
val y = 20

// Comparison operators
println(x == y)   // false — equality (structural)
println(x != y)   // true  — not equal
println(x < y)    // true  — less than
println(x > y)    // false — greater than
println(x <= 10)  // true  — less than or equal
println(x >= 10)  // true  — greater than or equal

// Referential equality (same object in memory)
val a = "Hello"
val b = "Hello"
println(a === b)  // true (Kotlin interns strings)

// Logical operators
val hasTicket = true
val isVip = false

println(hasTicket && isVip)    // false — AND
println(hasTicket || isVip)    // true  — OR
println(!isVip)                // true  — NOT

// Range check
val age = 22
println(age in 18..30)         // true
println(age !in 0..17)         // true'''
      ..language = 'kotlin'..difficulty = 'very_easy'..section = 'Operators'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 3. CONTROL FLOW
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_008'
      ..topicId = 'kotlin'
      ..title = 'If-Else as Expression'
      ..description = 'In Kotlin, if-else is an expression that returns a value — no ternary operator needed.'
      ..code = '''val temperature = 35

// Traditional if-else
if (temperature > 30) {
    println("Hot day!")
} else if (temperature in 20..30) {
    println("Pleasant day")
} else {
    println("Cold day")
}

// if-else as an expression (returns a value)
val weather = if (temperature > 30) "Hot" else "Cool"
println("Weather: \$weather")   // Weather: Hot

// Multi-line if expression
val grade = 85
val letterGrade = if (grade >= 90) {
    "A"
} else if (grade >= 80) {
    "B"   // last expression in block is the value
} else if (grade >= 70) {
    "C"
} else {
    "F"
}
println("Grade: \$letterGrade") // Grade: B'''
      ..language = 'kotlin'..difficulty = 'very_easy'..section = 'Control Flow'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_009'
      ..topicId = 'kotlin'
      ..title = 'When Expression'
      ..description = 'Kotlin\'s powerful replacement for switch-case. Works as a statement or expression.'
      ..code = '''val day = 3

// when as a statement
when (day) {
    1 -> println("Monday")
    2 -> println("Tuesday")
    3 -> println("Wednesday")
    in 4..5 -> println("Thu or Fri")
    6, 7 -> println("Weekend!")
    else -> println("Invalid day")
}

// when as an expression
val dayName = when (day) {
    1 -> "Monday"
    2 -> "Tuesday"
    3 -> "Wednesday"
    else -> "Other"
}
println(dayName)  // Wednesday

// when without an argument (acts like if-else chain)
val score = 87
val result = when {
    score >= 90 -> "Excellent"
    score >= 75 -> "Good"       // ← matches here
    score >= 50 -> "Pass"
    else        -> "Fail"
}
println(result)  // Good

// when with type checking
fun describe(obj: Any) = when (obj) {
    is Int    -> "Integer: \$obj"
    is String -> "String of length \${obj.length}"
    is List<*> -> "List with \${obj.size} items"
    else      -> "Unknown"
}
println(describe(42))       // Integer: 42
println(describe("hello"))  // String of length 5'''
      ..language = 'kotlin'..difficulty = 'easy'..section = 'Control Flow'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_010'
      ..topicId = 'kotlin'
      ..title = 'Loops'
      ..description = 'for, while, do-while loops plus useful range tricks.'
      ..code = '''// for loop with range
for (i in 1..5) print("\$i ")     // 1 2 3 4 5

// Exclusive end with until
for (i in 0 until 5) print("\$i ") // 0 1 2 3 4

// Step
for (i in 0..10 step 2) print("\$i ") // 0 2 4 6 8 10

// Reverse
for (i in 5 downTo 1) print("\$i ")   // 5 4 3 2 1

// Iterate over a list with index
val fruits = listOf("Apple", "Banana", "Cherry")
for ((index, fruit) in fruits.withIndex()) {
    println("\$index: \$fruit")
}
// 0: Apple
// 1: Banana
// 2: Cherry

// while loop
var remaining = 3
while (remaining > 0) {
    println("Remaining: \$remaining")
    remaining--
}

// do-while — always runs at least once
var attempt = 0
do {
    println("Attempt \${++attempt}")
} while (attempt < 3)

// break and continue
for (n in 1..10) {
    if (n == 4) continue  // skip 4
    if (n == 7) break     // stop at 7
    print("\$n ")          // 1 2 3 5 6
}'''
      ..language = 'kotlin'..difficulty = 'very_easy'..section = 'Control Flow'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 4. FUNCTIONS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_011'
      ..topicId = 'kotlin'
      ..title = 'Function Basics'
      ..description = 'Declaring functions with parameters, return types, and single-expression shortcuts.'
      ..code = '''// Standard function
fun greet(name: String): String {
    return "Hello, \$name!"
}
println(greet("Aryant"))   // Hello, Aryant!

// Single-expression function (= instead of {} return)
fun square(x: Int): Int = x * x
println(square(5))         // 25

// Return type inferred for single-expression
fun double(x: Int) = x * 2

// Unit return (like void) — can be omitted
fun log(message: String): Unit {
    println("[LOG] \$message")
}

// Multiple parameters
fun add(a: Int, b: Int, c: Int): Int {
    return a + b + c
}
println(add(1, 2, 3))  // 6

// Named arguments — order doesn't matter
fun createProfile(name: String, age: Int, city: String) =
    "\$name, \$age, \$city"

println(createProfile(
    city = "Bangalore",
    name = "Aryant",
    age  = 22
))'''
      ..language = 'kotlin'..difficulty = 'very_easy'..section = 'Functions'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_012'
      ..topicId = 'kotlin'
      ..title = 'Default & Named Arguments'
      ..description = 'Provide default values to make parameters optional at call sites.'
      ..code = '''// Default argument values
fun createUser(
    name: String,
    role: String = "user",     // default
    isActive: Boolean = true   // default
): String {
    return "[\${if (isActive) "ACTIVE" else "INACTIVE"}] \$name (\$role)"
}

// Only provide what you need
println(createUser("Aryant"))
// [ACTIVE] Aryant (user)

println(createUser("Admin", role = "admin"))
// [ACTIVE] Admin (admin)

println(createUser("Guest", isActive = false))
// [INACTIVE] Guest (user)

// Varargs — accept any number of arguments
fun sum(vararg numbers: Int): Int {
    return numbers.sum()  // numbers is an IntArray
}
println(sum(1, 2, 3))        // 6
println(sum(10, 20, 30, 40)) // 100

// Spread operator to pass an array as vararg
val nums = intArrayOf(5, 10, 15)
println(sum(*nums))          // 30'''
      ..language = 'kotlin'..difficulty = 'easy'..section = 'Functions'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_013'
      ..topicId = 'kotlin'
      ..title = 'Extension Functions'
      ..description = 'Add new functions to existing classes without inheriting or modifying them.'
      ..code = '''// Extend String with a new function
fun String.isPalindrome(): Boolean {
    val cleaned = this.lowercase().filter { it.isLetter() }
    return cleaned == cleaned.reversed()
}
println("racecar".isPalindrome())  // true
println("Kotlin".isPalindrome())   // false

// Extend Int
fun Int.isEven(): Boolean = this % 2 == 0
fun Int.factorial(): Long {
    if (this <= 1) return 1
    return this * (this - 1).factorial()
}
println(6.isEven())      // true
println(5.factorial())   // 120

// Extend a custom class
data class User(val name: String, val score: Int)

fun User.badge(): String = when {
    score >= 90 -> "\$name 🏆 Gold"
    score >= 70 -> "\$name 🥈 Silver"
    else        -> "\$name 🥉 Bronze"
}

val user = User("Aryant", 92)
println(user.badge())   // Aryant 🏆 Gold

// Extension on nullable type
fun String?.orDefault(default: String = "N/A"): String {
    return this ?: default
}
val nullName: String? = null
println(nullName.orDefault())  // N/A'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'Functions'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_014'
      ..topicId = 'kotlin'
      ..title = 'Property Delegation — lazy'
      ..description = 'Defer expensive initialization until the property is first accessed.'
      ..code = '''class DatabaseManager {
    // This block runs ONLY when `connection` is first accessed
    val connection: DBConnection by lazy {
        println("Opening DB connection...")
        DBConnection.open()  // expensive operation
    }

    val cachedUsers: List<User> by lazy {
        println("Loading users from DB...")
        connection.query("SELECT * FROM users")
    }
}

val db = DatabaseManager()
// Nothing has been initialized yet

println("Manager created")      // prints immediately

val users = db.cachedUsers      // NOW both lazy blocks run:
// "Opening DB connection..."
// "Loading users from DB..."

val users2 = db.cachedUsers     // cached — block does NOT run again

// lazy is thread-safe by default (LazyThreadSafetyMode.SYNCHRONIZED)
// For single-threaded use, you can optimize:
val config: Config by lazy(LazyThreadSafetyMode.NONE) {
    Config.load()
}'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'Functions'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 5. COLLECTIONS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_015'
      ..topicId = 'kotlin'
      ..title = 'List'
      ..description = 'Ordered collection. listOf() is read-only, mutableListOf() allows changes.'
      ..code = '''// Immutable list
val fruits = listOf("Apple", "Banana", "Cherry", "Apple")
println(fruits[0])            // Apple
println(fruits.size)          // 4
println(fruits.contains("Banana")) // true
println(fruits.indexOf("Apple"))   // 0 (first occurrence)
println(fruits.count { it == "Apple" }) // 2

// Mutable list
val tasks = mutableListOf("Code", "Test", "Deploy")
tasks.add("Monitor")           // add to end
tasks.add(0, "Plan")           // add at index
tasks.remove("Test")           // remove by value
tasks.removeAt(0)              // remove by index
println(tasks)                 // [Code, Deploy, Monitor]

// Useful list operations
println(fruits.first())        // Apple
println(fruits.last())         // Apple
println(fruits.reversed())     // [Apple, Cherry, Banana, Apple]
println(fruits.sorted())       // [Apple, Apple, Banana, Cherry]
println(fruits.distinct())     // [Apple, Banana, Cherry]
println(fruits.take(2))        // [Apple, Banana]
println(fruits.drop(2))        // [Cherry, Apple]
println(fruits.subList(1, 3))  // [Banana, Cherry]'''
      ..language = 'kotlin'..difficulty = 'very_easy'..section = 'Collections'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_016'
      ..topicId = 'kotlin'
      ..title = 'Set & Map'
      ..description = 'Set for unique elements, Map for key-value pairs. Both have mutable versions.'
      ..code = '''// Set — automatically removes duplicates
val ids = setOf(1, 2, 3, 2, 1)   // {1, 2, 3}
println(ids.size)    // 3
println(2 in ids)    // true

val mutableSet = mutableSetOf("Kotlin", "Java")
mutableSet.add("Swift")
mutableSet.add("Kotlin")  // duplicate ignored
println(mutableSet)  // [Kotlin, Java, Swift]

// Set operations
val a = setOf(1, 2, 3, 4)
val b = setOf(3, 4, 5, 6)
println(a union b)        // {1, 2, 3, 4, 5, 6}
println(a intersect b)    // {3, 4}
println(a subtract b)     // {1, 2}

// Map — key-value pairs
val userRoles = mapOf(
    "alice" to "admin",
    "bob"   to "editor",
    "carol" to "viewer"
)
println(userRoles["alice"])          // admin
println(userRoles.getOrDefault("dave", "guest")) // guest
println(userRoles.keys)              // [alice, bob, carol]
println(userRoles.values)            // [admin, editor, viewer]

// Mutable map
val scores = mutableMapOf("Alice" to 90, "Bob" to 85)
scores["Carol"] = 92       // add/update
scores.remove("Bob")
println(scores)             // {Alice=90, Carol=92}

// Iterate map
for ((name, role) in userRoles) {
    println("\$name → \$role")
}'''
      ..language = 'kotlin'..difficulty = 'easy'..section = 'Collections'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 6. OOP
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_017'
      ..topicId = 'kotlin'
      ..title = 'Classes & Constructors'
      ..description = 'Primary and secondary constructors, init blocks, and property declaration.'
      ..code = '''// Primary constructor — params declared directly
class User(
    val id: Int,           // val = property
    var name: String,      // var = mutable property
    val email: String
) {
    // init block runs after primary constructor
    init {
        require(name.isNotBlank()) { "Name cannot be blank" }
        require(email.contains("@")) { "Invalid email" }
        println("User created: \$name")
    }

    // Computed property
    val displayName: String
        get() = name.trim().replaceFirstChar { it.uppercase() }

    // Secondary constructor — must call primary with this()
    constructor(name: String, email: String) : this(
        id = (Math.random() * 1000).toInt(),
        name = name,
        email = email
    )

    fun greet() = "Hi, I'm \$displayName (\$email)"
}

val u1 = User(id = 1, name = "aryant", email = "a@dev.com")
println(u1.greet())       // Hi, I'm Aryant (a@dev.com)

val u2 = User("bob", "bob@dev.com")   // secondary constructor
println(u2.name)'''
      ..language = 'kotlin'..difficulty = 'easy'..section = 'OOP'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_018'
      ..topicId = 'kotlin'
      ..title = 'Data Classes'
      ..description = 'Data classes auto-generate equals, hashCode, toString, copy, and componentN functions.'
      ..code = '''data class Product(
    val id: Int,
    val name: String,
    val price: Double,
    val inStock: Boolean = true
)

val p1 = Product(1, "Keyboard", 1499.0)
val p2 = Product(1, "Keyboard", 1499.0)
val p3 = Product(2, "Mouse", 799.0)

// equals() — compares by value, not reference
println(p1 == p2)   // true  ✅ (would be false for regular class)
println(p1 == p3)   // false

// toString() — readable output
println(p1)  // Product(id=1, name=Keyboard, price=1499.0, inStock=true)

// copy() — create modified copy without changing original
val discounted = p1.copy(price = 999.0)
println(discounted)  // Product(id=1, name=Keyboard, price=999.0, inStock=true)
println(p1.price)    // 1499.0 — original unchanged

// componentN() — used in destructuring
val (id, name, price) = p1
println("\$name costs ₹\$price")   // Keyboard costs ₹1499.0

// hashCode() — safe to use in Sets and Maps
val productSet = setOf(p1, p2, p3)
println(productSet.size)  // 2 (p1 and p2 are "equal")'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'OOP'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_019'
      ..topicId = 'kotlin'
      ..title = 'Sealed Classes'
      ..description = 'Sealed classes restrict subclassing to the same file — perfect for UI state and results.'
      ..code = '''// Sealed class — all subclasses must be in same file
sealed class NetworkResult<out T> {
    object Loading : NetworkResult<Nothing>()
    data class Success<T>(val data: T) : NetworkResult<T>()
    data class Error(
        val code: Int,
        val message: String
    ) : NetworkResult<Nothing>()
}

// Usage in a ViewModel
fun handleResult(result: NetworkResult<List<String>>) {
    when (result) {
        is NetworkResult.Loading -> {
            showProgressBar()
        }
        is NetworkResult.Success -> {
            // compiler knows result.data is List<String>
            displayItems(result.data)
        }
        is NetworkResult.Error -> {
            showError("\${result.code}: \${result.message}")
        }
        // No else needed! Compiler knows all subclasses
    }
}

// Another common pattern — UI State
sealed class UiState {
    object Idle    : UiState()
    object Loading : UiState()
    data class Success(val users: List<String>) : UiState()
    data class Error(val reason: String)        : UiState()
}

val state: UiState = UiState.Success(listOf("Alice", "Bob"))
if (state is UiState.Success) {
    println(state.users)  // [Alice, Bob] — smart cast
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'OOP'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_020'
      ..topicId = 'kotlin'
      ..title = 'Inheritance'
      ..description = 'Classes are final by default. Use open to allow subclassing and override to change behavior.'
      ..code = '''// Base class must be marked "open" to be inheritable
open class Animal(
    val name: String,
    open val sound: String  // open property can be overridden
) {
    open fun speak(): String = "\$name says: \$sound"
    fun breathe() = "\$name is breathing"   // final — cannot override
}

// Dog inherits Animal
class Dog(name: String) : Animal(name, "Woof") {
    override val sound: String = "WOOF WOOF!"   // override property
    override fun speak(): String = "🐶 \${super.speak()}" // call parent
    fun fetch() = "\$name fetches the ball!"
}

class Cat(name: String) : Animal(name, "Meow") {
    override fun speak() = "🐱 \$name purrs softly..."
}

val dog = Dog("Rex")
val cat = Cat("Luna")

println(dog.speak())    // 🐶 Rex says: WOOF WOOF!
println(cat.speak())    // 🐱 Luna purrs softly...
println(dog.breathe())  // Rex is breathing
println(dog.fetch())    // Rex fetches the ball!

// Polymorphism
val animals: List<Animal> = listOf(dog, cat)
animals.forEach { println(it.speak()) }'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'OOP'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_021'
      ..topicId = 'kotlin'
      ..title = 'Object & Companion Object'
      ..description = 'object creates a singleton. companion object provides class-level (static-like) members.'
      ..code = '''// object — true Singleton, one instance ever
object AppConfig {
    const val BASE_URL = "https://api.myapp.com"
    const val TIMEOUT  = 30_000L
    var isDebug = false

    fun endpoint(path: String) = "\$BASE_URL/\$path"
}

println(AppConfig.BASE_URL)           // https://api.myapp.com
println(AppConfig.endpoint("users"))  // https://api.myapp.com/users

// companion object — like static in Java
class UserRepository private constructor() {

    companion object {
        private var instance: UserRepository? = null

        // Factory method pattern
        fun getInstance(): UserRepository {
            return instance ?: UserRepository().also { instance = it }
        }

        // Constants tied to the class
        const val MAX_USERS = 100
    }

    fun getUsers(): List<String> = listOf("Alice", "Bob")
}

val repo1 = UserRepository.getInstance()
val repo2 = UserRepository.getInstance()
println(repo1 === repo2)    // true — same instance
println(UserRepository.MAX_USERS)  // 100

// Enum classes (bonus)
enum class Status { ACTIVE, INACTIVE, BANNED }
val status = Status.ACTIVE
println(status.name)    // ACTIVE
println(status.ordinal) // 0'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'OOP'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_022'
      ..topicId = 'kotlin'
      ..title = 'Interfaces & Delegation'
      ..description = 'Interfaces define contracts with optional default implementations. Use by to delegate automatically.'
      ..code = '''// Interface with abstract and default methods
interface Logger {
    fun log(message: String)                         // must implement
    fun debug(message: String) = log("[DEBUG] \$message") // default impl
    fun error(message: String) = log("[ERROR] \$message")
}

interface Analytics {
    fun track(event: String, properties: Map<String, Any> = emptyMap())
}

// Implement multiple interfaces
class ConsoleLogger : Logger {
    override fun log(message: String) = println(message)
}

// Class delegation with "by" keyword
// UserService gets all Logger methods automatically via delegation!
class UserService(
    private val logger: Logger = ConsoleLogger()
) : Logger by logger {

    fun createUser(name: String) {
        log("Creating user: \$name")       // delegated to ConsoleLogger
        debug("Validation passed")         // default impl in Logger
        // ... create user logic
        log("User \$name created successfully")
    }
}

val service = UserService()
service.createUser("Aryant")
// Creating user: Aryant
// [DEBUG] Validation passed
// User Aryant created successfully

service.error("Something went wrong")
// [ERROR] Something went wrong'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'OOP'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 7. LAMBDAS & HIGHER ORDER FUNCTIONS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_023'
      ..topicId = 'kotlin'
      ..title = 'Lambdas'
      ..description = 'Anonymous functions stored in variables. Last parameter lambda can go outside ().'
      ..code = '''// Lambda syntax: { params -> body }
val greet = { name: String -> "Hello, \$name!" }
println(greet("Aryant"))   // Hello, Aryant!

// Multi-line lambda
val calculate = { a: Int, b: Int ->
    val sum = a + b
    val product = a * b
    "\$a + \$b = \$sum, \$a × \$b = \$product"  // last line is the return value
}
println(calculate(3, 4))  // 3 + 4 = 7, 3 × 4 = 12

// "it" — implicit name for single-parameter lambda
val square = { it: Int -> it * it }  // explicit
val double: (Int) -> Int = { it * 2 } // "it" is implicit

println(square(5))   // 25
println(double(6))   // 12

// Lambda as a function type variable
val onClick: () -> Unit = { println("Button clicked!") }
onClick()

val onValueChange: (String) -> Unit = { newValue ->
    println("Value changed to: \$newValue")
}
onValueChange("Kotlin 2.0")

// Trailing lambda syntax (when lambda is last parameter)
listOf(1, 2, 3, 4, 5).filter { it > 2 }.forEach { println(it) }
// 3
// 4
// 5'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'Lambdas & HOF'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_024'
      ..topicId = 'kotlin'
      ..title = 'Higher Order Functions'
      ..description = 'Functions that accept or return other functions — the foundation of functional programming.'
      ..code = '''// Function that takes a function as parameter
fun applyOperation(a: Int, b: Int, operation: (Int, Int) -> Int): Int {
    return operation(a, b)
}

println(applyOperation(10, 5) { x, y -> x + y })  // 15
println(applyOperation(10, 5) { x, y -> x * y })  // 50
println(applyOperation(10, 5, ::maxOf))             // 10 (function ref)

// Function that returns a function (closure)
fun multiplierOf(factor: Int): (Int) -> Int {
    return { number -> number * factor }  // captures `factor`
}

val triple = multiplierOf(3)
val times10 = multiplierOf(10)
println(triple(7))   // 21
println(times10(7))  // 70

// Real-world pattern — retry logic
fun <T> retry(times: Int, action: () -> T): T? {
    repeat(times) { attempt ->
        try {
            return action()
        } catch (e: Exception) {
            println("Attempt \${attempt + 1} failed: \${e.message}")
        }
    }
    return null
}

val result = retry(3) {
    // some flaky operation
    fetchDataFromNetwork()
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Lambdas & HOF'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_025'
      ..topicId = 'kotlin'
      ..title = 'Inline Functions'
      ..description = 'inline copies the function body at the call site, avoiding lambda overhead.'
      ..code = '''// inline eliminates the lambda object overhead
inline fun measureTime(label: String, block: () -> Unit) {
    val start = System.currentTimeMillis()
    block()   // lambda is inlined — no object created
    val end   = System.currentTimeMillis()
    println("\$label took \${end - start}ms")
}

measureTime("Data processing") {
    // Compiler pastes this block directly where measureTime is called
    val list = (1..100_000).map { it * 2 }
    println("Processed \${list.size} items")
}

// noinline — opt out specific lambda from inlining
inline fun process(
    data: List<Int>,
    inline transform: (Int) -> Int,
    noinline onComplete: () -> Unit  // kept as object (e.g. to pass around)
) {
    val result = data.map(transform)
    onComplete()
}

// crossinline — allow inline but disallow non-local returns
inline fun runInBackground(crossinline block: () -> Unit) {
    Thread { block() }.start()
    // crossinline prevents: return@outerFunction inside block
}

// Real benefit: in tight loops, inline avoids thousands of lambda allocations
inline fun <T> List<T>.fastForEach(action: (T) -> Unit) {
    for (element in this) action(element)
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Lambdas & HOF'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 8. COROUTINES (VERY IMPORTANT)
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_026'
      ..topicId = 'kotlin'
      ..title = 'suspend Functions'
      ..description = 'suspend marks a function that can pause without blocking the thread.'
      ..code = '''import kotlinx.coroutines.*

// suspend functions can call other suspend functions
// They can only be called from a coroutine or another suspend function
suspend fun fetchUserById(id: Int): User {
    delay(1000)  // non-blocking pause (simulates network call)
    return User(id, "User_\$id")
}

suspend fun fetchUserProfile(userId: Int): Profile {
    val user    = fetchUserById(userId)   // ← suspend call (waits here)
    val friends = fetchFriends(userId)    // ← runs after user is fetched
    return Profile(user, friends)
}

// To launch a suspend function:
fun main() = runBlocking {  // creates a coroutine scope
    println("Fetching user...")
    val user = fetchUserById(1)   // waits 1 second, thread not blocked
    println("Got: \${user.name}")
}

// In Android ViewModel:
class UserViewModel : ViewModel() {
    fun loadUser(id: Int) {
        viewModelScope.launch {             // launch coroutine
            val user = fetchUserById(id)    // suspend — safe on Main thread
            _uiState.value = UiState.Success(user)
        }
    }
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Coroutines (VERY IMPORTANT)'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_027'
      ..topicId = 'kotlin'
      ..title = 'Coroutine Builders & Scope'
      ..description = 'launch vs async, and the different coroutine scopes in Android.'
      ..code = '''import kotlinx.coroutines.*

// launch — fire and forget (returns Job, no result)
val job = viewModelScope.launch {
    performBackgroundWork()
}
job.cancel()  // can be cancelled

// async — returns a Deferred (like a Future with a value)
val deferredResult = viewModelScope.async {
    calculateResult()  // returns a value
}
val result = deferredResult.await()  // suspends until ready

// Parallel execution with async
viewModelScope.launch {
    // Start BOTH requests at the same time
    val usersDeferred   = async { fetchUsers() }
    val settingsDeferred = async { fetchSettings() }

    // Wait for both results
    val users    = usersDeferred.await()
    val settings = settingsDeferred.await()

    // Both are now available — total time = max(t1, t2) not t1+t2
    render(users, settings)
}

// Scope types in Android:
// viewModelScope  → cancelled when ViewModel is cleared
// lifecycleScope  → cancelled when Activity/Fragment is destroyed
// GlobalScope     → app-wide, avoid for most cases

// withContext — switch context inside a coroutine
suspend fun loadData(): List<Item> {
    return withContext(Dispatchers.IO) {
        database.loadAll()   // runs on IO thread pool
    }
}   // automatically switches back to caller's dispatcher'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Coroutines (VERY IMPORTANT)'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_028'
      ..topicId = 'kotlin'
      ..title = 'Dispatchers'
      ..description = 'Dispatchers control which thread pool a coroutine runs on.'
      ..code = '''import kotlinx.coroutines.*

viewModelScope.launch {

    // Dispatchers.Main — UI thread (update views here)
    withContext(Dispatchers.Main) {
        progressBar.isVisible = true
        statusText.text = "Loading..."
    }

    // Dispatchers.IO — optimized for disk/network (up to 64 threads)
    val data = withContext(Dispatchers.IO) {
        api.getUsers()         // network call
        // OR
        database.queryAll()    // disk/DB read
    }

    // Dispatchers.Default — CPU-intensive work (threads = CPU cores)
    val processed = withContext(Dispatchers.Default) {
        data.map { user ->
            expensiveTransformation(user)  // heavy computation
        }
    }

    // Dispatchers.Unconfined — inherits caller's thread (rarely used)

    // Back on Main to update UI
    withContext(Dispatchers.Main) {
        progressBar.isVisible = false
        adapter.submitList(processed)
    }
}

// Practical rule of thumb:
// Network / File / DB → Dispatchers.IO
// Heavy CPU (sorting big lists, image processing) → Dispatchers.Default
// UI updates → Dispatchers.Main (already on Main in viewModelScope)'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Coroutines (VERY IMPORTANT)'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_029'
      ..topicId = 'kotlin'
      ..title = 'Flow'
      ..description = 'Cold asynchronous stream of multiple values. Like a suspend function that returns many values over time.'
      ..code = '''import kotlinx.coroutines.flow.*

// Create a Flow with the flow builder
fun temperatureUpdates(): Flow<Double> = flow {
    while (true) {
        val temp = readTemperatureSensor()  // suspend call inside flow
        emit(temp)                          // push a value downstream
        delay(2000)                         // wait 2 seconds
    }
}

// Flow operators — transform before collecting
fun main() = runBlocking {
    temperatureUpdates()
        .map { celsius -> celsius * 9/5 + 32 }   // Celsius → Fahrenheit
        .filter { it > 98.6 }                     // only fever temps
        .onEach { println("Fever alert: \$it°F") } // side effect
        .take(3)                                   // stop after 3 values
        .collect { temp ->
            sendNotification("High temp: \$temp°F") // terminal operator
        }
}

// Flow from a list (for testing)
fun numbersFlow(): Flow<Int> = flowOf(1, 2, 3, 4, 5)

// Room returns Flow — auto-updates when DB changes
@Dao
interface UserDao {
    @Query("SELECT * FROM users")
    fun observeUsers(): Flow<List<User>>  // emits new list on every DB change
}

// Collect in ViewModel
viewModelScope.launch {
    userDao.observeUsers()
        .map { it.filter { user -> user.isActive } }
        .collect { activeUsers ->
            _users.value = activeUsers
        }
}'''
      ..language = 'kotlin'..difficulty = 'very_hard'..section = 'Coroutines (VERY IMPORTANT)'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_030'
      ..topicId = 'kotlin'
      ..title = 'StateFlow & SharedFlow'
      ..description = 'Hot flows for ViewModel→UI communication. StateFlow for state, SharedFlow for events.'
      ..code = '''class UserViewModel : ViewModel() {

    // StateFlow — holds latest value, replays it to new collectors
    // Like LiveData but works with coroutines
    private val _uiState = MutableStateFlow<UiState>(UiState.Loading)
    val uiState: StateFlow<UiState> = _uiState.asStateFlow()

    // SharedFlow — for one-shot events (navigation, snackbar)
    // replay=0 means new collectors don't get past events
    private val _events = MutableSharedFlow<UiEvent>(replay = 0)
    val events: SharedFlow<UiEvent> = _events.asSharedFlow()

    fun loadUsers() {
        viewModelScope.launch {
            _uiState.value = UiState.Loading
            try {
                val users = repository.getUsers()   // suspend call
                _uiState.value = UiState.Success(users)
            } catch (e: Exception) {
                _uiState.value = UiState.Error(e.message ?: "Unknown error")
                _events.emit(UiEvent.ShowSnackbar("Failed to load users"))
            }
        }
    }
}

// Collect in Fragment
viewLifecycleOwner.lifecycleScope.launch {
    // repeatOnLifecycle ensures collection only when STARTED
    repeatOnLifecycle(Lifecycle.State.STARTED) {
        launch {
            viewModel.uiState.collect { state ->
                when (state) {
                    is UiState.Loading -> progressBar.show()
                    is UiState.Success -> adapter.submitList(state.users)
                    is UiState.Error   -> showError(state.message)
                }
            }
        }
        launch {
            viewModel.events.collect { event ->
                when (event) {
                    is UiEvent.ShowSnackbar -> showSnackbar(event.message)
                    is UiEvent.Navigate     -> navigate(event.destination)
                }
            }
        }
    }
}'''
      ..language = 'kotlin'..difficulty = 'very_hard'..section = 'Coroutines (VERY IMPORTANT)'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 9. ANDROID BASICS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_031'
      ..topicId = 'kotlin'
      ..title = 'Activity Lifecycle'
      ..description = 'Activity is the entry point for user interaction. Each lifecycle method serves a specific purpose.'
      ..code = '''@AndroidEntryPoint
class MainActivity : AppCompatActivity() {

    private val viewModel: MainViewModel by viewModels()
    private lateinit var binding: ActivityMainBinding

    // Called once — set up UI, inflate layout
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setupClickListeners()
        observeViewModel()
    }

    // Activity visible but not interactive
    override fun onStart() {
        super.onStart()
        analytics.logScreenView("MainActivity")
    }

    // Fully interactive — resume animations, camera, sensors
    override fun onResume() {
        super.onResume()
        sensorManager.registerListener(this, sensor, SENSOR_DELAY_UI)
    }

    // Lost focus — pause animations, release camera
    override fun onPause() {
        super.onPause()
        sensorManager.unregisterListener(this)
    }

    // No longer visible — stop network calls if not needed
    override fun onStop() {
        super.onStop()
    }

    // Activity being destroyed — release heavy resources
    override fun onDestroy() {
        super.onDestroy()
        // viewModel is automatically cleared
    }

    private fun observeViewModel() {
        lifecycleScope.launch {
            repeatOnLifecycle(Lifecycle.State.STARTED) {
                viewModel.uiState.collect { render(it) }
            }
        }
    }
}'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'Android Basics'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_032'
      ..topicId = 'kotlin'
      ..title = 'Fragment'
      ..description = 'Fragments are reusable UI components. Use ViewBinding and handle the view lifecycle carefully.'
      ..code = '''@AndroidEntryPoint
class UserListFragment : Fragment(R.layout.fragment_user_list) {

    private val viewModel: UserViewModel by viewModels()
    // Binding is only valid between onCreateView and onDestroyView
    private var _binding: FragmentUserListBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentUserListBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val adapter = UserAdapter { user ->
            // Navigate to detail screen
            findNavController().navigate(
                UserListFragmentDirections.toDetail(user.id)
            )
        }
        binding.recyclerView.adapter = adapter

        viewLifecycleOwner.lifecycleScope.launch {
            repeatOnLifecycle(Lifecycle.State.STARTED) {
                viewModel.users.collect { adapter.submitList(it) }
            }
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null   // ✅ Prevent memory leak
    }
}'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'Android Basics'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_033'
      ..topicId = 'kotlin'
      ..title = 'Intent & Navigation'
      ..description = 'Use Intents to start Activities and pass data between them.'
      ..code = '''// Explicit Intent — go to a specific Activity
val intent = Intent(this, ProfileActivity::class.java).apply {
    putExtra("USER_ID", 42)
    putExtra("USER_NAME", "Aryant")
    putExtra("IS_PREMIUM", true)
}
startActivity(intent)

// Retrieve data in ProfileActivity
class ProfileActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val userId   = intent.getIntExtra("USER_ID", -1)
        val userName = intent.getStringExtra("USER_NAME") ?: "Guest"
        val isPremium = intent.getBooleanExtra("IS_PREMIUM", false)
        println("\$userName (id=\$userId, premium=\$isPremium)")
    }
}

// Implicit Intent — let the system pick the app
val shareIntent = Intent(Intent.ACTION_SEND).apply {
    type = "text/plain"
    putExtra(Intent.EXTRA_TEXT, "Check out this app!")
}
startActivity(Intent.createChooser(shareIntent, "Share via"))

// Open URL in browser
val browserIntent = Intent(
    Intent.ACTION_VIEW,
    Uri.parse("https://kotlinlang.org")
)
startActivity(browserIntent)

// startActivityForResult replacement (modern approach)
val resultLauncher = registerForActivityResult(
    ActivityResultContracts.StartActivityForResult()
) { result ->
    if (result.resultCode == RESULT_OK) {
        val data = result.data?.getStringExtra("RESULT")
        println("Got result: \$data")
    }
}
resultLauncher.launch(Intent(this, PickerActivity::class.java))'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'Android Basics'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_034'
      ..topicId = 'kotlin'
      ..title = 'WorkManager'
      ..description = 'Schedule guaranteed background work that survives process death and device restarts.'
      ..code = '''// Define the work
class SyncWorker(
    context: Context,
    params: WorkerParameters
) : CoroutineWorker(context, params) {

    override suspend fun doWork(): Result {
        return try {
            // Get input data
            val userId = inputData.getInt("USER_ID", -1)

            // Do the actual work
            syncUserData(userId)

            // Pass output back
            val output = workDataOf("SYNCED_AT" to System.currentTimeMillis())
            Result.success(output)
        } catch (e: Exception) {
            if (runAttemptCount < 3) Result.retry()  // retry up to 3 times
            else Result.failure()
        }
    }
}

// Schedule the work
val constraints = Constraints.Builder()
    .setRequiredNetworkType(NetworkType.CONNECTED)
    .setRequiresBatteryNotLow(true)
    .build()

val syncRequest = PeriodicWorkRequestBuilder<SyncWorker>(
    repeatInterval = 1, repeatIntervalTimeUnit = TimeUnit.HOURS
)
    .setConstraints(constraints)
    .setInputData(workDataOf("USER_ID" to 42))
    .build()

WorkManager.getInstance(context).enqueueUniquePeriodicWork(
    "user_sync",                         // unique name
    ExistingPeriodicWorkPolicy.KEEP,     // don't restart if already running
    syncRequest
)

// Observe work status
WorkManager.getInstance(context)
    .getWorkInfoByIdLiveData(syncRequest.id)
    .observe(this) { info ->
        if (info?.state == WorkInfo.State.SUCCEEDED) {
            println("Sync complete!")
        }
    }'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Android Basics'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 10. UI
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_035'
      ..topicId = 'kotlin'
      ..title = 'XML Layouts & ViewBinding'
      ..description = 'Define UI in XML, then bind it safely with ViewBinding to avoid null crashes.'
      ..code = '''<!-- res/layout/fragment_home.xml -->
<LinearLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:padding="16dp">

    <TextView
        android:id="@+id/tvTitle"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Welcome"
        android:textSize="24sp"
        android:textStyle="bold" />

    <EditText
        android:id="@+id/etInput"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:hint="Enter name..." />

    <Button
        android:id="@+id/btnSubmit"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Submit" />
</LinearLayout>

// --- In Fragment (Kotlin) ---
// ViewBinding gives you null-safe access to every view with an ID
class HomeFragment : Fragment(R.layout.fragment_home) {

    private var _binding: FragmentHomeBinding? = null
    private val binding get() = _binding!!

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        _binding = FragmentHomeBinding.bind(view)

        binding.tvTitle.text = "Hello!"
        binding.btnSubmit.setOnClickListener {
            val name = binding.etInput.text.toString()
            binding.tvTitle.text = "Hello, \$name!"
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null   // avoid memory leak
    }
}'''
      ..language = 'xml'..difficulty = 'easy'..section = 'UI'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_036'
      ..topicId = 'kotlin'
      ..title = 'Jetpack Compose Basics'
      ..description = 'Build UI with composable functions. No XML needed — UI is Kotlin code.'
      ..code = '''// A Composable is just a function annotated with @Composable
@Composable
fun ProfileCard(
    name: String,
    role: String,
    imageUrl: String
) {
    // Card wraps content with elevation and rounded corners
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp),
        elevation = CardDefaults.cardElevation(4.dp)
    ) {
        Row(
            modifier = Modifier.padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Async image loading
            AsyncImage(
                model = imageUrl,
                contentDescription = "Profile photo of \$name",
                modifier = Modifier
                    .size(64.dp)
                    .clip(CircleShape)
            )

            Spacer(modifier = Modifier.width(16.dp))

            Column {
                Text(
                    text = name,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = role,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

// Preview it in Android Studio without running the app
@Preview(showBackground = true)
@Composable
fun ProfileCardPreview() {
    MyAppTheme {
        ProfileCard("Aryant", "Android Developer", "https://...")
    }
}'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'UI'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_037'
      ..topicId = 'kotlin'
      ..title = 'Compose State & Interaction'
      ..description = 'Manage local UI state with remember + mutableStateOf, and handle user input reactively.'
      ..code = '''@Composable
fun LoginScreen(onLoginSuccess: (String) -> Unit) {

    // remember keeps value alive across recompositions
    var email by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    var isPasswordVisible by remember { mutableStateOf(false) }
    var isLoading by remember { mutableStateOf(false) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(24.dp),
        verticalArrangement = Arrangement.Center
    ) {
        // Controlled TextField — value driven by state
        OutlinedTextField(
            value = email,
            onValueChange = { email = it },    // update state on each keystroke
            label = { Text("Email") },
            leadingIcon = { Icon(Icons.Default.Email, contentDescription = null) },
            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Email),
            modifier = Modifier.fillMaxWidth()
        )

        Spacer(Modifier.height(12.dp))

        OutlinedTextField(
            value = password,
            onValueChange = { password = it },
            label = { Text("Password") },
            visualTransformation = if (isPasswordVisible)
                VisualTransformation.None
            else PasswordVisualTransformation(),
            trailingIcon = {
                IconButton(onClick = { isPasswordVisible = !isPasswordVisible }) {
                    Icon(
                        if (isPasswordVisible) Icons.Default.VisibilityOff
                        else Icons.Default.Visibility,
                        contentDescription = "Toggle password"
                    )
                }
            },
            modifier = Modifier.fillMaxWidth()
        )

        Spacer(Modifier.height(24.dp))

        Button(
            onClick = {
                isLoading = true
                onLoginSuccess(email)
            },
            enabled = email.isNotBlank() && password.length >= 6 && !isLoading,
            modifier = Modifier.fillMaxWidth()
        ) {
            if (isLoading) CircularProgressIndicator(Modifier.size(20.dp))
            else Text("Login")
        }
    }
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'UI'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 11. NETWORKING
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_038'
      ..topicId = 'kotlin'
      ..title = 'Retrofit Setup'
      ..description = 'Define API endpoints as interface methods and let Retrofit generate the implementation.'
      ..code = '''// 1. Define your API interface
interface GithubApi {

    @GET("users/{username}")
    suspend fun getUser(@Path("username") username: String): GithubUser

    @GET("users/{username}/repos")
    suspend fun getRepos(
        @Path("username") username: String,
        @Query("sort") sort: String = "updated",
        @Query("per_page") perPage: Int = 30
    ): List<GithubRepo>

    @POST("repos/{owner}/{repo}/issues")
    suspend fun createIssue(
        @Path("owner") owner: String,
        @Path("repo") repo: String,
        @Body request: CreateIssueRequest,
        @Header("Authorization") token: String
    ): GithubIssue

    @DELETE("repos/{owner}/{repo}/issues/{number}")
    suspend fun deleteIssue(
        @Path("owner") owner: String,
        @Path("repo") repo: String,
        @Path("number") issueNumber: Int
    ): Response<Unit>
}

// 2. Build Retrofit instance (typically in a DI module)
val okHttpClient = OkHttpClient.Builder()
    .addInterceptor { chain ->
        chain.proceed(
            chain.request().newBuilder()
                .addHeader("Accept", "application/vnd.github+json")
                .build()
        )
    }
    .connectTimeout(30, TimeUnit.SECONDS)
    .readTimeout(30, TimeUnit.SECONDS)
    .build()

val retrofit = Retrofit.Builder()
    .baseUrl("https://api.github.com/")
    .client(okHttpClient)
    .addConverterFactory(GsonConverterFactory.create())
    .build()

val githubApi = retrofit.create(GithubApi::class.java)

// 3. Use in ViewModel
viewModelScope.launch {
    val user  = githubApi.getUser("torvalds")
    val repos = githubApi.getRepos("torvalds")
    println("\${user.name} has \${repos.size} public repos")
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Networking'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_039'
      ..topicId = 'kotlin'
      ..title = 'Safe API Calls with Result'
      ..description = 'Wrap network calls to handle success and error uniformly across the app.'
      ..code = '''// Generic sealed Result type
sealed class ApiResult<out T> {
    data class Success<T>(val data: T)  : ApiResult<T>()
    data class Error(
        val code: Int? = null,
        val message: String
    ) : ApiResult<Nothing>()
}

// Safe wrapper — converts exceptions into ApiResult.Error
suspend fun <T> safeApiCall(call: suspend () -> T): ApiResult<T> {
    return try {
        ApiResult.Success(call())
    } catch (e: HttpException) {
        ApiResult.Error(
            code = e.code(),
            message = when (e.code()) {
                401 -> "Unauthorized — please log in again"
                403 -> "You don't have permission"
                404 -> "Resource not found"
                500 -> "Server error — try again later"
                else -> e.message()
            }
        )
    } catch (e: IOException) {
        ApiResult.Error(message = "No internet connection")
    } catch (e: Exception) {
        ApiResult.Error(message = e.message ?: "Something went wrong")
    }
}

// Repository layer
class UserRepository(private val api: GithubApi) {

    suspend fun getUser(username: String): ApiResult<GithubUser> =
        safeApiCall { api.getUser(username) }
}

// ViewModel
fun loadUser(username: String) {
    viewModelScope.launch {
        _uiState.value = UiState.Loading
        when (val result = repository.getUser(username)) {
            is ApiResult.Success -> _uiState.value = UiState.Success(result.data)
            is ApiResult.Error   -> _uiState.value = UiState.Error(result.message)
        }
    }
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Networking'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_040'
      ..topicId = 'kotlin'
      ..title = 'JSON Serialization (kotlinx)'
      ..description = 'Use @Serializable to convert between JSON and Kotlin objects without reflection.'
      ..code = '''import kotlinx.serialization.*
import kotlinx.serialization.json.*

// Mark class as serializable
@Serializable
data class User(
    val id: Int,
    val name: String,
    @SerialName("email_address") val email: String,  // map different JSON key
    val age: Int? = null,                             // optional field
    @Transient val sessionToken: String = ""          // excluded from JSON
)

@Serializable
data class ApiResponse<T>(
    val success: Boolean,
    val data: T,
    val message: String? = null
)

val json = Json {
    ignoreUnknownKeys = true   // don't crash on extra fields
    isLenient = true           // be forgiving with non-standard JSON
    prettyPrint = true         // readable output
}

// Decode JSON string → Kotlin object
val jsonString = """
    {"id": 1, "name": "Aryant", "email_address": "a@dev.com"}
"""
val user = json.decodeFromString<User>(jsonString)
println(user.name)   // Aryant

// Encode Kotlin object → JSON string
val encoded = json.encodeToString(user)
println(encoded)
// {"id":1,"name":"Aryant","email_address":"a@dev.com"}

// Decode a list
val usersJson = """[{"id":1,"name":"Alice","email_address":"alice@x.com"}]"""
val users = json.decodeFromString<List<User>>(usersJson)

// Decode generic wrapper
val responseJson = """{"success":true,"data":{"id":1,"name":"Alice","email_address":"a@x.com"}}"""
val response = json.decodeFromString<ApiResponse<User>>(responseJson)
println(response.data.name)  // Alice'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'Networking'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 12. PERSISTENCE
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_041'
      ..topicId = 'kotlin'
      ..title = 'Room Database'
      ..description = 'Room is SQLite with compile-time query verification and Flow support.'
      ..code = '''// 1. Entity — defines the table
@Entity(tableName = "users")
data class UserEntity(
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    @ColumnInfo(name = "full_name") val name: String,
    val email: String,
    val createdAt: Long = System.currentTimeMillis(),
    val isActive: Boolean = true
)

// 2. DAO — defines queries
@Dao
interface UserDao {
    @Query("SELECT * FROM users WHERE isActive = 1 ORDER BY full_name ASC")
    fun observeActiveUsers(): Flow<List<UserEntity>>   // auto-updates!

    @Query("SELECT * FROM users WHERE id = :userId")
    suspend fun getUserById(userId: Int): UserEntity?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(user: UserEntity): Long   // returns new rowId

    @Update
    suspend fun update(user: UserEntity)

    @Delete
    suspend fun delete(user: UserEntity)

    @Query("DELETE FROM users WHERE id = :userId")
    suspend fun deleteById(userId: Int)

    @Query("SELECT COUNT(*) FROM users")
    suspend fun getUserCount(): Int
}

// 3. Database — abstract class connecting entities and DAOs
@Database(entities = [UserEntity::class], version = 1, exportSchema = false)
abstract class AppDatabase : RoomDatabase() {
    abstract fun userDao(): UserDao

    companion object {
        @Volatile private var INSTANCE: AppDatabase? = null

        fun getInstance(context: Context): AppDatabase {
            return INSTANCE ?: synchronized(this) {
                Room.databaseBuilder(context, AppDatabase::class.java, "app_db")
                    .fallbackToDestructiveMigration()  // dev only!
                    .build()
                    .also { INSTANCE = it }
            }
        }
    }
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Persistence'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_042'
      ..topicId = 'kotlin'
      ..title = 'DataStore Preferences'
      ..description = 'Modern replacement for SharedPreferences. Uses coroutines and Flow — no ANR risk.'
      ..code = '''import androidx.datastore.preferences.core.*
import androidx.datastore.preferences.preferencesDataStore

// 1. Create DataStore extension on Context (call once at top of file)
val Context.dataStore by preferencesDataStore(name = "user_preferences")

// 2. Define keys
object PreferenceKeys {
    val THEME        = stringPreferencesKey("theme")   // "light" / "dark"
    val FONT_SIZE    = intPreferencesKey("font_size")
    val NOTIFICATIONS_ENABLED = booleanPreferencesKey("notifications")
    val AUTH_TOKEN   = stringPreferencesKey("auth_token")
}

// 3. Create a preferences manager
class UserPreferences(private val context: Context) {

    // Read a preference as a Flow (auto-updates on change)
    val theme: Flow<String> = context.dataStore.data
        .catch { if (it is IOException) emit(emptyPreferences()) else throw it }
        .map { prefs -> prefs[PreferenceKeys.THEME] ?: "light" }

    val isNotificationsEnabled: Flow<Boolean> = context.dataStore.data
        .map { prefs -> prefs[PreferenceKeys.NOTIFICATIONS_ENABLED] ?: true }

    // Write a preference
    suspend fun setTheme(theme: String) {
        context.dataStore.edit { prefs ->
            prefs[PreferenceKeys.THEME] = theme
        }
    }

    suspend fun saveAuthToken(token: String) {
        context.dataStore.edit { prefs ->
            prefs[PreferenceKeys.AUTH_TOKEN] = token
        }
    }

    suspend fun clearAll() {
        context.dataStore.edit { it.clear() }
    }
}

// Usage in ViewModel
class SettingsViewModel(private val prefs: UserPreferences) : ViewModel() {
    val theme = prefs.theme.stateIn(viewModelScope, SharingStarted.Eagerly, "light")

    fun toggleTheme() {
        viewModelScope.launch {
            val current = theme.value
            prefs.setTheme(if (current == "light") "dark" else "light")
        }
    }
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Persistence'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_043'
      ..topicId = 'kotlin'
      ..title = 'SharedPreferences'
      ..description = 'Simple key-value storage for small amounts of primitive data. Synchronous — use carefully on main thread.'
      ..code = '''// Getting a SharedPreferences instance
val prefs = getSharedPreferences("MyAppPrefs", Context.MODE_PRIVATE)
// or for single-file default prefs:
val defaultPrefs = PreferenceManager.getDefaultSharedPreferences(context)

// Writing values
prefs.edit()
    .putString("username", "Aryant")
    .putInt("login_count", 5)
    .putBoolean("onboarding_done", true)
    .putLong("last_login", System.currentTimeMillis())
    .apply()  // async write (prefer over .commit())
    // .commit() // synchronous — returns Boolean, use only when you NEED confirmation

// Reading values (with defaults)
val username   = prefs.getString("username", "Guest")      // "Aryant"
val loginCount = prefs.getInt("login_count", 0)            // 5
val isDone     = prefs.getBoolean("onboarding_done", false) // true

// Remove a single key
prefs.edit().remove("username").apply()

// Clear everything
prefs.edit().clear().apply()

// Listen to changes
val listener = SharedPreferences.OnSharedPreferenceChangeListener { _, key ->
    println("Preference changed: \$key")
}
prefs.registerOnSharedPreferenceChangeListener(listener)
// Don't forget to unregister to avoid memory leaks!
prefs.unregisterOnSharedPreferenceChangeListener(listener)

// 🔑 For sensitive data (tokens), use EncryptedSharedPreferences:
val encryptedPrefs = EncryptedSharedPreferences.create(
    context,
    "secret_prefs",
    MasterKey.Builder(context).setKeyScheme(MasterKey.KeyScheme.AES256_GCM).build(),
    EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
    EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
)'''
      ..language = 'kotlin'..difficulty = 'easy'..section = 'Persistence'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 13. ARCHITECTURE
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_044'
      ..topicId = 'kotlin'
      ..title = 'MVVM Pattern'
      ..description = 'Model-View-ViewModel separates UI from business logic. ViewModel survives configuration changes.'
      ..code = '''// MODEL — data layer
data class User(val id: Int, val name: String, val email: String)

// REPOSITORY — single source of truth (decides local vs remote)
class UserRepository(
    private val api: UserApi,
    private val dao: UserDao
) {
    fun getUsers(): Flow<List<User>> = flow {
        emit(dao.getAll().map { it.toDomain() })  // emit cached data first
        try {
            val fresh = api.getUsers()             // fetch from network
            dao.insertAll(fresh.map { it.toEntity() })
            emit(fresh.map { it.toDomain() })      // emit fresh data
        } catch (e: Exception) {
            // Cache is already emitted — silently use it
        }
    }
}

// VIEWMODEL — exposes state to UI, survives rotation
@HiltViewModel
class UserViewModel @Inject constructor(
    private val repo: UserRepository
) : ViewModel() {

    private val _state = MutableStateFlow<UiState>(UiState.Loading)
    val state: StateFlow<UiState> = _state.asStateFlow()

    init { loadUsers() }

    private fun loadUsers() {
        viewModelScope.launch {
            repo.getUsers()
                .catch { _state.value = UiState.Error(it.message ?: "Error") }
                .collect { _state.value = UiState.Success(it) }
        }
    }
}

// VIEW (Fragment) — observes state, never holds business logic
@AndroidEntryPoint
class UsersFragment : Fragment() {
    private val vm: UserViewModel by viewModels()

    override fun onViewCreated(view: View, b: Bundle?) {
        viewLifecycleOwner.lifecycleScope.launch {
            repeatOnLifecycle(Lifecycle.State.STARTED) {
                vm.state.collect { state ->
                    when (state) {
                        is UiState.Loading -> showLoading()
                        is UiState.Success -> showUsers(state.users)
                        is UiState.Error   -> showError(state.msg)
                    }
                }
            }
        }
    }
}'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'Architecture'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_045'
      ..topicId = 'kotlin'
      ..title = 'Clean Architecture'
      ..description = 'Separate the app into Domain, Data, and Presentation layers with strict dependency rules.'
      ..code = '''// ── DOMAIN LAYER ── (pure Kotlin, zero Android imports)

// Entity — core business object
data class User(val id: Int, val name: String, val email: String)

// Repository interface — domain defines the contract
interface UserRepository {
    fun getUsers(): Flow<List<User>>
    suspend fun getUserById(id: Int): User?
    suspend fun createUser(user: User): Int
}

// UseCase — single business operation
class GetActiveUsersUseCase(private val repo: UserRepository) {
    // UseCases often have an operator fun invoke for clean call syntax
    operator fun invoke(): Flow<List<User>> =
        repo.getUsers().map { it.filter { user -> user.isActive } }
}

// ── DATA LAYER ── (implements domain contracts, knows about APIs/DB)
class UserRepositoryImpl(
    private val api: UserApiService,
    private val dao: UserDao,
    private val mapper: UserMapper
) : UserRepository {

    override fun getUsers(): Flow<List<User>> =
        dao.observeAll()
            .map { entities -> entities.map(mapper::entityToDomain) }
            .onStart {
                // Refresh from network when Flow starts
                try {
                    val remote = api.getUsers()
                    dao.insertAll(remote.map(mapper::dtoToEntity))
                } catch (_: Exception) { /* use cache */ }
            }
}

// ── PRESENTATION LAYER ── (ViewModel + UI)
@HiltViewModel
class UserViewModel @Inject constructor(
    private val getActiveUsers: GetActiveUsersUseCase
) : ViewModel() {

    val users: StateFlow<List<User>> = getActiveUsers()
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())
}

// DEPENDENCY DIRECTION (strict!):
// Presentation → Domain ← Data
// Domain knows NOTHING about Android or Data layer implementations'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Architecture'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_046'
      ..topicId = 'kotlin'
      ..title = 'Repository Pattern'
      ..description = 'Repository is the single source of truth — decides whether to serve cached or fresh data.'
      ..code = '''class ProductRepository(
    private val api: ProductApi,
    private val dao: ProductDao,
    private val prefs: UserPreferences
) {
    // Offline-first strategy:
    // 1. Emit cached data immediately
    // 2. Fetch fresh data from network
    // 3. Save to cache, emit updated data
    fun getProducts(categoryId: Int): Flow<List<Product>> = flow {

        // Step 1 — emit local cache right away (fast!)
        val cached = dao.getByCategory(categoryId)
        if (cached.isNotEmpty()) emit(cached.map { it.toDomain() })

        // Step 2 — hit network
        try {
            val fresh = api.getProducts(categoryId)

            // Step 3 — update cache
            dao.deleteByCategory(categoryId)
            dao.insertAll(fresh.map { it.toEntity() })

            // Step 4 — emit fresh data
            emit(fresh.map { it.toDomain() })
        } catch (e: Exception) {
            // Network failed — local cache already emitted, that's fine
            if (cached.isEmpty()) throw e  // only throw if we have nothing
        }
    }.flowOn(Dispatchers.IO)  // run on IO thread pool

    suspend fun toggleFavorite(productId: Int) {
        val product = dao.getById(productId) ?: return
        dao.update(product.copy(isFavorite = !product.isFavorite))
        // Optionally sync with server:
        try { api.setFavorite(productId, !product.isFavorite) }
        catch (_: Exception) { /* will sync later via WorkManager */ }
    }
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Architecture'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 14. SCOPE FUNCTIONS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_047'
      ..topicId = 'kotlin'
      ..title = 'let'
      ..description = 'let runs a block on the object (as "it") and returns the block\'s result. Best for null checks.'
      ..code = '''val username: String? = fetchUsername()  // might be null

// Without let — verbose null check
if (username != null) {
    val trimmed = username.trim()
    println("Hello, \$trimmed")
}

// With let — clean and concise
username?.let { name ->
    val trimmed = name.trim()
    println("Hello, \$trimmed")  // only runs if username != null
}

// let returns the last expression — useful for transformation chains
val displayName = username
    ?.trim()
    ?.let { it.replaceFirstChar { c -> c.uppercase() } }
    ?: "Guest"
println(displayName)  // "Aryant" or "Guest" if null

// let for scoping a temp variable
val result = listOf(1, 2, 3, 4, 5).let { numbers ->
    val sum = numbers.sum()
    val avg = sum / numbers.size.toDouble()
    "\$sum (avg: \$avg)"   // returned from let
}
println(result)   // 15 (avg: 3.0)

// Common use: execute code block only when value is non-null
user?.let { safeUser ->
    updateProfile(safeUser)
    sendWelcomeEmail(safeUser.email)
    logActivity("profile_updated", safeUser.id)
}'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'Scope Functions'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_048'
      ..topicId = 'kotlin'
      ..title = 'apply, run, also, with'
      ..description = 'Four more scope functions — each with a different receiver and return value.'
      ..code = '''// apply — "this" is the object, RETURNS the object
// Best for object configuration / builder pattern
val request = HttpRequest().apply {
    url = "https://api.example.com/users"
    method = "POST"
    addHeader("Authorization", "Bearer \$token")
    addHeader("Content-Type", "application/json")
    timeout = 30_000
}   // returns the HttpRequest object

// run — "this" is the object, RETURNS the block result
// Best for computing a value from an object
val isValid = user.run {
    name.isNotBlank()
        && email.contains("@")
        && age in 0..120
}   // returns Boolean

// also — "it" is the object, RETURNS the object
// Best for side effects (logging, debugging) in a chain
val users = repository.getUsers()
    .also { list -> println("Fetched \${list.size} users") }
    .also { list -> analytics.track("users_loaded", mapOf("count" to list.size)) }
    .filter { it.isActive }   // chain continues with the list

// with — "this" is the object, RETURNS block result (not an extension fn)
// Best for calling multiple methods on the same object
val summary = with(order) {
    val itemCount = items.size
    val total = items.sumOf { it.price }
    "Order #\$id: \$itemCount items, total ₹\$total"
}
println(summary)

// Quick reference:
// | Function | Receiver | Returns  | Use for                        |
// |----------|----------|----------|--------------------------------|
// | let      | it       | block    | null checks, transforms        |
// | apply    | this     | object   | builder / config               |
// | run      | this     | block    | compute value from object      |
// | also     | it       | object   | side effects, logging          |
// | with     | this     | block    | multiple calls on same object  |'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'Scope Functions'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 15. GENERICS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_049'
      ..topicId = 'kotlin'
      ..title = 'Generics'
      ..description = 'Write type-safe code that works with any type. Constraints, reified, and variance.'
      ..code = '''// Generic function
fun <T> wrapInList(item: T): List<T> = listOf(item)
val ints = wrapInList(42)       // List<Int>
val strs = wrapInList("hello")  // List<String>

// Generic class
class Stack<T> {
    private val items = mutableListOf<T>()
    fun push(item: T) { items.add(item) }
    fun pop(): T? = if (items.isEmpty()) null else items.removeAt(items.lastIndex)
    fun peek(): T? = items.lastOrNull()
    val size get() = items.size
}

val intStack = Stack<Int>()
intStack.push(10); intStack.push(20); intStack.push(30)
println(intStack.pop())   // 30
println(intStack.peek())  // 20

// Upper bound constraints — T must be Number or a subtype
fun <T : Number> sumList(list: List<T>): Double =
    list.sumOf { it.toDouble() }

println(sumList(listOf(1, 2, 3)))        // 6.0  (Int)
println(sumList(listOf(1.5, 2.5, 3.0)))  // 7.0  (Double)

// reified — access the type T at runtime (only in inline functions)
inline fun <reified T> parseJson(json: String): T =
    Gson().fromJson(json, T::class.java)

val user: User = parseJson("""{"id":1,"name":"Aryant"}""")

// Variance
// out T (covariant) — can only READ T (producer)
fun printAll(items: List<out Number>) {
    items.forEach { println(it.toDouble()) }
}
printAll(listOf(1, 2, 3))   // works with List<Int> too

// in T (contravariant) — can only WRITE T (consumer)
fun fillWith(list: MutableList<in Int>, value: Int) {
    list.add(value)
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Generics'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 16. FUNCTIONAL COLLECTIONS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_050'
      ..topicId = 'kotlin'
      ..title = 'map, filter, reduce'
      ..description = 'Core functional operations to transform, select, and aggregate collections.'
      ..code = '''data class Product(val name: String, val price: Double, val inStock: Boolean)

val products = listOf(
    Product("Phone",  69999.0, true),
    Product("Laptop", 99999.0, false),
    Product("Tablet", 49999.0, true),
    Product("Watch",  29999.0, true)
)

// filter — keep only items that match the predicate
val available = products.filter { it.inStock }
println("In stock: \${available.size}")  // In stock: 3

// map — transform each item into something new
val names = available.map { it.name }
println("Available: \$names")  // [Phone, Tablet, Watch]

val discounted = products.map { it.copy(price = it.price * 0.9) }
println(discounted.first().price)  // 62999.1 (10% off)

// reduce — combine all elements into one value (no seed)
val totalCost = available
    .map { it.price }
    .reduce { acc, price -> acc + price }
println("Total: ₹\$totalCost")  // Total: ₹149997.0

// fold — like reduce but with an initial seed value
val priceList = products.fold("Prices: ") { acc, p ->
    acc + "₹\${p.price.toInt()} "
}
println(priceList)  // Prices: ₹69999 ₹99999 ₹49999 ₹29999

// find — first element matching condition (or null)
val expensive = products.find { it.price > 90000 }
println(expensive?.name)  // Laptop

// any / all / none — boolean checks on collection
println(products.any  { it.inStock })      // true
println(products.all  { it.price > 0 })    // true
println(products.none { it.price < 0 })    // true

// count with predicate
println(products.count { it.inStock })  // 3'''
      ..language = 'kotlin'..difficulty = 'easy'..section = 'Functional Collections'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_051'
      ..topicId = 'kotlin'
      ..title = 'flatMap, groupBy, zip'
      ..description = 'Advanced collection operations for flattening, grouping, and pairing data.'
      ..code = '''data class Order(val id: Int, val items: List<String>)

val orders = listOf(
    Order(1, listOf("Keyboard", "Mouse")),
    Order(2, listOf("Monitor")),
    Order(3, listOf("Headphones", "Webcam", "Mic"))
)

// flatMap — map then flatten one level
val allItems = orders.flatMap { it.items }
println(allItems)
// [Keyboard, Mouse, Monitor, Headphones, Webcam, Mic]

// distinct after flatMap
val uniqueItems = allItems.distinct()
println(uniqueItems.size)  // 6

// groupBy — partition into a Map<Key, List<Value>>
val words = listOf("ant", "bear", "cat", "bee", "ape", "crane")
val byFirstLetter = words.groupBy { it.first() }
println(byFirstLetter)
// {a=[ant, ape], b=[bear, bee], c=[cat, crane]}

val byLength = words.groupBy { it.length }
println(byLength)  // {3=[ant, cat, bee, ape], 4=[bear], 5=[crane]}

// zip — pair two lists together
val keys   = listOf("id", "name", "email")
val values = listOf(1, "Aryant", "a@dev.com")
val zipped = keys.zip(values)
println(zipped)  // [(id, 1), (name, Aryant), (email, a@dev.com)]

// zip with transform
val combined = keys.zip(values) { k, v -> "\$k=\$v" }
println(combined)  // [id=1, name=Aryant, email=a@dev.com]

// Chaining operations — pipeline style
val result = orders
    .flatMap { it.items }          // all items in one list
    .filter { it.length > 3 }     // remove short names
    .map { it.uppercase() }        // uppercase
    .sorted()                      // alphabetically
    .distinct()                    // remove duplicates
println(result)'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'Functional Collections'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 17. FLOW & STATEFLOW
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_052'
      ..topicId = 'kotlin'
      ..title = 'Flow Operators'
      ..description = 'Transform, filter, and combine Flows before collecting. Lazy — nothing runs until collect.'
      ..code = '''import kotlinx.coroutines.flow.*

// Source flow
fun getPriceUpdates(symbol: String): Flow<Double> = flow {
    while (true) {
        val price = fetchPrice(symbol)  // suspend network call
        emit(price)
        delay(5_000)  // poll every 5 seconds
    }
}

// Apply operators
getPriceUpdates("BTC")
    .map { price -> price * 83.0 }        // USD → INR
    .filter { it > 5_000_000.0 }          // only significant prices
    .distinctUntilChanged()               // skip if same as last emit
    .debounce(1_000)                      // wait 1s after last emit
    .onEach { price ->
        println("Price update: ₹\$price") // side effect (logging)
    }
    .catch { e ->
        println("Error: \${e.message}")   // handle errors in the pipeline
        emit(0.0)                         // emit fallback value
    }
    .collect { price ->
        updatePriceDisplay(price)         // terminal operator
    }

// buffer — don't make emitter wait for slow collector
fastProducerFlow()
    .buffer(capacity = 10)  // queue up to 10 items
    .collect { slowProcess(it) }

// conflate — skip slow collector; always use latest value
stockPricesFlow()
    .conflate()  // if collector is slow, drop intermediate values
    .collect { updateChart(it) }

// combine — merge two flows, emits when EITHER changes
val nameFlow  = MutableStateFlow("Aryant")
val scoreFlow = MutableStateFlow(0)

nameFlow.combine(scoreFlow) { name, score ->
    "\$name: \$score points"
}.collect { println(it) }'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Flow & StateFlow'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_053'
      ..topicId = 'kotlin'
      ..title = 'callbackFlow'
      ..description = 'Bridge callback-based APIs (sensors, listeners, Firebase) into a Flow.'
      ..code = '''import kotlinx.coroutines.flow.*
import kotlinx.coroutines.channels.awaitClose

// Convert a listener-based API to Flow
fun NetworkMonitor.networkStateFlow(context: Context): Flow<Boolean> =
    callbackFlow {

        // Set up the callback
        val callback = object : ConnectivityManager.NetworkCallback() {
            override fun onAvailable(network: Network) {
                trySend(true)   // non-suspending emit — safe from callbacks
            }
            override fun onLost(network: Network) {
                trySend(false)
            }
        }

        val cm = context.getSystemService(ConnectivityManager::class.java)
        cm.registerDefaultNetworkCallback(callback)

        // Emit current state immediately
        val isConnected = cm.activeNetwork != null
        trySend(isConnected)

        // awaitClose runs when the collector cancels or the scope ends
        awaitClose {
            cm.unregisterNetworkCallback(callback)  // clean up!
        }
    }

// Firebase Realtime Database → Flow
fun getUserFlow(userId: String): Flow<User?> = callbackFlow {
    val ref = Firebase.database.getReference("users/\$userId")

    val listener = object : ValueEventListener {
        override fun onDataChange(snapshot: DataSnapshot) {
            trySend(snapshot.getValue(User::class.java))
        }
        override fun onCancelled(error: DatabaseError) {
            close(error.toException())  // close flow with error
        }
    }

    ref.addValueEventListener(listener)
    awaitClose { ref.removeEventListener(listener) }
}

// Usage
viewModelScope.launch {
    networkStateFlow(context)
        .distinctUntilChanged()
        .collect { isOnline ->
            if (isOnline) syncData() else showOfflineBanner()
        }
}'''
      ..language = 'kotlin'..difficulty = 'very_hard'..section = 'Flow & StateFlow'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 18. DEPENDENCY INJECTION (HILT)
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_054'
      ..topicId = 'kotlin'
      ..title = 'Hilt Setup & Modules'
      ..description = 'Hilt automates dependency injection in Android. @Module tells Hilt how to create objects.'
      ..code = '''// 1. Add @HiltAndroidApp to Application class
@HiltAndroidApp
class MyApp : Application()

// 2. Network Module — provides Retrofit and OkHttpClient
@Module
@InstallIn(SingletonComponent::class)  // lives as long as the app
object NetworkModule {

    @Provides
    @Singleton  // only ONE instance created
    fun provideOkHttpClient(
        @ApplicationContext context: Context
    ): OkHttpClient = OkHttpClient.Builder()
        .addInterceptor(HttpLoggingInterceptor().apply {
            level = if (BuildConfig.DEBUG)
                HttpLoggingInterceptor.Level.BODY
            else HttpLoggingInterceptor.Level.NONE
        })
        .build()

    @Provides
    @Singleton
    fun provideRetrofit(client: OkHttpClient): Retrofit =
        Retrofit.Builder()
            .baseUrl(BuildConfig.BASE_URL)
            .client(client)
            .addConverterFactory(GsonConverterFactory.create())
            .build()

    @Provides
    @Singleton
    fun provideUserApi(retrofit: Retrofit): UserApi =
        retrofit.create(UserApi::class.java)
}

// 3. Database Module
@Module
@InstallIn(SingletonComponent::class)
object DatabaseModule {

    @Provides
    @Singleton
    fun provideDatabase(@ApplicationContext ctx: Context): AppDatabase =
        Room.databaseBuilder(ctx, AppDatabase::class.java, "app.db")
            .build()

    @Provides
    fun provideUserDao(db: AppDatabase): UserDao = db.userDao()
}

// 4. Repository binding — bind interface to implementation
@Module
@InstallIn(SingletonComponent::class)
abstract class RepositoryModule {

    @Binds
    @Singleton
    abstract fun bindUserRepository(
        impl: UserRepositoryImpl   // Hilt injects UserRepositoryImpl
    ): UserRepository              // wherever UserRepository is requested
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Dependency Injection'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_055'
      ..topicId = 'kotlin'
      ..title = 'Hilt in ViewModel & UI'
      ..description = 'Inject dependencies into ViewModels and Android components using @HiltViewModel and @AndroidEntryPoint.'
      ..code = '''// ViewModel — annotate with @HiltViewModel
// Hilt automatically injects all @Inject-annotated constructor params
@HiltViewModel
class UserViewModel @Inject constructor(
    private val getUsersUseCase: GetUsersUseCase,
    private val createUserUseCase: CreateUserUseCase,
    private val analytics: Analytics
) : ViewModel() {

    private val _state = MutableStateFlow<UiState>(UiState.Loading)
    val state = _state.asStateFlow()

    init {
        loadUsers()
        analytics.track("user_screen_opened")
    }

    fun loadUsers() {
        viewModelScope.launch {
            getUsersUseCase()
                .catch { _state.value = UiState.Error(it.message ?: "Error") }
                .collect { _state.value = UiState.Success(it) }
        }
    }
}

// Fragment — annotate with @AndroidEntryPoint
@AndroidEntryPoint
class UserFragment : Fragment() {

    // ViewModel is automatically injected — no factory needed!
    private val viewModel: UserViewModel by viewModels()

    // Direct field injection (for non-ViewModel dependencies)
    @Inject lateinit var imageLoader: ImageLoader

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        viewLifecycleOwner.lifecycleScope.launch {
            repeatOnLifecycle(Lifecycle.State.STARTED) {
                viewModel.state.collect { state ->
                    when (state) {
                        is UiState.Loading -> showLoading()
                        is UiState.Success -> showUsers(state.users)
                        is UiState.Error   -> showError(state.msg)
                    }
                }
            }
        }
    }
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Dependency Injection'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 19. JETPACK COMPOSE (ADVANCED)
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_056'
      ..topicId = 'kotlin'
      ..title = 'LazyColumn & Lists'
      ..description = 'LazyColumn is the Compose equivalent of RecyclerView — only renders visible items.'
      ..code = '''@Composable
fun UserListScreen(
    users: List<User>,
    onUserClick: (User) -> Unit,
    onLoadMore: () -> Unit,
    isLoading: Boolean
) {
    val listState = rememberLazyListState()

    // Detect when user scrolls near the end to load more
    LaunchedEffect(listState) {
        snapshotFlow { listState.layoutInfo.visibleItemsInfo.lastOrNull()?.index }
            .filterNotNull()
            .collect { lastVisible ->
                if (lastVisible >= users.size - 5) {
                    onLoadMore()  // trigger pagination
                }
            }
    }

    LazyColumn(
        state = listState,
        contentPadding = PaddingValues(horizontal = 16.dp, vertical = 8.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)  // gap between items
    ) {
        // Header item
        item {
            Text(
                text = "\${users.size} Users",
                style = MaterialTheme.typography.titleMedium,
                modifier = Modifier.padding(bottom = 8.dp)
            )
        }

        // User items
        items(
            items = users,
            key = { it.id }  // stable key prevents flicker on updates
        ) { user ->
            UserCard(
                user = user,
                onClick = { onUserClick(user) },
                modifier = Modifier.animateItemPlacement()  // smooth add/remove
            )
        }

        // Loading indicator at the bottom
        if (isLoading) {
            item {
                Box(modifier = Modifier.fillMaxWidth(), contentAlignment = Alignment.Center) {
                    CircularProgressIndicator(modifier = Modifier.padding(16.dp))
                }
            }
        }
    }
}'''
      ..language = 'kotlin'..difficulty = 'medium'..section = 'Jetpack Compose'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_057'
      ..topicId = 'kotlin'
      ..title = 'Navigation in Compose'
      ..description = 'NavHost + NavController manages screen navigation. Pass NavController down through composables.'
      ..code = '''// Define routes as constants (use sealed class for type safety)
sealed class Screen(val route: String) {
    object Home   : Screen("home")
    object Profile: Screen("profile/{userId}") {
        fun createRoute(userId: Int) = "profile/\$userId"
    }
    object Settings : Screen("settings")
}

// Root composable — sets up NavHost
@Composable
fun AppNavigation() {
    val navController = rememberNavController()

    NavHost(
        navController = navController,
        startDestination = Screen.Home.route
    ) {
        composable(Screen.Home.route) {
            HomeScreen(
                onProfileClick = { userId ->
                    navController.navigate(Screen.Profile.createRoute(userId))
                },
                onSettingsClick = {
                    navController.navigate(Screen.Settings.route)
                }
            )
        }

        composable(
            route = Screen.Profile.route,
            arguments = listOf(navArgument("userId") { type = NavType.IntType })
        ) { backStackEntry ->
            val userId = backStackEntry.arguments?.getInt("userId") ?: -1
            ProfileScreen(
                userId = userId,
                onBack = { navController.popBackStack() }
            )
        }

        composable(Screen.Settings.route) {
            SettingsScreen(
                onBack = { navController.popBackStack() }
            )
        }
    }
}

// Navigate with options
navController.navigate(Screen.Profile.createRoute(42)) {
    popUpTo(Screen.Home.route)  // clear back stack up to Home
    launchSingleTop = true      // don't create duplicate destination
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Jetpack Compose'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_058'
      ..topicId = 'kotlin'
      ..title = 'Compose Side Effects'
      ..description = 'LaunchedEffect, DisposableEffect, and SideEffect handle lifecycle-aware operations in Compose.'
      ..code = '''@Composable
fun ChatScreen(chatId: String, viewModel: ChatViewModel = viewModel()) {

    // LaunchedEffect — runs suspend code when key changes
    // Cancelled and restarted if chatId changes
    LaunchedEffect(chatId) {
        viewModel.loadMessages(chatId)   // suspend call, safely here
    }

    // DisposableEffect — for setup + teardown (listeners, subscriptions)
    // key = Unit means run once on composition, cleanup on removal
    DisposableEffect(Unit) {
        val listener = analytics.startTracking("chat_screen")

        onDispose {
            listener.stop()   // called when composable leaves composition
        }
    }

    val messages by viewModel.messages.collectAsState()
    val listState = rememberLazyListState()

    // LaunchedEffect to scroll to bottom when new messages arrive
    LaunchedEffect(messages.size) {
        if (messages.isNotEmpty()) {
            listState.animateScrollToItem(messages.lastIndex)
        }
    }

    // rememberCoroutineScope — get scope tied to composition (not a key)
    val scope = rememberCoroutineScope()

    Column {
        LazyColumn(state = listState, modifier = Modifier.weight(1f)) {
            items(messages, key = { it.id }) { msg ->
                MessageBubble(msg)
            }
        }

        MessageInputBar { text ->
            scope.launch {   // launch from event handler (non-composable)
                viewModel.sendMessage(chatId, text)
            }
        }
    }
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Jetpack Compose'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 20. ERROR HANDLING
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_059'
      ..topicId = 'kotlin'
      ..title = 'try-catch & Result<T>'
      ..description = 'Handle exceptions with try-catch, or use Kotlin\'s Result<T> for cleaner error propagation.'
      ..code = '''// Traditional try-catch-finally
fun readFile(path: String): String {
    val file = File(path)
    return try {
        file.readText()
    } catch (e: FileNotFoundException) {
        println("File not found: \$path")
        ""  // return empty string as fallback
    } catch (e: IOException) {
        println("IO error: \${e.message}")
        ""
    } finally {
        println("readFile() completed")  // always runs
    }
}

// Result<T> — success or failure as a return value
fun divide(a: Int, b: Int): Result<Double> {
    if (b == 0) return Result.failure(ArithmeticException("Cannot divide by zero"))
    return Result.success(a.toDouble() / b)
}

val result = divide(10, 0)
result
    .onSuccess { value -> println("Result: \$value") }
    .onFailure { error -> println("Error: \${error.message}") }

// getOrElse — provide fallback on failure
val value = divide(10, 0).getOrElse { 0.0 }
println(value)  // 0.0

// getOrThrow — rethrow if failed (useful in tests)
val safe = divide(10, 2).getOrThrow()
println(safe)   // 5.0

// runCatching — wrap any block in Result
val parsed = runCatching {
    Json.decodeFromString<User>(rawJson)  // might throw
}
val user = parsed.getOrNull()            // null if failed
val error = parsed.exceptionOrNull()     // exception if failed

// map and recover on Result
val display = runCatching { fetchUser(id) }
    .map { it.name.uppercase() }         // transform on success
    .recover { "Unknown User" }          // fallback on failure
    .getOrDefault("N/A")'''
      ..language = 'kotlin'..difficulty = 'easy'..section = 'Error Handling'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_060'
      ..topicId = 'kotlin'
      ..title = 'Custom Exceptions & Sealed Result'
      ..description = 'Define domain-specific exceptions and use a sealed class for clean error handling across layers.'
      ..code = '''// Custom exception hierarchy
sealed class AppException(message: String, cause: Throwable? = null)
    : Exception(message, cause) {

    class NetworkException(msg: String)         : AppException(msg)
    class AuthException(msg: String = "Unauthorized") : AppException(msg)
    class NotFoundException(resource: String)   : AppException("\$resource not found")
    class ValidationException(field: String, msg: String)
        : AppException("\$field: \$msg")
    class ServerException(val code: Int, msg: String) : AppException("[\$code] \$msg")
}

// Domain-level Result wrapper
sealed class Resource<out T> {
    object Loading                         : Resource<Nothing>()
    data class Success<T>(val data: T)     : Resource<T>()
    data class Error(val error: AppException) : Resource<Nothing>()
}

// Repository converts exceptions to Resource.Error
class AuthRepository(private val api: AuthApi) {

    suspend fun login(email: String, password: String): Resource<User> = try {
        // Validation
        if (!email.contains("@"))
            throw AppException.ValidationException("email", "invalid format")
        if (password.length < 8)
            throw AppException.ValidationException("password", "too short")

        val user = api.login(email, password)
        Resource.Success(user)

    } catch (e: AppException) {
        Resource.Error(e)  // pass through our own exceptions
    } catch (e: HttpException) {
        Resource.Error(AppException.ServerException(e.code(), e.message()))
    } catch (e: IOException) {
        Resource.Error(AppException.NetworkException("Check your connection"))
    }
}

// ViewModel handles Resource states
fun login(email: String, pass: String) {
    viewModelScope.launch {
        _state.value = Resource.Loading
        _state.value = authRepo.login(email, pass)
    }
}

// UI responds to states
when (val state = vm.state.value) {
    is Resource.Loading -> showSpinner()
    is Resource.Success -> navigateHome(state.data)
    is Resource.Error   -> when (val e = state.error) {
        is AppException.ValidationException -> showFieldError(e.message!!)
        is AppException.AuthException       -> showLoginError()
        else                                -> showGenericError(e.message!!)
    }
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Error Handling'..isSaved = false..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 21. TESTING
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'kotlin_061'
      ..topicId = 'kotlin'
      ..title = 'Unit Testing with JUnit & MockK'
      ..description = 'Test ViewModels and business logic in isolation using MockK to fake dependencies.'
      ..code = '''import io.mockk.*
import kotlinx.coroutines.test.*
import org.junit.*

@OptIn(ExperimentalCoroutinesApi::class)
class UserViewModelTest {

    // Replace the Main dispatcher in tests (no Android runtime needed)
    @get:Rule
    val mainDispatcherRule = MainDispatcherRule()

    // Create mocks
    private val repository = mockk<UserRepository>()
    private lateinit var viewModel: UserViewModel

    @Before
    fun setup() {
        viewModel = UserViewModel(repository)
    }

    @Test
    fun `loadUsers — success — state is Success with data`() = runTest {
        // Given
        val fakeUsers = listOf(User(1, "Alice"), User(2, "Bob"))
        coEvery { repository.getUsers() } returns flowOf(fakeUsers)

        // When
        viewModel.loadUsers()
        advanceUntilIdle()   // let coroutines complete

        // Then
        val state = viewModel.state.value
        assert(state is UiState.Success)
        assertEquals(fakeUsers, (state as UiState.Success).users)
    }

    @Test
    fun `loadUsers — network error — state is Error`() = runTest {
        // Given
        coEvery { repository.getUsers() } throws IOException("No internet")

        // When
        viewModel.loadUsers()
        advanceUntilIdle()

        // Then
        val state = viewModel.state.value
        assert(state is UiState.Error)
        assertEquals("No internet", (state as UiState.Error).message)
    }

    @Test
    fun `verify repository is called exactly once`() = runTest {
        coEvery { repository.getUsers() } returns flowOf(emptyList())
        viewModel.loadUsers()
        advanceUntilIdle()
        coVerify(exactly = 1) { repository.getUsers() }
    }

    @After
    fun teardown() {
        unmockkAll()
    }
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Testing'..isSaved = false..lastViewedAt = null,

    Snippet()
      ..snippetId = 'kotlin_062'
      ..topicId = 'kotlin'
      ..title = 'Testing Flows & StateFlow'
      ..description = 'Use Turbine to test Flow emissions cleanly and assert on StateFlow values.'
      ..code = '''import app.cash.turbine.*   // Turbine library for Flow testing
import kotlinx.coroutines.test.*

class UserRepositoryTest {

    private val api = mockk<UserApi>()
    private val dao = mockk<UserDao>()
    private val repo = UserRepositoryImpl(api, dao)

    @Test
    fun `getUsers emits cached then fresh data`() = runTest {
        // Given
        val cached = listOf(User(1, "Cached Alice"))
        val fresh  = listOf(User(1, "Alice"), User(2, "Bob"))

        coEvery { dao.getAll() } returns cached
        coEvery { api.getUsers() } returns fresh
        coEvery { dao.insertAll(any()) } just Runs  // void mock

        // When + Then — collect and assert emissions one by one
        repo.getUsers().test {
            assertEquals(cached, awaitItem())  // first: cached data
            assertEquals(fresh,  awaitItem())  // second: fresh data
            cancelAndIgnoreRemainingEvents()
        }
    }

    @Test
    fun `getUsers emits error when network fails and cache is empty`() = runTest {
        coEvery { dao.getAll() } returns emptyList()
        coEvery { api.getUsers() } throws IOException("Offline")

        repo.getUsers().test {
            awaitError()   // assert a terminal error is emitted
        }
    }
}

// Testing StateFlow in ViewModel
class CounterViewModelTest {

    @Test
    fun `increment increases count by 1`() = runTest {
        val vm = CounterViewModel()
        assertEquals(0, vm.count.value)  // initial state

        vm.increment()
        assertEquals(1, vm.count.value)

        vm.increment()
        vm.increment()
        assertEquals(3, vm.count.value)
    }
}'''
      ..language = 'kotlin'..difficulty = 'hard'..section = 'Testing'..isSaved = false..lastViewedAt = null,

  ];
}
