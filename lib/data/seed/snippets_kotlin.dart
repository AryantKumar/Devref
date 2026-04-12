import '../models/snippet.dart';

List<Snippet> getKotlinSnippets() {
  return [
    // ── Very Easy (10) ──
    Snippet()
      ..snippetId = 'kotlin_001'
      ..topicId = 'kotlin'
      ..title = 'Hello World'
      ..description = 'The simplest Kotlin program that prints Hello World to the console using the println function.'
      ..code = '''fun main() {
    println("Hello, World!")
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_easy'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_002'
      ..topicId = 'kotlin'
      ..title = 'Variable Declaration'
      ..description = 'Demonstrates val (immutable) and var (mutable) variable declarations in Kotlin with type inference.'
      ..code = '''fun main() {
    val name: String = "Kotlin"  // immutable
    var age: Int = 10            // mutable
    age = 11
    println("Name: \$name, Age: \$age")
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_easy'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_003'
      ..topicId = 'kotlin'
      ..title = 'String Templates'
      ..description = 'Kotlin supports string interpolation using \$ for variables and \${} for expressions inside strings.'
      ..code = '''fun main() {
    val language = "Kotlin"
    val version = 2.0
    println("Learning \$language version \${version + 0.1}")
    println("Name length: \${language.length}")
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_easy'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_004'
      ..topicId = 'kotlin'
      ..title = 'When Expression'
      ..description = 'The when expression replaces switch statements in Kotlin and can be used as both a statement and an expression.'
      ..code = '''fun describe(obj: Any): String =
    when (obj) {
        1          -> "One"
        "Hello"    -> "Greeting"
        is Long    -> "Long number"
        !is String -> "Not a string"
        else       -> "Unknown"
    }

fun main() {
    println(describe(1))
    println(describe("Hello"))
    println(describe(100L))
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_easy'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_005'
      ..topicId = 'kotlin'
      ..title = 'For Loops & Ranges'
      ..description = 'Iterate over ranges, arrays, and collections using for loops with Kotlin range expressions.'
      ..code = '''fun main() {
    for (i in 1..5) print("\$i ")         // 1 2 3 4 5
    println()
    for (i in 5 downTo 1 step 2) print("\$i ") // 5 3 1
    println()
    val fruits = listOf("apple", "banana", "cherry")
    for ((index, fruit) in fruits.withIndex()) {
        println("\$index: \$fruit")
    }
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_easy'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_006'
      ..topicId = 'kotlin'
      ..title = 'Nullable Types'
      ..description = 'Kotlin enforces null safety at compile time. Use ? to declare nullable types and ?. for safe calls.'
      ..code = '''fun main() {
    var name: String? = "Kotlin"
    println(name?.length)   // 6
    name = null
    println(name?.length)   // null
    println(name?.length ?: 0)  // 0 (Elvis operator)
    // name!!.length  // Would throw NPE
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_easy'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_007'
      ..topicId = 'kotlin'
      ..title = 'Functions with Default Args'
      ..description = 'Kotlin functions support default parameter values, reducing the need for overloaded functions.'
      ..code = '''fun greet(name: String, greeting: String = "Hello") {
    println("\$greeting, \$name!")
}

fun main() {
    greet("Alice")                // Hello, Alice!
    greet("Bob", "Hi")            // Hi, Bob!
    greet(greeting = "Hey", name = "Charlie")  // named args
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_easy'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_008'
      ..topicId = 'kotlin'
      ..title = 'Data Classes'
      ..description = 'Data classes automatically generate equals(), hashCode(), toString(), copy(), and component functions.'
      ..code = '''data class User(val name: String, val age: Int)

fun main() {
    val user1 = User("Alice", 30)
    val user2 = user1.copy(age = 31)
    println(user1)           // User(name=Alice, age=30)
    println(user2)           // User(name=Alice, age=31)
    println(user1 == user2)  // false
    val (name, age) = user1  // destructuring
    println("Name: \$name, Age: \$age")
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_easy'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_009'
      ..topicId = 'kotlin'
      ..title = 'Lists and MutableLists'
      ..description = 'Kotlin provides read-only List and mutable MutableList collections with many utility functions.'
      ..code = '''fun main() {
    val readOnly = listOf(1, 2, 3, 4, 5)
    val mutable = mutableListOf("a", "b", "c")
    mutable.add("d")
    mutable.removeAt(0)
    println(readOnly.filter { it > 2 })  // [3, 4, 5]
    println(readOnly.map { it * 2 })     // [2, 4, 6, 8, 10]
    println(mutable)                      // [b, c, d]
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_easy'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_010'
      ..topicId = 'kotlin'
      ..title = 'Lambda Expressions'
      ..description = 'Lambdas are anonymous functions enclosed in curly braces. The last lambda can be placed outside parentheses.'
      ..code = '''fun main() {
    val numbers = listOf(1, 2, 3, 4, 5)
    val doubled = numbers.map { it * 2 }
    val evens = numbers.filter { it % 2 == 0 }
    val sum = numbers.fold(0) { acc, n -> acc + n }
    println("Doubled: \$doubled")  // [2, 4, 6, 8, 10]
    println("Evens: \$evens")      // [2, 4]
    println("Sum: \$sum")          // 15
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_easy'
      ..isSaved = false
      ..lastViewedAt = null,

    // ── Medium (10) ──
    Snippet()
      ..snippetId = 'kotlin_011'
      ..topicId = 'kotlin'
      ..title = 'Extension Functions'
      ..description = 'Extension functions add new functionality to existing classes without modifying their source code.'
      ..code = '''fun String.wordCount(): Int =
    this.trim().split("\\\\s+".toRegex()).size

fun Int.isEven(): Boolean = this % 2 == 0

fun <T> List<T>.secondOrNull(): T? =
    if (size >= 2) this[1] else null

fun main() {
    println("Hello World Kotlin".wordCount())  // 3
    println(42.isEven())                        // true
    println(listOf(1, 2, 3).secondOrNull())     // 2
    println(emptyList<Int>().secondOrNull())     // null
}'''
      ..language = 'kotlin'
      ..difficulty = 'medium'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_012'
      ..topicId = 'kotlin'
      ..title = 'Sealed Classes'
      ..description = 'Sealed classes restrict inheritance to a known set of subclasses, enabling exhaustive when expressions.'
      ..code = '''sealed class Result<out T> {
    data class Success<T>(val data: T) : Result<T>()
    data class Error(val message: String) : Result<Nothing>()
    data object Loading : Result<Nothing>()
}

fun handleResult(result: Result<String>) = when (result) {
    is Result.Success -> "Data: \${result.data}"
    is Result.Error   -> "Error: \${result.message}"
    Result.Loading    -> "Loading..."
}

fun main() {
    println(handleResult(Result.Success("Hello")))
    println(handleResult(Result.Error("Network error")))
    println(handleResult(Result.Loading))
}'''
      ..language = 'kotlin'
      ..difficulty = 'medium'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_013'
      ..topicId = 'kotlin'
      ..title = 'Higher-Order Functions'
      ..description = 'Functions that take other functions as parameters or return them, enabling powerful abstractions.'
      ..code = '''fun <T> List<T>.customFilter(predicate: (T) -> Boolean): List<T> {
    val result = mutableListOf<T>()
    for (item in this) {
        if (predicate(item)) result.add(item)
    }
    return result
}

fun operate(a: Int, b: Int, operation: (Int, Int) -> Int): Int {
    return operation(a, b)
}

fun main() {
    val nums = listOf(1, 2, 3, 4, 5, 6)
    println(nums.customFilter { it > 3 })       // [4, 5, 6]
    println(operate(10, 5) { x, y -> x + y })   // 15
    println(operate(10, 5) { x, y -> x * y })   // 50
}'''
      ..language = 'kotlin'
      ..difficulty = 'medium'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_014'
      ..topicId = 'kotlin'
      ..title = 'Companion Objects'
      ..description = 'Companion objects provide factory methods and static-like members within a class.'
      ..code = '''class DatabaseConfig private constructor(
    val host: String,
    val port: Int
) {
    companion object {
        private const val DEFAULT_PORT = 5432

        fun local() = DatabaseConfig("localhost", DEFAULT_PORT)
        fun remote(host: String, port: Int = DEFAULT_PORT) =
            DatabaseConfig(host, port)
    }

    override fun toString() = "DB(\$host:\$port)"
}

fun main() {
    val local = DatabaseConfig.local()
    val remote = DatabaseConfig.remote("db.example.com")
    println(local)   // DB(localhost:5432)
    println(remote)  // DB(db.example.com:5432)
}'''
      ..language = 'kotlin'
      ..difficulty = 'medium'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_015'
      ..topicId = 'kotlin'
      ..title = 'Collection Operations'
      ..description = 'Kotlin provides rich collection processing with map, flatMap, groupBy, associate and more.'
      ..code = '''data class Student(val name: String, val grade: Int, val score: Double)

fun main() {
    val students = listOf(
        Student("Alice", 10, 95.0),
        Student("Bob", 10, 87.0),
        Student("Charlie", 11, 92.0),
        Student("Diana", 11, 88.5)
    )
    val byGrade = students.groupBy { it.grade }
    val averages = byGrade.mapValues { (_, v) ->
        v.map { it.score }.average()
    }
    val topPerGrade = byGrade.mapValues { (_, v) ->
        v.maxByOrNull { it.score }?.name
    }
    println("Averages: \$averages")
    println("Top students: \$topPerGrade")
}'''
      ..language = 'kotlin'
      ..difficulty = 'medium'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_016'
      ..topicId = 'kotlin'
      ..title = 'Scope Functions (let, run, apply, also)'
      ..description = 'Scope functions execute a block of code in the context of an object. Each differs in how they reference the object.'
      ..code = '''data class Request(var url: String = "", var method: String = "GET",
                     var headers: MutableMap<String, String> = mutableMapOf())

fun main() {
    // apply: configure object, returns object
    val request = Request().apply {
        url = "https://api.example.com/users"
        method = "POST"
        headers["Content-Type"] = "application/json"
    }
    // also: side effects, returns object
    request.also { println("Sending: \${it.method} \${it.url}") }
    // let: transform nullable, returns lambda result
    val length = request.url.let { it.length }
    println("URL length: \$length")
    // run: compute with context, returns lambda result
    val summary = request.run { "\$method \$url (\${headers.size} headers)" }
    println(summary)
}'''
      ..language = 'kotlin'
      ..difficulty = 'medium'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_017'
      ..topicId = 'kotlin'
      ..title = 'Enum Classes with Properties'
      ..description = 'Kotlin enums can have properties, methods, and implement interfaces for rich behavior.'
      ..code = '''enum class Planet(val mass: Double, val radius: Double) {
    MERCURY(3.303e+23, 2.4397e6),
    VENUS(4.869e+24, 6.0518e6),
    EARTH(5.976e+24, 6.37814e6),
    MARS(6.421e+23, 3.3972e6);

    val surfaceGravity: Double
        get() = G * mass / (radius * radius)

    fun surfaceWeight(otherMass: Double) = otherMass * surfaceGravity

    companion object {
        const val G = 6.67300E-11
    }
}

fun main() {
    val earthWeight = 75.0
    val mass = earthWeight / Planet.EARTH.surfaceGravity
    Planet.entries.forEach {
        println("\${it.name}: \${"%.2f".format(it.surfaceWeight(mass))} N")
    }
}'''
      ..language = 'kotlin'
      ..difficulty = 'medium'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_018'
      ..topicId = 'kotlin'
      ..title = 'Delegation Pattern'
      ..description = 'Kotlin supports class delegation using the by keyword, implementing delegation pattern natively.'
      ..code = '''interface Logger {
    fun log(message: String)
}

class ConsoleLogger : Logger {
    override fun log(message: String) = println("[LOG] \$message")
}

class FileLogger : Logger {
    override fun log(message: String) = println("[FILE] \$message")
}

class UserService(logger: Logger) : Logger by logger {
    fun createUser(name: String) {
        log("Creating user: \$name")
        // business logic here
        log("User \$name created successfully")
    }
}

fun main() {
    val service = UserService(ConsoleLogger())
    service.createUser("Alice")
}'''
      ..language = 'kotlin'
      ..difficulty = 'medium'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_019'
      ..topicId = 'kotlin'
      ..title = 'Null Safety Chains'
      ..description = 'Chain safe calls with let, run, and Elvis operator for elegant null handling without nested if-checks.'
      ..code = '''data class Address(val city: String?, val zip: String?)
data class Company(val name: String, val address: Address?)
data class Employee(val name: String, val company: Company?)

fun getEmployeeCity(employee: Employee?): String {
    return employee
        ?.company
        ?.address
        ?.city
        ?.uppercase()
        ?: "Unknown City"
}

fun main() {
    val emp1 = Employee("Alice", Company("Tech", Address("Berlin", "10115")))
    val emp2 = Employee("Bob", Company("Startup", null))
    val emp3: Employee? = null
    println(getEmployeeCity(emp1))  // BERLIN
    println(getEmployeeCity(emp2))  // Unknown City
    println(getEmployeeCity(emp3))  // Unknown City
}'''
      ..language = 'kotlin'
      ..difficulty = 'medium'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_020'
      ..topicId = 'kotlin'
      ..title = 'Interfaces with Default Implementations'
      ..description = 'Kotlin interfaces can provide default method implementations, enabling mixin-like behavior.'
      ..code = '''interface Clickable {
    fun click()
    fun showOff() = println("I am clickable!")
}

interface Focusable {
    fun setFocus(b: Boolean) = println("Focus: \$b")
    fun showOff() = println("I am focusable!")
}

class Button : Clickable, Focusable {
    override fun click() = println("Button clicked")
    override fun showOff() {
        super<Clickable>.showOff()
        super<Focusable>.showOff()
    }
}

fun main() {
    val button = Button()
    button.click()
    button.showOff()
    button.setFocus(true)
}'''
      ..language = 'kotlin'
      ..difficulty = 'medium'
      ..isSaved = false
      ..lastViewedAt = null,

    // ── Hard (10) ──
    Snippet()
      ..snippetId = 'kotlin_021'
      ..topicId = 'kotlin'
      ..title = 'Coroutines Basics'
      ..description = 'Coroutines enable asynchronous programming with structured concurrency using launch, async, and suspend functions.'
      ..code = '''import kotlinx.coroutines.*

suspend fun fetchUser(): String {
    delay(1000) // simulate network
    return "Alice"
}

suspend fun fetchOrders(): List<String> {
    delay(800)
    return listOf("Order1", "Order2")
}

fun main() = runBlocking {
    val time = measureTimeMillis {
        val user = async { fetchUser() }
        val orders = async { fetchOrders() }
        println("User: \${user.await()}")
        println("Orders: \${orders.await()}")
    }
    println("Completed in \$time ms") // ~1000ms (parallel)
}'''
      ..language = 'kotlin'
      ..difficulty = 'hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_022'
      ..topicId = 'kotlin'
      ..title = 'Flow Operators'
      ..description = 'Kotlin Flow is a cold asynchronous stream supporting operators like map, filter, combine, and flatMapConcat.'
      ..code = '''import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*

fun numbers(): Flow<Int> = flow {
    for (i in 1..5) {
        delay(100)
        emit(i)
    }
}

fun main() = runBlocking {
    numbers()
        .filter { it % 2 != 0 }
        .map { it * it }
        .onEach { println("Processing: \$it") }
        .catch { e -> println("Error: \$e") }
        .collect { println("Result: \$it") }
    // Processing: 1 -> Result: 1
    // Processing: 9 -> Result: 9
    // Processing: 25 -> Result: 25
}'''
      ..language = 'kotlin'
      ..difficulty = 'hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_023'
      ..topicId = 'kotlin'
      ..title = 'Inline & Reified Generics'
      ..description = 'Inline functions with reified type parameters allow accessing generic type info at runtime, avoiding type erasure.'
      ..code = '''inline fun <reified T> isType(value: Any): Boolean = value is T

inline fun <reified T> List<*>.filterByType(): List<T> {
    return this.filterIsInstance<T>()
}

inline fun <reified T> createInstance(): T {
    return T::class.java.getDeclaredConstructor().newInstance()
}

data class Config(val debug: Boolean = false)

fun main() {
    println(isType<String>("hello"))  // true
    println(isType<Int>("hello"))     // false

    val mixed: List<Any> = listOf(1, "two", 3.0, "four", 5)
    val strings = mixed.filterByType<String>()
    println(strings)  // [two, four]

    val config = createInstance<Config>()
    println(config)   // Config(debug=false)
}'''
      ..language = 'kotlin'
      ..difficulty = 'hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_024'
      ..topicId = 'kotlin'
      ..title = 'DSL Builder Pattern'
      ..description = 'Kotlin DSL builders use lambdas with receivers to create type-safe domain-specific languages.'
      ..code = '''class Html {
    private val children = mutableListOf<String>()
    fun head(init: Head.() -> Unit) {
        val head = Head().apply(init)
        children.add("<head>\${head}</head>")
    }
    fun body(init: Body.() -> Unit) {
        val body = Body().apply(init)
        children.add("<body>\${body}</body>")
    }
    override fun toString() = "<html>\${children.joinToString("")}</html>"
}
class Head {
    var title = ""
    override fun toString() = "<title>\$title</title>"
}
class Body {
    private val elements = mutableListOf<String>()
    fun h1(text: String) { elements.add("<h1>\$text</h1>") }
    fun p(text: String) { elements.add("<p>\$text</p>") }
    override fun toString() = elements.joinToString("")
}
fun html(init: Html.() -> Unit): Html = Html().apply(init)

fun main() {
    val page = html {
        head { title = "My Page" }
        body {
            h1("Welcome")
            p("This is a DSL example")
        }
    }
    println(page)
}'''
      ..language = 'kotlin'
      ..difficulty = 'hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_025'
      ..topicId = 'kotlin'
      ..title = 'Generics with Variance'
      ..description = 'Kotlin uses declaration-site variance with in (contravariant) and out (covariant) modifiers on generics.'
      ..code = '''interface Producer<out T> {
    fun produce(): T
}

interface Consumer<in T> {
    fun consume(item: T)
}

class FruitProducer : Producer<String> {
    override fun produce(): String = "Apple"
}

class AnyConsumer : Consumer<Any> {
    override fun consume(item: Any) = println("Consumed: \$item")
}

fun demo(producer: Producer<Any>, consumer: Consumer<String>) {
    val item = producer.produce()
    consumer.consume(item.toString())
}

fun main() {
    val producer: Producer<Any> = FruitProducer() // out: covariant
    val consumer: Consumer<String> = AnyConsumer() // in: contravariant
    demo(producer, consumer)
}'''
      ..language = 'kotlin'
      ..difficulty = 'hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_026'
      ..topicId = 'kotlin'
      ..title = 'Property Delegates (lazy, observable)'
      ..description = 'Kotlin property delegates allow reusable property accessor logic with lazy initialization and change observation.'
      ..code = '''import kotlin.properties.Delegates

class UserPreferences {
    val heavyResource: String by lazy {
        println("Computing heavy resource...")
        "Large Dataset Loaded"
    }

    var name: String by Delegates.observable("(none)") { prop, old, new ->
        println("\${prop.name}: \$old -> \$new")
    }

    var age: Int by Delegates.vetoable(0) { _, _, new ->
        new >= 0  // reject negative ages
    }
}

fun main() {
    val prefs = UserPreferences()
    println(prefs.heavyResource)  // Computing... then value
    println(prefs.heavyResource)  // cached, no recompute
    prefs.name = "Alice"          // name: (none) -> Alice
    prefs.age = 25
    prefs.age = -1                // vetoed, stays 25
    println("Age: \${prefs.age}") // 25
}'''
      ..language = 'kotlin'
      ..difficulty = 'hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_027'
      ..topicId = 'kotlin'
      ..title = 'Coroutine Exception Handling'
      ..description = 'Handle exceptions in coroutines using SupervisorJob, CoroutineExceptionHandler, and structured concurrency.'
      ..code = '''import kotlinx.coroutines.*

fun main() = runBlocking {
    val handler = CoroutineExceptionHandler { _, exception ->
        println("Caught: \${exception.message}")
    }

    // SupervisorScope: one child failure doesn't cancel siblings
    supervisorScope {
        val job1 = launch(handler) {
            delay(100)
            throw RuntimeException("Task 1 failed")
        }
        val job2 = launch {
            delay(200)
            println("Task 2 completed successfully")
        }
        joinAll(job1, job2)
    }

    println("Supervisor scope completed")
}'''
      ..language = 'kotlin'
      ..difficulty = 'hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_028'
      ..topicId = 'kotlin'
      ..title = 'Sequence (Lazy Collections)'
      ..description = 'Sequences process elements lazily one-by-one, avoiding intermediate collections for better performance on large data.'
      ..code = '''fun main() {
    val result = (1..1_000_000)
        .asSequence()
        .filter {
            // Only called for needed elements
            it % 3 == 0
        }
        .map { it * it }
        .take(5)
        .toList()

    println(result) // [9, 36, 81, 144, 225]

    // generateSequence for infinite sequences
    val fibs = generateSequence(Pair(0L, 1L)) { (a, b) ->
        Pair(b, a + b)
    }.map { it.first }

    println(fibs.take(10).toList())
    // [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
}'''
      ..language = 'kotlin'
      ..difficulty = 'hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_029'
      ..topicId = 'kotlin'
      ..title = 'Contracts & Smart Casts'
      ..description = 'Kotlin contracts tell the compiler about function behavior, enabling smarter type narrowing after checks.'
      ..code = '''import kotlin.contracts.*

@OptIn(ExperimentalContracts::class)
fun requireNotBlank(value: String?) {
    contract {
        returns() implies (value != null)
    }
    if (value.isNullOrBlank()) {
        throw IllegalArgumentException("Value must not be blank")
    }
}

fun processInput(input: String?) {
    requireNotBlank(input)
    // Smart cast: input is now String (non-null)
    println("Input length: \${input.length}")
    println("Uppercase: \${input.uppercase()}")
}

fun main() {
    processInput("Hello Kotlin")
    // processInput(null)  // throws exception
}'''
      ..language = 'kotlin'
      ..difficulty = 'hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_030'
      ..topicId = 'kotlin'
      ..title = 'Channels for Coroutine Communication'
      ..description = 'Channels provide a way to transfer data between coroutines, similar to blocking queues but for suspend functions.'
      ..code = '''import kotlinx.coroutines.*
import kotlinx.coroutines.channels.*

fun main() = runBlocking {
    val channel = Channel<Int>(capacity = 5)

    // Producer
    launch {
        for (i in 1..10) {
            channel.send(i * i)
            println("Sent: \${i * i}")
        }
        channel.close()
    }

    // Consumer
    launch {
        for (value in channel) {
            println("Received: \$value")
            delay(100)
        }
    }
}'''
      ..language = 'kotlin'
      ..difficulty = 'hard'
      ..isSaved = false
      ..lastViewedAt = null,

    // ── Very Hard (10) ──
    Snippet()
      ..snippetId = 'kotlin_031'
      ..topicId = 'kotlin'
      ..title = 'Custom Coroutine Context'
      ..description = 'Build custom CoroutineContext elements for passing contextual data through the coroutine hierarchy.'
      ..code = '''import kotlinx.coroutines.*
import kotlin.coroutines.*

class RequestId(val id: String) : AbstractCoroutineContextElement(Key) {
    companion object Key : CoroutineContext.Key<RequestId>
}

class UserId(val id: String) : AbstractCoroutineContextElement(Key) {
    companion object Key : CoroutineContext.Key<UserId>
}

suspend fun processRequest() {
    val reqId = coroutineContext[RequestId]?.id ?: "unknown"
    val userId = coroutineContext[UserId]?.id ?: "anonymous"
    println("Processing request=\$reqId for user=\$userId")
}

fun main() = runBlocking {
    val ctx = RequestId("req-42") + UserId("user-7")
    launch(ctx) {
        processRequest()
        launch { // inherits context
            processRequest()
        }
    }
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_032'
      ..topicId = 'kotlin'
      ..title = 'Type-Safe Builder with @DslMarker'
      ..description = 'Use @DslMarker to restrict DSL scope and prevent accidental access to outer receiver members.'
      ..code = '''@DslMarker
annotation class TableDsl

@TableDsl
class Table {
    private val rows = mutableListOf<Row>()
    fun row(init: Row.() -> Unit) { rows.add(Row().apply(init)) }
    override fun toString() = rows.joinToString("\\n") { it.toString() }
}

@TableDsl
class Row {
    private val cells = mutableListOf<String>()
    fun cell(value: Any) { cells.add(value.toString()) }
    override fun toString() = "| \${cells.joinToString(" | ")} |"
}

fun table(init: Table.() -> Unit) = Table().apply(init)

fun main() {
    val t = table {
        row {
            cell("Name")
            cell("Age")
            // cell access to Table is blocked by @DslMarker
        }
        row {
            cell("Alice")
            cell(30)
        }
    }
    println(t)
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_033'
      ..topicId = 'kotlin'
      ..title = 'StateFlow & SharedFlow'
      ..description = 'Hot flows for state management. StateFlow always holds a value; SharedFlow supports replay and multiple subscribers.'
      ..code = '''import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*

class CounterViewModel {
    private val _count = MutableStateFlow(0)
    val count: StateFlow<Int> = _count.asStateFlow()

    private val _events = MutableSharedFlow<String>(replay = 0)
    val events: SharedFlow<String> = _events.asSharedFlow()

    suspend fun increment() {
        _count.update { it + 1 }
        _events.emit("Counter incremented to \${_count.value}")
    }
}

fun main() = runBlocking {
    val vm = CounterViewModel()
    launch { vm.count.collect { println("State: \$it") } }
    launch { vm.events.collect { println("Event: \$it") } }
    delay(100)
    repeat(3) {
        vm.increment()
        delay(50)
    }
    delay(200)
    cancel()
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_034'
      ..topicId = 'kotlin'
      ..title = 'Reflection & KClass'
      ..description = 'Use Kotlin reflection to inspect classes, properties, and functions at runtime with kotlin-reflect.'
      ..code = '''import kotlin.reflect.full.*

data class Person(val name: String, val age: Int, val email: String)

fun inspectClass(obj: Any) {
    val kClass = obj::class
    println("Class: \${kClass.simpleName}")
    println("Properties:")
    kClass.memberProperties.forEach { prop ->
        println("  \${prop.name}: \${prop.returnType} = \${prop.getter.call(obj)}")
    }
    println("Constructors:")
    kClass.constructors.forEach { ctor ->
        val params = ctor.parameters.joinToString { "\${it.name}: \${it.type}" }
        println("  (\$params)")
    }
}

fun <T : Any> createFromMap(kClass: kotlin.reflect.KClass<T>, map: Map<String, Any>): T {
    val ctor = kClass.primaryConstructor!!
    val args = ctor.parameters.associateWith { map[it.name] }
    return ctor.callBy(args)
}

fun main() {
    val person = Person("Alice", 30, "alice@example.com")
    inspectClass(person)
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_035'
      ..topicId = 'kotlin'
      ..title = 'Mutex & Atomic Coroutine Safety'
      ..description = 'Use Mutex for mutual exclusion in coroutines to prevent race conditions on shared mutable state.'
      ..code = '''import kotlinx.coroutines.*
import kotlinx.coroutines.sync.*
import java.util.concurrent.atomic.AtomicInteger

fun main() = runBlocking {
    var unsafeCounter = 0
    val atomicCounter = AtomicInteger(0)
    val mutex = Mutex()
    var mutexCounter = 0

    val n = 100
    val k = 1000

    // Unsafe increment (may lose counts)
    coroutineScope {
        repeat(n) {
            launch(Dispatchers.Default) {
                repeat(k) { unsafeCounter++ }
            }
        }
    }

    // Atomic increment
    coroutineScope {
        repeat(n) {
            launch(Dispatchers.Default) {
                repeat(k) { atomicCounter.incrementAndGet() }
            }
        }
    }

    // Mutex-protected increment
    coroutineScope {
        repeat(n) {
            launch(Dispatchers.Default) {
                repeat(k) { mutex.withLock { mutexCounter++ } }
            }
        }
    }

    println("Unsafe: \$unsafeCounter")         // < 100000
    println("Atomic: \${atomicCounter.get()}")  // 100000
    println("Mutex:  \$mutexCounter")           // 100000
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_036'
      ..topicId = 'kotlin'
      ..title = 'Annotation Processing Simulation'
      ..description = 'Demonstrates creating custom annotations and using reflection to process them at runtime.'
      ..code = '''@Target(AnnotationTarget.PROPERTY)
@Retention(AnnotationRetention.RUNTIME)
annotation class Validate(val minLength: Int = 0, val maxLength: Int = Int.MAX_VALUE)

@Target(AnnotationTarget.PROPERTY)
@Retention(AnnotationRetention.RUNTIME)
annotation class Email

data class UserForm(
    @Validate(minLength = 2, maxLength = 50) val name: String,
    @Email val email: String,
    @Validate(minLength = 8) val password: String
)

fun validate(obj: Any): List<String> {
    val errors = mutableListOf<String>()
    obj::class.members.forEach { member ->
        member.annotations.forEach { ann ->
            when (ann) {
                is Validate -> {
                    val value = (member as kotlin.reflect.KProperty<*>).getter.call(obj) as? String ?: ""
                    if (value.length < ann.minLength) errors.add("\${member.name} too short (min \${ann.minLength})")
                    if (value.length > ann.maxLength) errors.add("\${member.name} too long (max \${ann.maxLength})")
                }
                is Email -> {
                    val value = (member as kotlin.reflect.KProperty<*>).getter.call(obj) as? String ?: ""
                    if (!value.contains("@")) errors.add("\${member.name} is not a valid email")
                }
            }
        }
    }
    return errors
}

fun main() {
    val form = UserForm("A", "invalid", "short")
    println(validate(form))
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_037'
      ..topicId = 'kotlin'
      ..title = 'Coroutine Flow Backpressure'
      ..description = 'Handle backpressure in flows using buffer, conflate, and collectLatest strategies.'
      ..code = '''import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import kotlin.system.measureTimeMillis

fun producer(): Flow<Int> = flow {
    for (i in 1..5) {
        delay(100) // produce every 100ms
        emit(i)
        println("Emitted \$i")
    }
}

fun main() = runBlocking {
    // Without buffer: sequential (100+300)*5 = 2000ms
    val t1 = measureTimeMillis {
        producer().collect {
            delay(300) // slow consumer
            println("Collected \$it")
        }
    }
    println("No buffer: \$t1 ms")

    // With buffer: concurrent ~1700ms
    val t2 = measureTimeMillis {
        producer().buffer().collect {
            delay(300)
        }
    }
    println("Buffered: \$t2 ms")

    // Conflate: skip intermediate values
    val t3 = measureTimeMillis {
        producer().conflate().collect {
            delay(300)
        }
    }
    println("Conflated: \$t3 ms")
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_038'
      ..topicId = 'kotlin'
      ..title = 'Inline Value Classes'
      ..description = 'Value classes provide type safety without runtime overhead by wrapping a single value inline at compile time.'
      ..code = '''@JvmInline
value class UserId(val value: Long)

@JvmInline
value class OrderId(val value: Long)

@JvmInline
value class Email(val value: String) {
    init {
        require(value.contains("@")) { "Invalid email: \$value" }
    }
    val domain: String get() = value.substringAfter("@")
}

// Type-safe function — can't accidentally swap userId and orderId
fun fetchOrder(userId: UserId, orderId: OrderId): String {
    return "Order \${orderId.value} for user \${userId.value}"
}

fun main() {
    val userId = UserId(42)
    val orderId = OrderId(100)
    println(fetchOrder(userId, orderId))
    // fetchOrder(orderId, userId) // COMPILE ERROR
    val email = Email("alice@example.com")
    println("Domain: \${email.domain}")
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_039'
      ..topicId = 'kotlin'
      ..title = 'Context Receivers (Kotlin 1.6.20+)'
      ..description = 'Context receivers allow functions to declare required context without explicit parameters, enabling clean DSLs.'
      ..code = '''interface LoggingContext {
    fun log(message: String)
}

interface TransactionContext {
    fun beginTransaction()
    fun commit()
    fun rollback()
}

class AppLogger : LoggingContext {
    override fun log(message: String) = println("[LOG] \$message")
}

class DbTransaction : TransactionContext {
    override fun beginTransaction() = println("BEGIN TX")
    override fun commit() = println("COMMIT")
    override fun rollback() = println("ROLLBACK")
}

// Function requiring both contexts
context(LoggingContext, TransactionContext)
fun transferFunds(from: String, to: String, amount: Double) {
    log("Transferring \$amount from \$from to \$to")
    beginTransaction()
    try {
        log("Debiting \$from")
        log("Crediting \$to")
        commit()
    } catch (e: Exception) {
        rollback()
        log("Transfer failed: \${e.message}")
    }
}

fun main() {
    with(AppLogger()) {
        with(DbTransaction()) {
            transferFunds("Alice", "Bob", 100.0)
        }
    }
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_hard'
      ..isSaved = false
      ..lastViewedAt = null,
    Snippet()
      ..snippetId = 'kotlin_040'
      ..topicId = 'kotlin'
      ..title = 'Custom Iterator & Operator Overloading'
      ..description = 'Implement custom iterators with operator overloading for creating iterable data structures with for-loop support.'
      ..code = '''class DateRange(
    private val start: java.time.LocalDate,
    private val endInclusive: java.time.LocalDate
) : Iterable<java.time.LocalDate> {

    operator fun contains(date: java.time.LocalDate): Boolean =
        date in start..endInclusive

    override fun iterator() = object : Iterator<java.time.LocalDate> {
        var current = start
        override fun hasNext() = current <= endInclusive
        override fun next(): java.time.LocalDate {
            val result = current
            current = current.plusDays(1)
            return result
        }
    }

    val days: Int get() = java.time.temporal.ChronoUnit.DAYS
        .between(start, endInclusive).toInt() + 1
}

operator fun java.time.LocalDate.rangeTo(other: java.time.LocalDate) =
    DateRange(this, other)

fun main() {
    val start = java.time.LocalDate.of(2024, 1, 1)
    val end = java.time.LocalDate.of(2024, 1, 5)
    val range = start..end
    println("Days: \${range.days}")
    for (date in range) println(date)
}'''
      ..language = 'kotlin'
      ..difficulty = 'very_hard'
      ..isSaved = false
      ..lastViewedAt = null,
  ];
}
