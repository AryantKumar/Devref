import '../models/snippet.dart';

List<Snippet> getPythonSnippets() {
  return [
    // ── Very Easy (10) ──
    Snippet()..snippetId = 'python_001'..topicId = 'python'..title = 'Hello World'..description = 'The simplest Python program that prints text to the console.'..code = '''print("Hello, World!")'''..language = 'python'..difficulty = 'very_easy'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_002'..topicId = 'python'..title = 'Variables and Types'..description = 'Python is dynamically typed. Variables are assigned without type declarations and can change type.'..code = '''name = "Python"
age = 30
pi = 3.14159
is_awesome = True
print(f"Name: {name}, Age: {age}")
print(f"Pi: {pi}, Awesome: {is_awesome}")
print(type(name), type(age), type(pi))'''..language = 'python'..difficulty = 'very_easy'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_003'..topicId = 'python'..title = 'String Formatting (f-strings)'..description = 'F-strings provide a concise way to embed expressions inside string literals using curly braces.'..code = '''name = "Alice"
age = 30
balance = 1234.5678

print(f"Hello, {name}!")
print(f"Next year you will be {age + 1}")
print(f"Balance: \${balance:.2f}")
print(f"{'Python':>20}")  # right-aligned
print(f"{'Python':*^20}") # center with fill'''..language = 'python'..difficulty = 'very_easy'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_004'..topicId = 'python'..title = 'Lists and Basic Operations'..description = 'Lists are mutable ordered sequences supporting indexing, slicing, and various methods.'..code = '''fruits = ["apple", "banana", "cherry"]
fruits.append("date")
fruits.insert(1, "blueberry")
print(fruits)            # all fruits
print(fruits[0])         # apple
print(fruits[-1])        # date
print(fruits[1:3])       # slicing
print(len(fruits))       # length
fruits.remove("banana")
popped = fruits.pop()
print(f"Popped: {popped}, Remaining: {fruits}")'''..language = 'python'..difficulty = 'very_easy'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_005'..topicId = 'python'..title = 'Dictionaries'..description = 'Dictionaries store key-value pairs with O(1) average lookup time. Keys must be hashable.'..code = '''person = {
    "name": "Alice",
    "age": 30,
    "city": "Berlin"
}
print(person["name"])
print(person.get("phone", "N/A"))

person["email"] = "alice@example.com"
for key, value in person.items():
    print(f"{key}: {value}")

keys = list(person.keys())
values = list(person.values())
print(f"Keys: {keys}")'''..language = 'python'..difficulty = 'very_easy'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_006'..topicId = 'python'..title = 'Conditional Statements'..description = 'Python uses if-elif-else for conditional branching with indentation-based blocks.'..code = '''score = 85

if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
else:
    grade = "F"

print(f"Score: {score}, Grade: {grade}")

# Ternary expression
status = "pass" if score >= 60 else "fail"
print(f"Status: {status}")'''..language = 'python'..difficulty = 'very_easy'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_007'..topicId = 'python'..title = 'For and While Loops'..description = 'Python for loops iterate over sequences. While loops run until a condition is false.'..code = '''# For loop with range
for i in range(5):
    print(i, end=" ")  # 0 1 2 3 4
print()

# Enumerate
colors = ["red", "green", "blue"]
for idx, color in enumerate(colors):
    print(f"{idx}: {color}")

# While loop
count = 0
while count < 3:
    print(f"Count: {count}")
    count += 1

# List comprehension
squares = [x**2 for x in range(10)]
print(squares)'''..language = 'python'..difficulty = 'very_easy'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_008'..topicId = 'python'..title = 'Functions'..description = 'Define reusable functions with def keyword. Supports default arguments and return values.'..code = '''def greet(name, greeting="Hello"):
    return f"{greeting}, {name}!"

def calculate_area(length, width):
    """Calculate rectangle area."""
    return length * width

def get_stats(*numbers):
    return {
        "min": min(numbers),
        "max": max(numbers),
        "avg": sum(numbers) / len(numbers)
    }

print(greet("Alice"))
print(greet("Bob", "Hi"))
print(calculate_area(5, 3))
print(get_stats(1, 2, 3, 4, 5))'''..language = 'python'..difficulty = 'very_easy'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_009'..topicId = 'python'..title = 'Tuples and Unpacking'..description = 'Tuples are immutable sequences. Unpacking assigns tuple elements to variables in one statement.'..code = '''# Tuple creation
point = (3, 4)
rgb = (255, 128, 0)

# Unpacking
x, y = point
r, g, b = rgb
print(f"Point: ({x}, {y})")

# Swap values
a, b = 1, 2
a, b = b, a
print(f"Swapped: a={a}, b={b}")

# Extended unpacking
first, *rest = [1, 2, 3, 4, 5]
print(f"First: {first}, Rest: {rest}")'''..language = 'python'..difficulty = 'very_easy'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_010'..topicId = 'python'..title = 'File Reading and Writing'..description = 'Use the with statement for safe file handling. It automatically closes the file when done.'..code = '''# Writing to a file
with open("example.txt", "w") as f:
    f.write("Hello, World!\\n")
    f.write("Python file I/O\\n")

# Reading entire file
with open("example.txt", "r") as f:
    content = f.read()
    print(content)

# Reading line by line
with open("example.txt", "r") as f:
    for line in f:
        print(line.strip())

# Appending
with open("example.txt", "a") as f:
    f.write("Appended line\\n")'''..language = 'python'..difficulty = 'very_easy'..isSaved = false..lastViewedAt = null,

    // ── Medium (10) ──
    Snippet()..snippetId = 'python_011'..topicId = 'python'..title = 'List Comprehensions'..description = 'Concise syntax for creating lists by applying an expression to each item in an iterable with optional filtering.'..code = '''# Basic comprehension
squares = [x**2 for x in range(10)]

# With condition
evens = [x for x in range(20) if x % 2 == 0]

# Nested comprehension (flatten)
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
flat = [num for row in matrix for num in row]

# Dict comprehension
word = "hello"
char_count = {c: word.count(c) for c in set(word)}

# Set comprehension
unique_lengths = {len(w) for w in ["hello", "world", "hi", "hey"]}

print(f"Squares: {squares}")
print(f"Flat: {flat}")
print(f"Char count: {char_count}")'''..language = 'python'..difficulty = 'medium'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_012'..topicId = 'python'..title = 'Decorators'..description = 'Decorators are functions that modify the behavior of other functions using the @decorator syntax.'..code = '''import functools
import time

def timer(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        start = time.perf_counter()
        result = func(*args, **kwargs)
        elapsed = time.perf_counter() - start
        print(f"{func.__name__} took {elapsed:.4f}s")
        return result
    return wrapper

def retry(max_attempts=3):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            for attempt in range(1, max_attempts + 1):
                try:
                    return func(*args, **kwargs)
                except Exception as e:
                    print(f"Attempt {attempt} failed: {e}")
            raise RuntimeError(f"All {max_attempts} attempts failed")
        return wrapper
    return decorator

@timer
@retry(max_attempts=2)
def fetch_data(url):
    print(f"Fetching {url}")
    return {"status": "ok"}

result = fetch_data("https://api.example.com")'''..language = 'python'..difficulty = 'medium'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_013'..topicId = 'python'..title = 'Classes and OOP'..description = 'Python classes support inheritance, encapsulation, and polymorphism with a clean syntax.'..code = '''class Animal:
    def __init__(self, name, sound):
        self.name = name
        self._sound = sound  # protected by convention

    def speak(self):
        return f"{self.name} says {self._sound}!"

    def __str__(self):
        return f"Animal({self.name})"

class Dog(Animal):
    def __init__(self, name, breed):
        super().__init__(name, "Woof")
        self.breed = breed

    def fetch(self, item):
        return f"{self.name} fetches the {item}"

class Cat(Animal):
    def __init__(self, name):
        super().__init__(name, "Meow")

dog = Dog("Rex", "Labrador")
cat = Cat("Whiskers")
print(dog.speak())
print(dog.fetch("ball"))
print(cat.speak())'''..language = 'python'..difficulty = 'medium'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_014'..topicId = 'python'..title = 'Exception Handling'..description = 'Python exception handling with try-except-else-finally blocks and custom exception classes.'..code = '''class InsufficientFundsError(Exception):
    def __init__(self, balance, amount):
        self.balance = balance
        self.amount = amount
        super().__init__(
            f"Cannot withdraw \${amount}. Balance: \${balance}"
        )

class BankAccount:
    def __init__(self, balance=0):
        self.balance = balance

    def withdraw(self, amount):
        if amount > self.balance:
            raise InsufficientFundsError(self.balance, amount)
        self.balance -= amount
        return self.balance

account = BankAccount(100)
try:
    account.withdraw(50)
    print(f"Balance: {account.balance}")
    account.withdraw(200)
except InsufficientFundsError as e:
    print(f"Error: {e}")
except Exception as e:
    print(f"Unexpected: {e}")
else:
    print("All withdrawals successful")
finally:
    print(f"Final balance: {account.balance}")'''..language = 'python'..difficulty = 'medium'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_015'..topicId = 'python'..title = 'Context Managers'..description = 'Context managers manage resources with the with statement. Create custom ones using __enter__ and __exit__.'..code = '''import time

class Timer:
    def __init__(self, label="Block"):
        self.label = label

    def __enter__(self):
        self.start = time.perf_counter()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        elapsed = time.perf_counter() - self.start
        print(f"{self.label} took {elapsed:.4f}s")
        return False  # Don't suppress exceptions

# Usage
with Timer("Processing"):
    total = sum(range(1_000_000))
    print(f"Sum: {total}")

# Using contextmanager decorator
from contextlib import contextmanager

@contextmanager
def temp_directory():
    import tempfile, shutil
    path = tempfile.mkdtemp()
    try:
        yield path
    finally:
        shutil.rmtree(path)'''..language = 'python'..difficulty = 'medium'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_016'..topicId = 'python'..title = 'Lambda and Functional Tools'..description = 'Lambda creates anonymous functions. Combined with map, filter, and reduce for functional programming.'..code = '''from functools import reduce

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Lambda with map
squared = list(map(lambda x: x**2, numbers))

# Lambda with filter
evens = list(filter(lambda x: x % 2 == 0, numbers))

# Lambda with reduce
product = reduce(lambda a, b: a * b, numbers)

# Lambda with sorted
students = [("Alice", 85), ("Bob", 92), ("Charlie", 78)]
by_score = sorted(students, key=lambda s: s[1], reverse=True)

print(f"Squared: {squared}")
print(f"Evens: {evens}")
print(f"Product: {product}")
print(f"By score: {by_score}")'''..language = 'python'..difficulty = 'medium'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_017'..topicId = 'python'..title = 'Dataclasses'..description = 'Dataclasses auto-generate __init__, __repr__, __eq__ and more for classes that primarily store data.'..code = '''from dataclasses import dataclass, field
from typing import List

@dataclass
class Point:
    x: float
    y: float

    def distance_to(self, other: "Point") -> float:
        return ((self.x - other.x)**2 + (self.y - other.y)**2)**0.5

@dataclass(order=True)
class Student:
    sort_index: float = field(init=False, repr=False)
    name: str
    gpa: float
    courses: List[str] = field(default_factory=list)

    def __post_init__(self):
        self.sort_index = self.gpa

p1 = Point(0, 0)
p2 = Point(3, 4)
print(f"Distance: {p1.distance_to(p2)}")

s1 = Student("Alice", 3.8, ["Math", "CS"])
s2 = Student("Bob", 3.9)
print(f"s1 < s2: {s1 < s2}")
print(s1)'''..language = 'python'..difficulty = 'medium'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_018'..topicId = 'python'..title = 'Itertools Recipes'..description = 'The itertools module provides memory-efficient tools for creating iterators for efficient looping.'..code = '''from itertools import (
    chain, combinations, permutations,
    product, groupby, islice, count
)

# Chain multiple iterables
merged = list(chain([1, 2], [3, 4], [5]))
print(f"Chain: {merged}")

# Combinations and permutations
combos = list(combinations("ABCD", 2))
perms = list(permutations("ABC", 2))
print(f"C(4,2): {combos}")
print(f"P(3,2): {perms}")

# Cartesian product
grid = list(product(range(3), repeat=2))
print(f"Grid: {grid}")

# GroupBy (requires sorted input)
data = sorted(["apple", "avocado", "banana", "blueberry", "cherry"])
for key, group in groupby(data, key=lambda x: x[0]):
    print(f"{key}: {list(group)}")'''..language = 'python'..difficulty = 'medium'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_019'..topicId = 'python'..title = 'Regular Expressions'..description = 'The re module provides powerful pattern matching and text manipulation using regular expressions.'..code = '''import re

text = "Contact us at support@email.com or sales@company.org"

# Find all emails
emails = re.findall(r'[\\w.+-]+@[\\w-]+\\.[\\w.-]+', text)
print(f"Emails: {emails}")

# Named groups
pattern = r'(?P<user>[\\w.+-]+)@(?P<domain>[\\w-]+\\.\\w+)'
for match in re.finditer(pattern, text):
    print(f"User: {match.group('user')}, Domain: {match.group('domain')}")

# Substitution
cleaned = re.sub(r'\\s+', ' ', "  too   many   spaces  ")
print(f"Cleaned: '{cleaned.strip()}'")

# Validation
def is_valid_phone(phone):
    return bool(re.match(r'^\\+?\\d{1,3}[- ]?\\d{3,14}\$', phone))

print(is_valid_phone("+1-5551234567"))'''..language = 'python'..difficulty = 'medium'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_020'..topicId = 'python'..title = 'Generators'..description = 'Generators produce values lazily using yield, enabling memory-efficient iteration over large datasets.'..code = '''def fibonacci(limit=None):
    a, b = 0, 1
    count = 0
    while limit is None or count < limit:
        yield a
        a, b = b, a + b
        count += 1

# Get first 10 Fibonacci numbers
fibs = list(fibonacci(10))
print(f"Fibonacci: {fibs}")

# Generator expression
squares_gen = (x**2 for x in range(1000000))
print(f"First 5: {[next(squares_gen) for _ in range(5)]}")

# Pipeline of generators
def read_lines(text):
    for line in text.split("\\n"):
        yield line.strip()

def non_empty(lines):
    for line in lines:
        if line:
            yield line

text = "hello\\n\\nworld\\n\\npython"
result = list(non_empty(read_lines(text)))
print(result)'''..language = 'python'..difficulty = 'medium'..isSaved = false..lastViewedAt = null,

    // ── Hard (10) ──
    Snippet()..snippetId = 'python_021'..topicId = 'python'..title = 'Metaclasses'..description = 'Metaclasses are classes of classes. They control class creation and can enforce patterns like singletons.'..code = '''class SingletonMeta(type):
    _instances = {}

    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            instance = super().__call__(*args, **kwargs)
            cls._instances[cls] = instance
        return cls._instances[cls]

class Database(metaclass=SingletonMeta):
    def __init__(self, url="localhost:5432"):
        self.url = url
        print(f"Connecting to {url}")

# Only creates one instance
db1 = Database("prod-db:5432")
db2 = Database("other-db:5432")
print(f"Same instance: {db1 is db2}")  # True
print(f"URL: {db2.url}")  # prod-db:5432'''..language = 'python'..difficulty = 'hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_022'..topicId = 'python'..title = 'AsyncIO Basics'..description = 'Python asyncio enables concurrent I/O-bound operations using async/await with an event loop.'..code = '''import asyncio

async def fetch_data(url, delay):
    print(f"Fetching {url}...")
    await asyncio.sleep(delay)  # simulate I/O
    return f"Data from {url}"

async def main():
    # Sequential: ~3s
    result1 = await fetch_data("api/users", 1)
    result2 = await fetch_data("api/posts", 1)

    # Concurrent: ~1s
    results = await asyncio.gather(
        fetch_data("api/users", 1),
        fetch_data("api/posts", 1),
        fetch_data("api/comments", 1),
    )
    for r in results:
        print(r)

    # With timeout
    try:
        result = await asyncio.wait_for(
            fetch_data("slow-api", 10), timeout=2.0
        )
    except asyncio.TimeoutError:
        print("Request timed out!")

asyncio.run(main())'''..language = 'python'..difficulty = 'hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_023'..topicId = 'python'..title = 'Descriptors Protocol'..description = 'Descriptors define how attribute access is intercepted using __get__, __set__, and __delete__.'..code = '''class Validated:
    def __init__(self, validator, error_msg="Invalid value"):
        self.validator = validator
        self.error_msg = error_msg

    def __set_name__(self, owner, name):
        self.name = name
        self.private_name = f"_{name}"

    def __get__(self, obj, objtype=None):
        if obj is None:
            return self
        return getattr(obj, self.private_name, None)

    def __set__(self, obj, value):
        if not self.validator(value):
            raise ValueError(f"{self.name}: {self.error_msg}")
        setattr(obj, self.private_name, value)

class User:
    name = Validated(
        lambda v: isinstance(v, str) and len(v) >= 2,
        "Name must be at least 2 characters"
    )
    age = Validated(
        lambda v: isinstance(v, int) and 0 <= v <= 150,
        "Age must be 0-150"
    )

u = User()
u.name = "Alice"
u.age = 30
print(f"{u.name}, {u.age}")'''..language = 'python'..difficulty = 'hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_024'..topicId = 'python'..title = 'Abstract Base Classes'..description = 'ABCs define interfaces that subclasses must implement, enforcing contracts at class instantiation time.'..code = '''from abc import ABC, abstractmethod
from typing import List

class Repository(ABC):
    @abstractmethod
    def find_by_id(self, id: int):
        pass

    @abstractmethod
    def save(self, entity) -> None:
        pass

    @abstractmethod
    def delete(self, id: int) -> bool:
        pass

    def find_all(self) -> List:
        """Default implementation"""
        return []

class InMemoryUserRepo(Repository):
    def __init__(self):
        self._store = {}
        self._next_id = 1

    def find_by_id(self, id: int):
        return self._store.get(id)

    def save(self, entity) -> None:
        entity["id"] = self._next_id
        self._store[self._next_id] = entity
        self._next_id += 1

    def delete(self, id: int) -> bool:
        return self._store.pop(id, None) is not None

repo = InMemoryUserRepo()
repo.save({"name": "Alice"})
print(repo.find_by_id(1))'''..language = 'python'..difficulty = 'hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_025'..topicId = 'python'..title = 'Concurrency with ThreadPool'..description = 'Use concurrent.futures for parallel execution with thread pools for I/O-bound and process pools for CPU-bound tasks.'..code = '''from concurrent.futures import ThreadPoolExecutor, as_completed
import time

def download_page(url):
    time.sleep(0.5)  # simulate download
    return f"Content from {url} ({len(url)} chars)"

urls = [f"https://example.com/page/{i}" for i in range(10)]

# Sequential
start = time.perf_counter()
results_seq = [download_page(url) for url in urls]
seq_time = time.perf_counter() - start

# Concurrent with ThreadPool
start = time.perf_counter()
with ThreadPoolExecutor(max_workers=5) as executor:
    futures = {executor.submit(download_page, url): url for url in urls}
    results = {}
    for future in as_completed(futures):
        url = futures[future]
        results[url] = future.result()
pool_time = time.perf_counter() - start

print(f"Sequential: {seq_time:.2f}s")
print(f"ThreadPool: {pool_time:.2f}s")
print(f"Speedup: {seq_time/pool_time:.1f}x")'''..language = 'python'..difficulty = 'hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_026'..topicId = 'python'..title = 'Property Decorators'..description = 'Properties provide getter/setter/deleter methods for controlled attribute access with clean syntax.'..code = '''class Temperature:
    def __init__(self, celsius=0):
        self._celsius = celsius

    @property
    def celsius(self):
        return self._celsius

    @celsius.setter
    def celsius(self, value):
        if value < -273.15:
            raise ValueError("Below absolute zero!")
        self._celsius = value

    @property
    def fahrenheit(self):
        return self._celsius * 9/5 + 32

    @fahrenheit.setter
    def fahrenheit(self, value):
        self.celsius = (value - 32) * 5/9

    @property
    def kelvin(self):
        return self._celsius + 273.15

    def __repr__(self):
        return f"Temperature({self._celsius}°C)"

t = Temperature(100)
print(f"{t.celsius}°C = {t.fahrenheit}°F = {t.kelvin}K")
t.fahrenheit = 72
print(f"{t.celsius:.1f}°C = {t.fahrenheit:.1f}°F")'''..language = 'python'..difficulty = 'hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_027'..topicId = 'python'..title = 'Slots and Memory Optimization'..description = 'Using __slots__ prevents dynamic attribute creation and reduces memory usage by avoiding __dict__.'..code = '''import sys

class RegularPoint:
    def __init__(self, x, y, z):
        self.x = x
        self.y = y
        self.z = z

class SlottedPoint:
    __slots__ = ('x', 'y', 'z')
    def __init__(self, x, y, z):
        self.x = x
        self.y = y
        self.z = z

regular = RegularPoint(1, 2, 3)
slotted = SlottedPoint(1, 2, 3)

print(f"Regular size: {sys.getsizeof(regular)} + {sys.getsizeof(regular.__dict__)}")
print(f"Slotted size: {sys.getsizeof(slotted)}")

# Regular allows dynamic attrs
regular.w = 4  # OK

# Slotted does not
try:
    slotted.w = 4
except AttributeError as e:
    print(f"Slotted error: {e}")'''..language = 'python'..difficulty = 'hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_028'..topicId = 'python'..title = 'Type Hints and Protocol'..description = 'Structural subtyping with Protocol enables duck typing with static type checking support.'..code = '''from typing import Protocol, runtime_checkable

@runtime_checkable
class Drawable(Protocol):
    def draw(self) -> str: ...

class Circle:
    def __init__(self, radius: float):
        self.radius = radius

    def draw(self) -> str:
        return f"Circle(r={self.radius})"

class Square:
    def __init__(self, side: float):
        self.side = side

    def draw(self) -> str:
        return f"Square(s={self.side})"

def render(shapes: list[Drawable]) -> None:
    for shape in shapes:
        print(f"Drawing: {shape.draw()}")

shapes = [Circle(5), Square(3)]
render(shapes)

# Runtime check
print(isinstance(Circle(1), Drawable))  # True
print(isinstance("hello", Drawable))     # False'''..language = 'python'..difficulty = 'hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_029'..topicId = 'python'..title = 'Async Generators'..description = 'Async generators combine generators with async/await for efficient asynchronous streaming of data.'..code = '''import asyncio

async def async_range(start, stop, delay=0.1):
    for i in range(start, stop):
        await asyncio.sleep(delay)
        yield i

async def batch_processor(batch_size=3):
    batch = []
    async for item in async_range(0, 10, 0.05):
        batch.append(item)
        if len(batch) >= batch_size:
            yield batch
            batch = []
    if batch:
        yield batch

async def main():
    # Async for loop
    async for num in async_range(0, 5, 0.1):
        print(f"Got: {num}")

    # Async generator with batching
    async for batch in batch_processor(3):
        print(f"Batch: {batch}")

asyncio.run(main())'''..language = 'python'..difficulty = 'hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_030'..topicId = 'python'..title = 'Closure and Nonlocal'..description = 'Closures capture variables from enclosing scope. Use nonlocal to modify enclosed variables.'..code = '''def make_counter(start=0):
    count = start
    def counter():
        nonlocal count
        count += 1
        return count
    return counter

def make_accumulator():
    total = 0
    history = []
    def accumulate(value):
        nonlocal total
        total += value
        history.append(value)
        return total
    def get_history():
        return list(history)
    return accumulate, get_history

c1 = make_counter()
print(c1(), c1(), c1())  # 1 2 3

acc, hist = make_accumulator()
print(acc(10))   # 10
print(acc(20))   # 30
print(acc(5))    # 35
print(hist())    # [10, 20, 5]'''..language = 'python'..difficulty = 'hard'..isSaved = false..lastViewedAt = null,

    // ── Very Hard (10) ──
    Snippet()..snippetId = 'python_031'..topicId = 'python'..title = 'Custom Metaclass with Registry'..description = 'Metaclasses can auto-register classes, enforce naming conventions, and inject methods at class creation.'..code = '''class PluginRegistry(type):
    plugins = {}

    def __new__(mcs, name, bases, namespace):
        cls = super().__new__(mcs, name, bases, namespace)
        if bases:  # skip base class registration
            plugin_name = namespace.get('plugin_name', name.lower())
            mcs.plugins[plugin_name] = cls
        return cls

    @classmethod
    def get_plugin(mcs, name):
        return mcs.plugins.get(name)

class Plugin(metaclass=PluginRegistry):
    def execute(self):
        raise NotImplementedError

class JSONPlugin(Plugin):
    plugin_name = "json"
    def execute(self):
        return "Parsing JSON"

class XMLPlugin(Plugin):
    plugin_name = "xml"
    def execute(self):
        return "Parsing XML"

print(PluginRegistry.plugins)
plugin = PluginRegistry.get_plugin("json")()
print(plugin.execute())'''..language = 'python'..difficulty = 'very_hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_032'..topicId = 'python'..title = 'Custom Import Hook'..description = 'Python allows custom import hooks using importlib to modify how modules are found and loaded.'..code = '''import importlib
import importlib.abc
import importlib.machinery
import sys
import types

class DictImporter(importlib.abc.MetaPathFinder, importlib.abc.Loader):
    def __init__(self, modules_dict):
        self.modules = modules_dict

    def find_module(self, fullname, path=None):
        if fullname in self.modules:
            return self
        return None

    def load_module(self, fullname):
        if fullname in sys.modules:
            return sys.modules[fullname]
        code = self.modules[fullname]
        mod = types.ModuleType(fullname)
        mod.__loader__ = self
        sys.modules[fullname] = mod
        exec(code, mod.__dict__)
        return mod

# Register virtual modules
virtual_modules = {
    "mymath": "def add(a, b): return a + b\\ndef mul(a, b): return a * b",
    "myutils": "def hello(name): return f'Hello, {name}!'"
}

sys.meta_path.insert(0, DictImporter(virtual_modules))
import mymath
print(mymath.add(5, 3))  # 8'''..language = 'python'..difficulty = 'very_hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_033'..topicId = 'python'..title = 'Advanced Asyncio Patterns'..description = 'Producer-consumer pattern with asyncio queues, semaphores for rate limiting, and graceful shutdown.'..code = '''import asyncio
from asyncio import Queue, Semaphore

async def producer(queue: Queue, n: int):
    for i in range(n):
        await asyncio.sleep(0.1)
        await queue.put(f"item-{i}")
        print(f"Produced: item-{i}")
    await queue.put(None)  # Sentinel

async def consumer(queue: Queue, sem: Semaphore, name: str):
    while True:
        item = await queue.get()
        if item is None:
            await queue.put(None)  # propagate sentinel
            break
        async with sem:  # rate limit
            await asyncio.sleep(0.2)
            print(f"[{name}] Consumed: {item}")
        queue.task_done()

async def main():
    queue = Queue(maxsize=5)
    sem = Semaphore(2)  # max 2 concurrent consumers
    producer_task = asyncio.create_task(producer(queue, 8))
    consumers = [
        asyncio.create_task(consumer(queue, sem, f"C{i}"))
        for i in range(3)
    ]
    await producer_task
    await asyncio.gather(*consumers)

asyncio.run(main())'''..language = 'python'..difficulty = 'very_hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_034'..topicId = 'python'..title = 'Descriptor-Based ORM'..description = 'Build a mini ORM using descriptors for field definitions with type validation and SQL generation.'..code = '''class Field:
    def __init__(self, field_type, primary_key=False):
        self.field_type = field_type
        self.primary_key = primary_key

    def __set_name__(self, owner, name):
        self.name = name
        self.private = f"_{name}"

    def __get__(self, obj, objtype=None):
        return getattr(obj, self.private, None) if obj else self

    def __set__(self, obj, value):
        if not isinstance(value, self.field_type):
            raise TypeError(f"{self.name} must be {self.field_type.__name__}")
        setattr(obj, self.private, value)

class ModelMeta(type):
    def __new__(mcs, name, bases, namespace):
        fields = {k: v for k, v in namespace.items() if isinstance(v, Field)}
        namespace['_fields'] = fields
        return super().__new__(mcs, name, bases, namespace)

class Model(metaclass=ModelMeta):
    def create_table_sql(self):
        cls_name = self.__class__.__name__.lower()
        cols = []
        for name, field in self._fields.items():
            sql_type = {int: "INTEGER", str: "TEXT", float: "REAL"}[field.field_type]
            pk = " PRIMARY KEY" if field.primary_key else ""
            cols.append(f"{name} {sql_type}{pk}")
        return f"CREATE TABLE {cls_name} ({', '.join(cols)})"

class User(Model):
    id = Field(int, primary_key=True)
    name = Field(str)
    age = Field(int)

u = User()
u.id = 1
u.name = "Alice"
u.age = 30
print(u.create_table_sql())'''..language = 'python'..difficulty = 'very_hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_035'..topicId = 'python'..title = 'Caching Strategies (LRU)'..description = 'Implement an LRU cache from scratch using OrderedDict for O(1) get and put operations.'..code = '''from collections import OrderedDict

class LRUCache:
    def __init__(self, capacity: int):
        self.capacity = capacity
        self.cache = OrderedDict()
        self.hits = 0
        self.misses = 0

    def get(self, key):
        if key in self.cache:
            self.cache.move_to_end(key)
            self.hits += 1
            return self.cache[key]
        self.misses += 1
        return -1

    def put(self, key, value):
        if key in self.cache:
            self.cache.move_to_end(key)
        self.cache[key] = value
        if len(self.cache) > self.capacity:
            evicted = self.cache.popitem(last=False)
            print(f"Evicted: {evicted}")

    @property
    def hit_rate(self):
        total = self.hits + self.misses
        return self.hits / total if total > 0 else 0

cache = LRUCache(3)
cache.put("a", 1)
cache.put("b", 2)
cache.put("c", 3)
print(cache.get("a"))  # 1 (hit)
cache.put("d", 4)      # Evicts "b"
print(cache.get("b"))  # -1 (miss)
print(f"Hit rate: {cache.hit_rate:.0%}")'''..language = 'python'..difficulty = 'very_hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_036'..topicId = 'python'..title = 'GIL and Multiprocessing'..description = 'Bypass the GIL using multiprocessing for true CPU parallelism with shared memory and process pools.'..code = '''import multiprocessing as mp
import time

def cpu_heavy(n):
    """CPU-bound work"""
    total = 0
    for i in range(n):
        total += i * i
    return total

def parallel_map(func, items, workers=4):
    with mp.Pool(workers) as pool:
        return pool.map(func, items)

if __name__ == "__main__":
    work = [10**7] * 8

    # Sequential
    start = time.perf_counter()
    results_seq = [cpu_heavy(n) for n in work]
    seq_time = time.perf_counter() - start

    # Parallel
    start = time.perf_counter()
    results_par = parallel_map(cpu_heavy, work)
    par_time = time.perf_counter() - start

    print(f"Sequential: {seq_time:.2f}s")
    print(f"Parallel:   {par_time:.2f}s")
    print(f"Speedup:    {seq_time/par_time:.1f}x")
    print(f"CPU cores:  {mp.cpu_count()}")'''..language = 'python'..difficulty = 'very_hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_037'..topicId = 'python'..title = 'Custom Class Decorator'..description = 'Class decorators modify or enhance class behavior at definition time, similar to metaclasses but simpler.'..code = '''import time
import functools

def add_timestamps(cls):
    original_init = cls.__init__
    @functools.wraps(original_init)
    def new_init(self, *args, **kwargs):
        original_init(self, *args, **kwargs)
        self.created_at = time.time()
        self._modified_at = time.time()
    cls.__init__ = new_init

    original_setattr = cls.__setattr__ if hasattr(cls, '__setattr__') else object.__setattr__
    def tracked_setattr(self, name, value):
        object.__setattr__(self, name, value)
        if not name.startswith('_') and name != 'created_at':
            object.__setattr__(self, '_modified_at', time.time())
    cls.__setattr__ = tracked_setattr

    cls.modified_at = property(lambda self: self._modified_at)
    return cls

@add_timestamps
class Document:
    def __init__(self, title, content):
        self.title = title
        self.content = content

doc = Document("Test", "Hello")
print(f"Created: {doc.created_at}")
time.sleep(0.01)
doc.title = "Updated"
print(f"Modified: {doc.modified_at}")'''..language = 'python'..difficulty = 'very_hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_038'..topicId = 'python'..title = 'Coroutine-based State Machine'..description = 'Use coroutines to implement a state machine where each state is a coroutine that yields the next state.'..code = '''from enum import Enum, auto

class State(Enum):
    IDLE = auto()
    CONNECTING = auto()
    CONNECTED = auto()
    ERROR = auto()

class Event(Enum):
    CONNECT = auto()
    CONNECTED = auto()
    DISCONNECT = auto()
    FAILURE = auto()
    RETRY = auto()

class StateMachine:
    def __init__(self):
        self.state = State.IDLE
        self.transitions = {
            (State.IDLE, Event.CONNECT): State.CONNECTING,
            (State.CONNECTING, Event.CONNECTED): State.CONNECTED,
            (State.CONNECTING, Event.FAILURE): State.ERROR,
            (State.CONNECTED, Event.DISCONNECT): State.IDLE,
            (State.ERROR, Event.RETRY): State.CONNECTING,
        }
        self.callbacks = {}

    def on(self, state, callback):
        self.callbacks[state] = callback

    def send(self, event):
        key = (self.state, event)
        if key not in self.transitions:
            raise ValueError(f"Invalid: {self.state} + {event}")
        old = self.state
        self.state = self.transitions[key]
        print(f"{old.name} --{event.name}--> {self.state.name}")
        if self.state in self.callbacks:
            self.callbacks[self.state]()

sm = StateMachine()
sm.on(State.CONNECTED, lambda: print("  >> Online!"))
sm.send(Event.CONNECT)
sm.send(Event.CONNECTED)
sm.send(Event.DISCONNECT)'''..language = 'python'..difficulty = 'very_hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_039'..topicId = 'python'..title = 'Abstract Syntax Tree Manipulation'..description = 'Use the ast module to parse, analyze, and transform Python source code programmatically.'..code = '''import ast

code = """
def calculate(x, y):
    result = x + y
    if result > 10:
        return result * 2
    return result

total = calculate(5, 8)
print(total)
"""

tree = ast.parse(code)

# Analyze: find all function definitions
for node in ast.walk(tree):
    if isinstance(node, ast.FunctionDef):
        args = [a.arg for a in node.args.args]
        print(f"Function: {node.name}({', '.join(args)})")
    elif isinstance(node, ast.Call):
        if isinstance(node.func, ast.Name):
            print(f"Call: {node.func.id}()")

# Transform: add print statements to all functions
class AddLogging(ast.NodeTransformer):
    def visit_FunctionDef(self, node):
        log_stmt = ast.parse(
            f'print("Entering {node.name}")'
        ).body[0]
        node.body.insert(0, log_stmt)
        return node

modified = AddLogging().visit(tree)
ast.fix_missing_locations(modified)
exec(compile(modified, "<ast>", "exec"))'''..language = 'python'..difficulty = 'very_hard'..isSaved = false..lastViewedAt = null,
    Snippet()..snippetId = 'python_040'..topicId = 'python'..title = 'Custom Memory Profiling'..description = 'Track memory allocation using tracemalloc and weakref for detecting memory leaks in Python applications.'..code = '''import tracemalloc
import weakref
import gc

class HeavyObject:
    def __init__(self, name, size=1000):
        self.name = name
        self.data = bytearray(size * 1024)  # size KB

    def __del__(self):
        print(f"Deleted: {self.name}")

# Start tracking
tracemalloc.start()

# Create objects
objects = [HeavyObject(f"obj-{i}", 100) for i in range(5)]
weak_refs = [weakref.ref(obj) for obj in objects]

snapshot1 = tracemalloc.take_snapshot()
stats = snapshot1.statistics('lineno')
print("Top memory consumers:")
for stat in stats[:3]:
    print(f"  {stat}")

# Remove strong references
del objects[2:]
gc.collect()

# Check which objects survived
alive = sum(1 for ref in weak_refs if ref() is not None)
print(f"\\nAlive: {alive}/5")

current, peak = tracemalloc.get_traced_memory()
print(f"Current: {current/1024:.1f}KB, Peak: {peak/1024:.1f}KB")
tracemalloc.stop()'''..language = 'python'..difficulty = 'very_hard'..isSaved = false..lastViewedAt = null,
  ];
}
