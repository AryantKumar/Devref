import '../models/snippet.dart';

List<Snippet> getCppSnippets() {
  return [
    // ── Very Easy (10) ──
    Snippet()..snippetId='cpp_001'..topicId='cpp'..title='Hello World'..description='The most basic C++ program. Includes iostream for I/O and uses std::cout to print to console.'..code='''#include <iostream>

int main() {
    std::cout << "Hello, World!" << std::endl;
    return 0;
}'''..language='cpp'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_002'..topicId='cpp'..title='Variables and Data Types'..description='C++ is statically typed with primitive types: int, double, char, bool, string, and auto for type inference.'..code='''#include <iostream>
#include <string>

int main() {
    int age = 25;
    double price = 19.99;
    char grade = 'A';
    bool isActive = true;
    std::string name = "C++";
    auto pi = 3.14159;  // type inferred

    std::cout << "Name: " << name << "\\n";
    std::cout << "Age: " << age << "\\n";
    std::cout << "Price: " << price << "\\n";
    std::cout << "Active: " << std::boolalpha << isActive << "\\n";
    return 0;
}'''..language='cpp'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_003'..topicId='cpp'..title='Arrays and Vectors'..description='C-style arrays have fixed size. std::vector is a dynamic array from the STL with automatic memory management.'..code='''#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    // C-style array
    int arr[] = {5, 3, 8, 1, 9};
    int size = sizeof(arr) / sizeof(arr[0]);

    // std::vector (preferred)
    std::vector<int> nums = {10, 20, 30, 40, 50};
    nums.push_back(60);
    nums.insert(nums.begin() + 2, 25);

    std::sort(nums.begin(), nums.end());

    for (int n : nums) {
        std::cout << n << " ";
    }
    std::cout << "\\nSize: " << nums.size() << "\\n";
    return 0;
}'''..language='cpp'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_004'..topicId='cpp'..title='If-Else and Switch'..description='Standard conditional branching with if-else chains and switch statements for multi-way decisions.'..code='''#include <iostream>
#include <string>

int main() {
    int score = 85;

    // If-else
    std::string grade;
    if (score >= 90) grade = "A";
    else if (score >= 80) grade = "B";
    else if (score >= 70) grade = "C";
    else grade = "F";

    std::cout << "Grade: " << grade << "\\n";

    // Switch
    int day = 3;
    switch (day) {
        case 1: std::cout << "Monday\\n"; break;
        case 2: std::cout << "Tuesday\\n"; break;
        case 3: std::cout << "Wednesday\\n"; break;
        default: std::cout << "Other\\n"; break;
    }
    return 0;
}'''..language='cpp'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_005'..topicId='cpp'..title='Loops'..description='C++ supports for, while, do-while, and range-based for loops for iterating over collections.'..code='''#include <iostream>
#include <vector>

int main() {
    // Traditional for
    for (int i = 0; i < 5; i++) {
        std::cout << i << " ";
    }
    std::cout << "\\n";

    // Range-based for
    std::vector<std::string> colors = {"Red", "Green", "Blue"};
    for (const auto& color : colors) {
        std::cout << color << "\\n";
    }

    // While
    int count = 3;
    while (count > 0) {
        std::cout << "Countdown: " << count-- << "\\n";
    }
    return 0;
}'''..language='cpp'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_006'..topicId='cpp'..title='Functions'..description='C++ functions support overloading, default parameters, pass-by-reference, and pass-by-value.'..code='''#include <iostream>
#include <string>

int add(int a, int b) { return a + b; }
double add(double a, double b) { return a + b; }

void swap(int& a, int& b) {
    int temp = a;
    a = b;
    b = temp;
}

std::string greet(const std::string& name, const std::string& msg = "Hello") {
    return msg + ", " + name + "!";
}

int main() {
    std::cout << add(2, 3) << "\\n";      // 5
    std::cout << add(2.5, 3.5) << "\\n";  // 6.0

    int x = 1, y = 2;
    swap(x, y);
    std::cout << "x=" << x << " y=" << y << "\\n";

    std::cout << greet("C++") << "\\n";
    return 0;
}'''..language='cpp'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_007'..topicId='cpp'..title='Strings'..description='std::string provides a rich set of methods for string manipulation, searching, and transformation.'..code='''#include <iostream>
#include <string>
#include <algorithm>

int main() {
    std::string s = "Hello, World!";

    std::cout << "Length: " << s.length() << "\\n";
    std::cout << "Substr: " << s.substr(7) << "\\n";
    std::cout << "Find: " << s.find("World") << "\\n";

    // Replace
    std::string s2 = s;
    s2.replace(7, 5, "C++");
    std::cout << s2 << "\\n";

    // Transform to uppercase
    std::string upper = s;
    std::transform(upper.begin(), upper.end(), upper.begin(), ::toupper);
    std::cout << upper << "\\n";

    // Concatenation
    std::string full = s + " Welcome!";
    std::cout << full << "\\n";
    return 0;
}'''..language='cpp'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_008'..topicId='cpp'..title='Structs and Classes'..description='Classes encapsulate data and behavior with access modifiers (public, private, protected).'..code='''#include <iostream>
#include <string>

class Person {
private:
    std::string name;
    int age;

public:
    Person(const std::string& n, int a) : name(n), age(a) {}

    std::string getName() const { return name; }
    int getAge() const { return age; }

    void greet() const {
        std::cout << "Hi, I am " << name
                  << ", age " << age << "\\n";
    }
};

int main() {
    Person p1("Alice", 30);
    Person p2("Bob", 25);

    p1.greet();
    std::cout << p2.getName() << " is "
              << p2.getAge() << "\\n";
    return 0;
}'''..language='cpp'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_009'..topicId='cpp'..title='Pointers Basics'..description='Pointers store memory addresses. Use & to get address, * to dereference. Essential for C++ programming.'..code='''#include <iostream>

int main() {
    int value = 42;
    int* ptr = &value;  // pointer to value

    std::cout << "Value: " << value << "\\n";
    std::cout << "Address: " << ptr << "\\n";
    std::cout << "Deref: " << *ptr << "\\n";

    *ptr = 100;  // modify through pointer
    std::cout << "New value: " << value << "\\n";

    // Pointer arithmetic
    int arr[] = {10, 20, 30, 40};
    int* p = arr;
    for (int i = 0; i < 4; i++) {
        std::cout << *(p + i) << " ";
    }
    std::cout << "\\n";

    // Null pointer
    int* nullPtr = nullptr;
    if (nullPtr == nullptr) {
        std::cout << "Null pointer\\n";
    }
    return 0;
}'''..language='cpp'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_010'..topicId='cpp'..title='Input/Output'..description='C++ uses cin/cout for console I/O and fstream for file operations with RAII-based resource management.'..code='''#include <iostream>
#include <fstream>
#include <string>

int main() {
    // Console I/O
    std::string name;
    int age;
    std::cout << "Enter name and age: ";
    // std::cin >> name >> age;

    // File writing
    std::ofstream outFile("example.txt");
    if (outFile.is_open()) {
        outFile << "Hello, C++!\\n";
        outFile << "Line 2\\n";
        outFile.close();
    }

    // File reading
    std::ifstream inFile("example.txt");
    std::string line;
    while (std::getline(inFile, line)) {
        std::cout << line << "\\n";
    }
    inFile.close();
    return 0;
}'''..language='cpp'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,

    // ── Medium (10) ──
    Snippet()..snippetId='cpp_011'..topicId='cpp'..title='STL Containers'..description='The Standard Template Library provides map, set, unordered_map, stack, queue, and deque containers.'..code='''#include <iostream>
#include <map>
#include <set>
#include <unordered_map>

int main() {
    // std::map (ordered)
    std::map<std::string, int> scores;
    scores["Alice"] = 95;
    scores["Bob"] = 87;
    scores["Charlie"] = 92;

    for (const auto& [name, score] : scores) {
        std::cout << name << ": " << score << "\\n";
    }

    // std::set (unique, ordered)
    std::set<int> unique = {3, 1, 4, 1, 5, 9, 2, 6};
    for (int n : unique) std::cout << n << " ";
    std::cout << "\\n";

    // std::unordered_map (hash map)
    std::unordered_map<std::string, int> freq;
    std::string words[] = {"a", "b", "a", "c", "a"};
    for (const auto& w : words) freq[w]++;
    std::cout << "Freq of a: " << freq["a"] << "\\n";
    return 0;
}'''..language='cpp'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_012'..topicId='cpp'..title='Templates'..description='Templates enable generic programming — writing code that works with any type, resolved at compile time.'..code='''#include <iostream>
#include <vector>
#include <string>

// Function template
template<typename T>
T maxValue(T a, T b) {
    return (a > b) ? a : b;
}

// Class template
template<typename T>
class Stack {
    std::vector<T> data;
public:
    void push(const T& val) { data.push_back(val); }
    T pop() {
        T top = data.back();
        data.pop_back();
        return top;
    }
    bool empty() const { return data.empty(); }
    size_t size() const { return data.size(); }
};

// Variadic template
template<typename... Args>
void print(Args... args) {
    ((std::cout << args << " "), ...);
    std::cout << "\\n";
}

int main() {
    std::cout << maxValue(10, 20) << "\\n";
    std::cout << maxValue(3.14, 2.72) << "\\n";

    Stack<int> s;
    s.push(1); s.push(2); s.push(3);
    std::cout << "Popped: " << s.pop() << "\\n";

    print("Hello", 42, 3.14, true);
    return 0;
}'''..language='cpp'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_013'..topicId='cpp'..title='Inheritance and Polymorphism'..description='C++ supports single and multiple inheritance with virtual functions for runtime polymorphism.'..code='''#include <iostream>
#include <vector>
#include <memory>
#include <cmath>

class Shape {
public:
    virtual double area() const = 0;
    virtual std::string name() const = 0;
    virtual ~Shape() = default;
};

class Circle : public Shape {
    double radius;
public:
    Circle(double r) : radius(r) {}
    double area() const override { return M_PI * radius * radius; }
    std::string name() const override { return "Circle"; }
};

class Rectangle : public Shape {
    double w, h;
public:
    Rectangle(double w, double h) : w(w), h(h) {}
    double area() const override { return w * h; }
    std::string name() const override { return "Rectangle"; }
};

int main() {
    std::vector<std::unique_ptr<Shape>> shapes;
    shapes.push_back(std::make_unique<Circle>(5.0));
    shapes.push_back(std::make_unique<Rectangle>(4, 6));

    for (const auto& s : shapes) {
        std::cout << s->name() << " area: "
                  << s->area() << "\\n";
    }
    return 0;
}'''..language='cpp'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_014'..topicId='cpp'..title='Smart Pointers'..description='Smart pointers (unique_ptr, shared_ptr, weak_ptr) provide automatic memory management with RAII.'..code='''#include <iostream>
#include <memory>

class Resource {
    std::string name;
public:
    Resource(const std::string& n) : name(n) {
        std::cout << "Created: " << name << "\\n";
    }
    ~Resource() { std::cout << "Destroyed: " << name << "\\n"; }
    void use() { std::cout << "Using: " << name << "\\n"; }
};

int main() {
    // unique_ptr — exclusive ownership
    auto u1 = std::make_unique<Resource>("Unique");
    u1->use();
    // auto u2 = u1;  // ERROR: can not copy
    auto u2 = std::move(u1);  // OK: transfer ownership

    // shared_ptr — shared ownership
    auto s1 = std::make_shared<Resource>("Shared");
    {
        auto s2 = s1;  // ref count = 2
        std::cout << "Count: " << s1.use_count() << "\\n";
    }  // s2 destroyed, ref count = 1
    std::cout << "Count: " << s1.use_count() << "\\n";

    // weak_ptr — non-owning observer
    std::weak_ptr<Resource> w = s1;
    if (auto locked = w.lock()) {
        locked->use();
    }
    return 0;
}'''..language='cpp'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_015'..topicId='cpp'..title='Lambda Expressions'..description='C++ lambdas create anonymous functions with capture clauses for enclosing scope variables.'..code='''#include <iostream>
#include <vector>
#include <algorithm>
#include <functional>

int main() {
    // Basic lambda
    auto greet = [](const std::string& name) {
        return "Hello, " + name + "!";
    };
    std::cout << greet("C++") << "\\n";

    // Capture by value and reference
    int x = 10;
    auto add = [x](int y) { return x + y; };
    auto inc = [&x]() { x++; };
    inc();
    std::cout << "x = " << x << "\\n";

    // With STL algorithms
    std::vector<int> nums = {5, 3, 8, 1, 9, 2};
    std::sort(nums.begin(), nums.end(),
        [](int a, int b) { return a > b; });

    // Mutable lambda
    auto counter = [count = 0]() mutable {
        return ++count;
    };
    std::cout << counter() << " " << counter() << "\\n";

    // Generic lambda (C++14)
    auto multiply = [](auto a, auto b) { return a * b; };
    std::cout << multiply(3, 4) << "\\n";
    std::cout << multiply(2.5, 4.0) << "\\n";
    return 0;
}'''..language='cpp'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_016'..topicId='cpp'..title='Exception Handling'..description='C++ exceptions with try-catch blocks and custom exception classes derived from std::exception.'..code='''#include <iostream>
#include <stdexcept>
#include <string>

class AppError : public std::runtime_error {
    int code;
public:
    AppError(const std::string& msg, int code)
        : std::runtime_error(msg), code(code) {}
    int getCode() const { return code; }
};

double divide(double a, double b) {
    if (b == 0) throw AppError("Division by zero", 100);
    return a / b;
}

int main() {
    try {
        std::cout << divide(10, 2) << "\\n";
        std::cout << divide(10, 0) << "\\n";
    } catch (const AppError& e) {
        std::cerr << "Error [" << e.getCode()
                  << "]: " << e.what() << "\\n";
    } catch (const std::exception& e) {
        std::cerr << "Exception: " << e.what() << "\\n";
    } catch (...) {
        std::cerr << "Unknown error\\n";
    }
    return 0;
}'''..language='cpp'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_017'..topicId='cpp'..title='Operator Overloading'..description='C++ allows overloading operators to define custom behavior for user-defined types.'..code='''#include <iostream>

class Vector2D {
    double x, y;
public:
    Vector2D(double x = 0, double y = 0) : x(x), y(y) {}

    Vector2D operator+(const Vector2D& other) const {
        return Vector2D(x + other.x, y + other.y);
    }
    Vector2D operator*(double scalar) const {
        return Vector2D(x * scalar, y * scalar);
    }
    bool operator==(const Vector2D& other) const {
        return x == other.x && y == other.y;
    }

    friend std::ostream& operator<<(
        std::ostream& os, const Vector2D& v) {
        os << "(" << v.x << ", " << v.y << ")";
        return os;
    }
};

int main() {
    Vector2D a(1, 2), b(3, 4);
    auto c = a + b;
    auto d = a * 3;

    std::cout << "a + b = " << c << "\\n";
    std::cout << "a * 3 = " << d << "\\n";
    std::cout << "a == b: " << (a == b) << "\\n";
    return 0;
}'''..language='cpp'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_018'..topicId='cpp'..title='Iterators and Algorithms'..description='STL iterators provide a uniform interface for traversing containers. Algorithms work with iterator ranges.'..code='''#include <iostream>
#include <vector>
#include <algorithm>
#include <numeric>

int main() {
    std::vector<int> nums = {5, 3, 8, 1, 9, 2, 7, 4, 6};

    // Sort
    std::sort(nums.begin(), nums.end());

    // Find
    auto it = std::find(nums.begin(), nums.end(), 7);
    if (it != nums.end())
        std::cout << "Found 7 at index "
                  << std::distance(nums.begin(), it) << "\\n";

    // Accumulate
    int sum = std::accumulate(nums.begin(), nums.end(), 0);
    std::cout << "Sum: " << sum << "\\n";

    // Count if
    int evens = std::count_if(nums.begin(), nums.end(),
        [](int n) { return n % 2 == 0; });
    std::cout << "Evens: " << evens << "\\n";

    // Transform
    std::vector<int> squared(nums.size());
    std::transform(nums.begin(), nums.end(), squared.begin(),
        [](int n) { return n * n; });

    for (int n : squared) std::cout << n << " ";
    std::cout << "\\n";
    return 0;
}'''..language='cpp'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_019'..topicId='cpp'..title='RAII Pattern'..description='Resource Acquisition Is Initialization — tie resource lifetime to object lifetime for exception safety.'..code='''#include <iostream>
#include <fstream>
#include <mutex>
#include <string>

// RAII wrapper for file
class FileGuard {
    std::ofstream file;
public:
    FileGuard(const std::string& path)
        : file(path) {
        if (!file.is_open())
            throw std::runtime_error("Cannot open: " + path);
        std::cout << "File opened\\n";
    }
    ~FileGuard() {
        file.close();
        std::cout << "File closed\\n";
    }
    void write(const std::string& data) {
        file << data;
    }
};

// RAII lock guard
std::mutex mtx;
void safeOperation() {
    std::lock_guard<std::mutex> lock(mtx);
    std::cout << "Thread-safe operation\\n";
    // lock released when scope exits
}

int main() {
    try {
        FileGuard f("output.txt");
        f.write("Hello RAII!\\n");
        // File auto-closed when f goes out of scope
    } catch (const std::exception& e) {
        std::cerr << e.what() << "\\n";
    }
    safeOperation();
    return 0;
}'''..language='cpp'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_020'..topicId='cpp'..title='Enums and Constants'..description='Scoped enums (enum class) provide type-safe enumerations. constexpr enables compile-time computation.'..code='''#include <iostream>
#include <string>

enum class Color { Red, Green, Blue, Yellow };
enum class Priority { Low = 1, Medium = 2, High = 3 };

std::string colorToString(Color c) {
    switch (c) {
        case Color::Red:    return "Red";
        case Color::Green:  return "Green";
        case Color::Blue:   return "Blue";
        case Color::Yellow: return "Yellow";
        default:            return "Unknown";
    }
}

// constexpr — compile-time computation
constexpr int factorial(int n) {
    return n <= 1 ? 1 : n * factorial(n - 1);
}

constexpr double PI = 3.14159265358979;
constexpr double circleArea(double r) { return PI * r * r; }

int main() {
    Color c = Color::Blue;
    std::cout << colorToString(c) << "\\n";

    constexpr int f5 = factorial(5);
    std::cout << "5! = " << f5 << "\\n";

    constexpr double area = circleArea(5);
    std::cout << "Area: " << area << "\\n";
    return 0;
}'''..language='cpp'..difficulty='medium'..isSaved=false..lastViewedAt=null,

    // ── Hard (10) ──
    Snippet()..snippetId='cpp_021'..topicId='cpp'..title='Move Semantics'..description='Move semantics transfer resources from temporary objects efficiently, avoiding unnecessary copies.'..code='''#include <iostream>
#include <string>
#include <vector>
#include <utility>

class Buffer {
    int* data;
    size_t size;
public:
    Buffer(size_t s) : data(new int[s]), size(s) {
        std::cout << "Constructed " << size << "\\n";
    }
    // Copy constructor
    Buffer(const Buffer& other)
        : data(new int[other.size]), size(other.size) {
        std::copy(other.data, other.data + size, data);
        std::cout << "Copied " << size << "\\n";
    }
    // Move constructor
    Buffer(Buffer&& other) noexcept
        : data(other.data), size(other.size) {
        other.data = nullptr;
        other.size = 0;
        std::cout << "Moved " << size << "\\n";
    }
    ~Buffer() { delete[] data; }

    size_t getSize() const { return size; }
};

int main() {
    Buffer b1(100);
    Buffer b2 = std::move(b1);  // move, not copy
    std::cout << "b2 size: " << b2.getSize() << "\\n";
    std::cout << "b1 size: " << b1.getSize() << "\\n";
    return 0;
}'''..language='cpp'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_022'..topicId='cpp'..title='Multithreading'..description='C++11 threading with std::thread, mutex, lock_guard, and condition variables for synchronization.'..code='''#include <iostream>
#include <thread>
#include <mutex>
#include <vector>

std::mutex mtx;
int counter = 0;

void increment(int times) {
    for (int i = 0; i < times; i++) {
        std::lock_guard<std::mutex> lock(mtx);
        counter++;
    }
}

int main() {
    std::vector<std::thread> threads;
    for (int i = 0; i < 4; i++) {
        threads.emplace_back(increment, 10000);
    }
    for (auto& t : threads) t.join();

    std::cout << "Counter: " << counter << "\\n";  // 40000

    // Lambda thread
    std::thread t([]() {
        std::cout << "Thread ID: "
                  << std::this_thread::get_id() << "\\n";
    });
    t.join();
    return 0;
}'''..language='cpp'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_023'..topicId='cpp'..title='std::optional and std::variant'..description='Optional represents a value that may or may not exist. Variant is a type-safe union.'..code='''#include <iostream>
#include <optional>
#include <variant>
#include <string>

std::optional<int> findIndex(
    const std::vector<int>& v, int target) {
    for (size_t i = 0; i < v.size(); i++) {
        if (v[i] == target) return i;
    }
    return std::nullopt;
}

using JsonValue = std::variant<
    int, double, std::string, bool>;

void printJson(const JsonValue& val) {
    std::visit([](auto&& arg) {
        std::cout << arg << "\\n";
    }, val);
}

int main() {
    std::vector<int> nums = {10, 20, 30, 40};
    auto idx = findIndex(nums, 30);
    if (idx.has_value()) {
        std::cout << "Found at: " << idx.value() << "\\n";
    }
    auto missing = findIndex(nums, 99);
    std::cout << "Default: "
              << missing.value_or(-1) << "\\n";

    JsonValue v1 = 42;
    JsonValue v2 = std::string("hello");
    printJson(v1);
    printJson(v2);
    return 0;
}'''..language='cpp'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_024'..topicId='cpp'..title='Design Pattern: Observer'..description='Observer pattern notifies multiple subscribers when state changes, using templates and function objects.'..code='''#include <iostream>
#include <vector>
#include <functional>
#include <string>

template<typename... Args>
class Signal {
    using Slot = std::function<void(Args...)>;
    std::vector<Slot> slots;
public:
    void connect(Slot slot) {
        slots.push_back(std::move(slot));
    }
    void emit(Args... args) {
        for (auto& slot : slots) {
            slot(args...);
        }
    }
};

class Button {
public:
    Signal<std::string> onClick;
    void click() { onClick.emit("button_clicked"); }
};

int main() {
    Button btn;
    btn.onClick.connect([](const std::string& event) {
        std::cout << "Handler 1: " << event << "\\n";
    });
    btn.onClick.connect([](const std::string& event) {
        std::cout << "Handler 2: " << event << "\\n";
    });
    btn.click();
    return 0;
}'''..language='cpp'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_025'..topicId='cpp'..title='Concepts (C++20)'..description='Concepts constrain template parameters with readable requirements, replacing SFINAE.'..code='''#include <iostream>
#include <concepts>
#include <string>
#include <vector>

// Define concepts
template<typename T>
concept Printable = requires(T t) {
    { std::cout << t } -> std::same_as<std::ostream&>;
};

template<typename T>
concept Numeric = std::integral<T> || std::floating_point<T>;

// Use concepts
template<Printable T>
void println(const T& value) {
    std::cout << value << "\\n";
}

template<Numeric T>
T clamp(T value, T low, T high) {
    if (value < low) return low;
    if (value > high) return high;
    return value;
}

// Abbreviated function template
void describe(const auto& x) {
    std::cout << "Value: " << x << "\\n";
}

int main() {
    println(42);
    println("Hello Concepts");
    std::cout << clamp(15, 0, 10) << "\\n";  // 10
    std::cout << clamp(3.14, 0.0, 5.0) << "\\n";
    describe(42);
    return 0;
}'''..language='cpp'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_026'..topicId='cpp'..title='Coroutines (C++20)'..description='C++20 coroutines enable lazy generators and async tasks using co_yield, co_return, and co_await.'..code='''#include <iostream>
#include <coroutine>
#include <optional>

template<typename T>
struct Generator {
    struct promise_type {
        T current_value;
        auto get_return_object() {
            return Generator{
                std::coroutine_handle<promise_type>::from_promise(*this)};
        }
        auto initial_suspend() { return std::suspend_always{}; }
        auto final_suspend() noexcept { return std::suspend_always{}; }
        auto yield_value(T value) {
            current_value = value;
            return std::suspend_always{};
        }
        void return_void() {}
        void unhandled_exception() { std::terminate(); }
    };

    std::coroutine_handle<promise_type> handle;
    Generator(std::coroutine_handle<promise_type> h) : handle(h) {}
    ~Generator() { if (handle) handle.destroy(); }

    std::optional<T> next() {
        handle.resume();
        if (handle.done()) return std::nullopt;
        return handle.promise().current_value;
    }
};

Generator<int> fibonacci() {
    int a = 0, b = 1;
    while (true) {
        co_yield a;
        auto next = a + b;
        a = b;
        b = next;
    }
}

int main() {
    auto gen = fibonacci();
    for (int i = 0; i < 10; i++) {
        auto val = gen.next();
        if (val) std::cout << *val << " ";
    }
    std::cout << "\\n";
    return 0;
}'''..language='cpp'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_027'..topicId='cpp'..title='std::ranges (C++20)'..description='Ranges provide composable, lazy views for working with sequences using pipe syntax.'..code='''#include <iostream>
#include <vector>
#include <ranges>
#include <algorithm>

int main() {
    std::vector<int> nums = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    // Filter and transform with pipe
    auto result = nums
        | std::views::filter([](int n) { return n % 2 == 0; })
        | std::views::transform([](int n) { return n * n; });

    std::cout << "Even squares: ";
    for (int n : result) std::cout << n << " ";
    std::cout << "\\n";

    // Take and drop
    auto first3 = nums | std::views::take(3);
    auto skip3 = nums | std::views::drop(3);

    // Reverse view
    auto rev = nums | std::views::reverse;

    std::cout << "First 3: ";
    for (int n : first3) std::cout << n << " ";
    std::cout << "\\n";

    // iota view (range generation)
    for (int n : std::views::iota(1, 6)) {
        std::cout << n << " ";
    }
    std::cout << "\\n";
    return 0;
}'''..language='cpp'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_028'..topicId='cpp'..title='CRTP Pattern'..description='Curiously Recurring Template Pattern enables static polymorphism without virtual function overhead.'..code='''#include <iostream>
#include <string>

template<typename Derived>
class Serializable {
public:
    std::string serialize() {
        // Static dispatch — no virtual table
        return static_cast<Derived*>(this)->toJson();
    }
    void print() {
        std::cout << serialize() << "\\n";
    }
};

class User : public Serializable<User> {
    std::string name;
    int age;
public:
    User(std::string n, int a) : name(n), age(a) {}
    std::string toJson() {
        return "{name:" + name + ",age:"
               + std::to_string(age) + "}";
    }
};

class Product : public Serializable<Product> {
    std::string title;
    double price;
public:
    Product(std::string t, double p)
        : title(t), price(p) {}
    std::string toJson() {
        return "{title:" + title + ",price:"
               + std::to_string(price) + "}";
    }
};

int main() {
    User u("Alice", 30);
    Product p("Book", 29.99);
    u.print();
    p.print();
    return 0;
}'''..language='cpp'..difficulty='hard'..isSaved=false..lastViewedAt=null,

    // ── Very Hard (10) ──
    Snippet()..snippetId='cpp_029'..topicId='cpp'..title='Type Erasure'..description='Type erasure hides concrete types behind a uniform interface, enabling runtime polymorphism without inheritance.'..code='''#include <iostream>
#include <memory>
#include <vector>

class AnyPrintable {
    struct Concept {
        virtual void print() const = 0;
        virtual ~Concept() = default;
    };
    template<typename T>
    struct Model : Concept {
        T value;
        Model(T v) : value(std::move(v)) {}
        void print() const override {
            std::cout << value << "\\n";
        }
    };
    std::unique_ptr<Concept> ptr;
public:
    template<typename T>
    AnyPrintable(T val)
        : ptr(std::make_unique<Model<T>>(std::move(val))) {}
    void print() const { ptr->print(); }
};

int main() {
    std::vector<AnyPrintable> items;
    items.emplace_back(42);
    items.emplace_back(std::string("Hello"));
    items.emplace_back(3.14);

    for (const auto& item : items) {
        item.print();
    }
    return 0;
}'''..language='cpp'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_030'..topicId='cpp'..title='Custom Allocator'..description='Custom allocators control memory allocation strategy for STL containers — pool, arena, or stack allocation.'..code='''#include <iostream>
#include <vector>
#include <cstdlib>

template<typename T>
class PoolAllocator {
    static constexpr size_t POOL_SIZE = 1024;
    alignas(T) char pool[POOL_SIZE * sizeof(T)];
    size_t offset = 0;
public:
    using value_type = T;
    PoolAllocator() = default;
    template<typename U>
    PoolAllocator(const PoolAllocator<U>&) {}

    T* allocate(size_t n) {
        if (offset + n > POOL_SIZE) {
            throw std::bad_alloc();
        }
        T* ptr = reinterpret_cast<T*>(pool + offset * sizeof(T));
        offset += n;
        std::cout << "Pool alloc: " << n << " items\\n";
        return ptr;
    }
    void deallocate(T*, size_t n) {
        std::cout << "Pool dealloc: " << n << " items\\n";
    }
};

int main() {
    std::vector<int, PoolAllocator<int>> nums;
    nums.push_back(1);
    nums.push_back(2);
    nums.push_back(3);

    for (int n : nums) std::cout << n << " ";
    std::cout << "\\n";
    return 0;
}'''..language='cpp'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_031'..topicId='cpp'..title='Compile-Time Computation'..description='constexpr and template metaprogramming enable complex computations at compile time.'..code='''#include <iostream>
#include <array>

// constexpr function
constexpr long long fibonacci(int n) {
    if (n <= 1) return n;
    long long a = 0, b = 1;
    for (int i = 2; i <= n; i++) {
        long long next = a + b;
        a = b;
        b = next;
    }
    return b;
}

// constexpr array generation
template<size_t N>
constexpr std::array<long long, N> fibTable() {
    std::array<long long, N> result{};
    for (size_t i = 0; i < N; i++) {
        result[i] = fibonacci(i);
    }
    return result;
}

// Static assertion
static_assert(fibonacci(10) == 55, "fib(10) must be 55");

int main() {
    constexpr auto table = fibTable<20>();
    for (size_t i = 0; i < 20; i++) {
        std::cout << "fib(" << i << ") = "
                  << table[i] << "\\n";
    }
    return 0;
}'''..language='cpp'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_032'..topicId='cpp'..title='Thread Pool'..description='A thread pool manages worker threads and a task queue for efficient concurrent task execution.'..code='''#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <queue>
#include <functional>
#include <vector>
#include <future>

class ThreadPool {
    std::vector<std::thread> workers;
    std::queue<std::function<void()>> tasks;
    std::mutex mtx;
    std::condition_variable cv;
    bool stop = false;

public:
    ThreadPool(size_t threads) {
        for (size_t i = 0; i < threads; i++) {
            workers.emplace_back([this] {
                while (true) {
                    std::function<void()> task;
                    {
                        std::unique_lock lock(mtx);
                        cv.wait(lock, [this] {
                            return stop || !tasks.empty();
                        });
                        if (stop && tasks.empty()) return;
                        task = std::move(tasks.front());
                        tasks.pop();
                    }
                    task();
                }
            });
        }
    }

    template<typename F>
    auto submit(F&& f) -> std::future<decltype(f())> {
        auto task = std::make_shared<
            std::packaged_task<decltype(f())()>>(
            std::forward<F>(f));
        auto future = task->get_future();
        {
            std::lock_guard lock(mtx);
            tasks.push([task]() { (*task)(); });
        }
        cv.notify_one();
        return future;
    }

    ~ThreadPool() {
        { std::lock_guard lock(mtx); stop = true; }
        cv.notify_all();
        for (auto& w : workers) w.join();
    }
};

int main() {
    ThreadPool pool(4);
    auto f1 = pool.submit([] { return 42; });
    auto f2 = pool.submit([] { return 3.14; });
    std::cout << f1.get() << " " << f2.get() << "\\n";
    return 0;
}'''..language='cpp'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_033'..topicId='cpp'..title='Expression Templates'..description='Expression templates defer computation to avoid temporaries in mathematical expressions.'..code='''#include <iostream>
#include <vector>
#include <cassert>

// Expression template for lazy vector math
template<typename E>
struct VecExpr {
    double operator[](size_t i) const {
        return static_cast<const E&>(*this)[i];
    }
    size_t size() const {
        return static_cast<const E&>(*this).size();
    }
};

class Vec : public VecExpr<Vec> {
    std::vector<double> data;
public:
    Vec(size_t n) : data(n) {}
    Vec(std::initializer_list<double> init)
        : data(init) {}

    template<typename E>
    Vec(const VecExpr<E>& expr)
        : data(expr.size()) {
        for (size_t i = 0; i < data.size(); i++)
            data[i] = expr[i];
    }

    double operator[](size_t i) const { return data[i]; }
    double& operator[](size_t i) { return data[i]; }
    size_t size() const { return data.size(); }
};

template<typename L, typename R>
struct VecAdd : public VecExpr<VecAdd<L, R>> {
    const L& lhs; const R& rhs;
    VecAdd(const L& l, const R& r) : lhs(l), rhs(r) {}
    double operator[](size_t i) const {
        return lhs[i] + rhs[i];
    }
    size_t size() const { return lhs.size(); }
};

template<typename L, typename R>
VecAdd<L, R> operator+(
    const VecExpr<L>& l, const VecExpr<R>& r) {
    return VecAdd<L, R>(
        static_cast<const L&>(l),
        static_cast<const R&>(r));
}

int main() {
    Vec a = {1, 2, 3};
    Vec b = {4, 5, 6};
    Vec c = {7, 8, 9};
    Vec result = a + b + c;  // No temporaries!
    for (size_t i = 0; i < result.size(); i++)
        std::cout << result[i] << " ";  // 12 15 18
    std::cout << "\\n";
    return 0;
}'''..language='cpp'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_034'..topicId='cpp'..title='Compile-Time String Processing'..description='Using constexpr and template metaprogramming for compile-time string hashing and validation.'..code='''#include <iostream>
#include <string_view>
#include <array>

// Compile-time FNV-1a hash
constexpr uint64_t fnv1a(std::string_view sv) {
    uint64_t hash = 14695981039346656037ULL;
    for (char c : sv) {
        hash ^= static_cast<uint64_t>(c);
        hash *= 1099511628211ULL;
    }
    return hash;
}

// Compile-time string switch
constexpr uint64_t operator""_hash(
    const char* str, size_t len) {
    return fnv1a(std::string_view(str, len));
}

std::string handleCommand(std::string_view cmd) {
    switch (fnv1a(cmd)) {
        case "start"_hash: return "Starting...";
        case "stop"_hash:  return "Stopping...";
        case "reset"_hash: return "Resetting...";
        default:           return "Unknown command";
    }
}

// Compile-time validation
constexpr bool isValidEmail(std::string_view sv) {
    auto at = sv.find('@');
    if (at == std::string_view::npos) return false;
    auto dot = sv.find('.', at);
    return dot != std::string_view::npos
           && dot > at + 1 && dot < sv.size() - 1;
}

static_assert(isValidEmail("a@b.com"));
static_assert(!isValidEmail("invalid"));

int main() {
    std::cout << handleCommand("start") << "\\n";
    std::cout << handleCommand("stop") << "\\n";
    std::cout << handleCommand("foo") << "\\n";
    return 0;
}'''..language='cpp'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_035'..topicId='cpp'..title='std::any and std::function'..description='std::any holds any type-erased value. std::function wraps any callable with a given signature.'..code='''#include <iostream>
#include <any>
#include <functional>
#include <map>
#include <string>
#include <vector>

// Event system with std::any
class EventBus {
    using Handler = std::function<void(const std::any&)>;
    std::map<std::string, std::vector<Handler>> handlers;
public:
    void on(const std::string& event, Handler h) {
        handlers[event].push_back(std::move(h));
    }
    void emit(const std::string& event,
              const std::any& data = {}) {
        if (handlers.count(event)) {
            for (auto& h : handlers[event]) h(data);
        }
    }
};

int main() {
    EventBus bus;
    bus.on("click", [](const std::any& data) {
        auto pos = std::any_cast<
            std::pair<int, int>>(data);
        std::cout << "Click at ("
                  << pos.first << ", "
                  << pos.second << ")\\n";
    });
    bus.on("message", [](const std::any& data) {
        std::cout << "Message: "
                  << std::any_cast<std::string>(data)
                  << "\\n";
    });

    bus.emit("click", std::make_pair(100, 200));
    bus.emit("message", std::string("Hello!"));
    return 0;
}'''..language='cpp'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_036'..topicId='cpp'..title='Policy-Based Design'..description='Policy classes configure behavior at compile time through template parameters for maximum flexibility.'..code='''#include <iostream>
#include <string>
#include <mutex>

// Logging policies
struct ConsoleLog {
    static void log(const std::string& msg) {
        std::cout << "[LOG] " << msg << "\\n";
    }
};
struct NullLog {
    static void log(const std::string&) {}
};

// Threading policies
struct SingleThread {
    struct Lock {};
    void lock() {}
    void unlock() {}
};
struct MultiThread {
    std::mutex mtx;
    using Lock = std::lock_guard<std::mutex>;
    void lock() { mtx.lock(); }
    void unlock() { mtx.unlock(); }
};

// Policy-based class
template<typename LogPolicy = ConsoleLog,
         typename ThreadPolicy = SingleThread>
class Cache : private ThreadPolicy {
    std::map<std::string, int> data;
public:
    void put(const std::string& key, int val) {
        typename ThreadPolicy::Lock lock;
        LogPolicy::log("PUT " + key);
        data[key] = val;
    }
    int get(const std::string& key) {
        LogPolicy::log("GET " + key);
        return data[key];
    }
};

int main() {
    Cache<ConsoleLog, SingleThread> cache;
    cache.put("x", 42);
    std::cout << cache.get("x") << "\\n";

    Cache<NullLog> silent;
    silent.put("y", 100);
    return 0;
}'''..language='cpp'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_037'..topicId='cpp'..title='Fold Expressions'..description='C++17 fold expressions simplify variadic template operations with concise syntax for parameter packs.'..code='''#include <iostream>
#include <string>
#include <vector>
#include <type_traits>

// Sum all arguments
template<typename... Args>
auto sum(Args... args) {
    return (args + ...);  // unary right fold
}

// Check if all are true
template<typename... Args>
bool allTrue(Args... args) {
    return (args && ...);
}

// Print all with separator
template<typename... Args>
void printAll(Args... args) {
    ((std::cout << args << " "), ...);
    std::cout << "\\n";
}

// Push all to vector
template<typename T, typename... Args>
void pushAll(std::vector<T>& v, Args... args) {
    (v.push_back(args), ...);
}

// Type checking
template<typename... Args>
constexpr bool allIntegral() {
    return (std::is_integral_v<Args> && ...);
}

int main() {
    std::cout << sum(1, 2, 3, 4, 5) << "\\n";  // 15
    std::cout << sum(1.1, 2.2, 3.3) << "\\n";    // 6.6
    std::cout << std::boolalpha
              << allTrue(true, true, false) << "\\n";
    printAll("Hello", 42, 3.14);

    std::vector<int> v;
    pushAll(v, 1, 2, 3, 4, 5);
    for (int n : v) std::cout << n << " ";
    std::cout << "\\n";

    static_assert(allIntegral<int, long, short>());
    return 0;
}'''..language='cpp'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_038'..topicId='cpp'..title='Modules (C++20)'..description='Modules replace headers with faster, encapsulated compilation units that avoid preprocessor issues.'..code='''// ── math_utils.cppm (module interface) ──
// export module math_utils;
//
// export namespace math {
//     constexpr double PI = 3.14159265358979;
//
//     constexpr double circleArea(double r) {
//         return PI * r * r;
//     }
//     constexpr double sphereVolume(double r) {
//         return (4.0 / 3.0) * PI * r * r * r;
//     }
//     int factorial(int n) {
//         int result = 1;
//         for (int i = 2; i <= n; i++) result *= i;
//         return result;
//     }
// }

// ── main.cpp ──
// import math_utils;
#include <iostream>

// Simulated module usage
namespace math {
    constexpr double PI = 3.14159265358979;
    constexpr double circleArea(double r) {
        return PI * r * r;
    }
    int factorial(int n) {
        int result = 1;
        for (int i = 2; i <= n; i++) result *= i;
        return result;
    }
}

int main() {
    std::cout << "Area: " << math::circleArea(5) << "\\n";
    std::cout << "5! = " << math::factorial(5) << "\\n";
    return 0;
}'''..language='cpp'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_039'..topicId='cpp'..title='Structured Bindings'..description='C++17 structured bindings allow decomposing objects into named variables for cleaner code.'..code='''#include <iostream>
#include <map>
#include <tuple>
#include <string>
#include <vector>

struct Point { double x, y, z; };

auto getMinMax(const std::vector<int>& v) {
    auto [minIt, maxIt] = std::minmax_element(
        v.begin(), v.end());
    return std::make_tuple(*minIt, *maxIt);
}

int main() {
    // With arrays
    int arr[] = {1, 2, 3};
    auto [a, b, c] = arr;
    std::cout << a << " " << b << " " << c << "\\n";

    // With structs
    Point p{1.0, 2.0, 3.0};
    auto [x, y, z] = p;
    std::cout << x << " " << y << " " << z << "\\n";

    // With maps
    std::map<std::string, int> scores = {
        {"Alice", 95}, {"Bob", 87}
    };
    for (const auto& [name, score] : scores) {
        std::cout << name << ": " << score << "\\n";
    }

    // With tuples
    std::vector<int> nums = {5, 3, 8, 1, 9};
    auto [lo, hi] = getMinMax(nums);
    std::cout << "Min: " << lo
              << " Max: " << hi << "\\n";
    return 0;
}'''..language='cpp'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='cpp_040'..topicId='cpp'..title='Memory-Mapped I/O with mmap'..description='Memory-mapped files provide efficient large file access by mapping file contents directly into virtual memory.'..code='''#include <iostream>
#include <cstring>
#include <fstream>
#include <string>
// Platform-specific: POSIX example
// #include <sys/mman.h>
// #include <fcntl.h>
// #include <unistd.h>

// Simulated memory-mapped file reader
class MappedFile {
    std::string data;
    size_t fileSize;
public:
    MappedFile(const std::string& path) {
        std::ifstream f(path, std::ios::binary | std::ios::ate);
        fileSize = f.tellg();
        f.seekg(0);
        data.resize(fileSize);
        f.read(data.data(), fileSize);
    }
    const char* begin() const { return data.data(); }
    const char* end() const { return data.data() + fileSize; }
    size_t size() const { return fileSize; }

    std::string_view view(size_t offset, size_t len) const {
        return std::string_view(data.data() + offset,
                                std::min(len, fileSize - offset));
    }

    size_t countLines() const {
        return std::count(data.begin(), data.end(), '\\n');
    }
};

int main() {
    // Write test file
    {
        std::ofstream f("test.txt");
        for (int i = 0; i < 100; i++)
            f << "Line " << i << "\\n";
    }
    MappedFile mf("test.txt");
    std::cout << "File size: " << mf.size() << "\\n";
    std::cout << "Lines: " << mf.countLines() << "\\n";
    std::cout << "First 20 bytes: "
              << mf.view(0, 20) << "\\n";
    return 0;
}'''..language='cpp'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
  ];
}
