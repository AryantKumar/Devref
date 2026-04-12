import '../models/snippet.dart';

List<Snippet> getPythonSnippets() {
  return [

    // ═══════════════════════════════════════════════════════════
    // 1. BASICS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_001'
      ..topicId = 'python'
      ..title = 'Variables & Assignment'
      ..description = 'Python is dynamically typed — no type declarations needed. Variables are just names bound to objects.'
      ..code = '''# No type declaration needed — type is inferred
name = "Python"
version = 3.12
is_fun = True

# Multiple assignment
x = y = z = 0

# Tuple unpacking
a, b, c = 1, 2, 3
print(a, b, c)   # 1 2 3

# Swap without temp variable
a, b = b, a
print(a, b)   # 2 1

# Type hints (optional but recommended)
city: str = "Bangalore"
pin: int = 560001
price: float = 99.99

# Check type
print(type(name))      # <class 'str'>
print(isinstance(name, str))  # True

# Constants — by convention, ALL_CAPS
MAX_RETRIES = 3
BASE_URL = "https://api.example.com"'''
      ..language = 'python'
      ..difficulty = 'very_easy'
      ..section = 'Basics'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_002'
      ..topicId = 'python'
      ..title = 'Data Types'
      ..description = 'Python\'s built-in types: int, float, complex, bool, str, bytes, NoneType.'
      ..code = '''# Integer — unlimited precision
age = 22
big_num = 1_000_000   # underscores for readability
hex_val = 0xFF        # 255
bin_val = 0b1010      # 10

# Float
pi = 3.14159
gravity = 9.8
sci = 1.5e10          # scientific notation: 15000000000.0

# Complex
c = 3 + 4j
print(c.real, c.imag)  # 3.0  4.0

# Boolean (subclass of int)
is_valid = True
print(True + True)    # 2 (True is 1)
print(bool(0))        # False
print(bool(""))       # False
print(bool([]))       # False
print(bool("hi"))     # True

# None — the absence of a value
result = None
print(result is None)  # True  (use "is", not "==")

# String
s = "Hello"
b = b"bytes"          # bytes literal
raw = r"C:\\path"     # raw string — no escape processing

# Type conversion
print(int("42"))      # 42
print(float(7))       # 7.0
print(str(3.14))      # "3.14"
print(list("abc"))    # ['a', 'b', 'c']'''
      ..language = 'python'
      ..difficulty = 'very_easy'
      ..section = 'Basics'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_003'
      ..topicId = 'python'
      ..title = 'Strings & f-strings'
      ..description = 'Python strings are immutable. f-strings (3.6+) are the preferred way to format strings.'
      ..code = '''name = "Aryant"
age = 22

# f-string — embed expressions directly
print(f"Name: {name}")                 # Name: Aryant
print(f"In 5 years: {age + 5}")        # In 5 years: 27
print(f"Upper: {name.upper()}")        # Upper: ARYANT

# Format spec inside f-string
price = 1499.5
print(f"Price: {price:.2f}")           # Price: 1499.50
print(f"Padded: {name:>10}")           # Padded:     Aryant
print(f"Zeros: {42:05d}")              # Zeros: 00042

# Multiline string
bio = """
Name: {name}
Age:  {age}
""".format(name=name, age=age)

# String methods
s = "  hello, world!  "
print(s.strip())          # "hello, world!"
print(s.title())          # "  Hello, World!  "
print(s.replace("world", "Python"))
print("hello".startswith("he"))   # True
print("world".endswith("ld"))     # True
print(",".join(["a", "b", "c"]))  # "a,b,c"
print("a,b,c".split(","))         # ['a', 'b', 'c']

# Slicing
s = "Python"
print(s[0])      # P
print(s[-1])     # n
print(s[1:4])    # yth
print(s[::-1])   # nohtyP  (reversed)'''
      ..language = 'python'
      ..difficulty = 'very_easy'
      ..section = 'Basics'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_004'
      ..topicId = 'python'
      ..title = 'Unpacking & Destructuring'
      ..description = 'Unpack sequences into variables. The * operator captures the rest.'
      ..code = '''# Basic unpacking
x, y = (10, 20)
a, b, c = [1, 2, 3]
first, *rest = [1, 2, 3, 4, 5]
print(first)   # 1
print(rest)    # [2, 3, 4, 5]

*head, last = [1, 2, 3, 4, 5]
print(head)    # [1, 2, 3, 4]
print(last)    # 5

first, *middle, last = [1, 2, 3, 4, 5]
print(middle)  # [2, 3, 4]

# Swap
a, b = 1, 2
a, b = b, a
print(a, b)   # 2 1

# Nested unpacking
(x, y), z = (1, 2), 3
print(x, y, z)   # 1 2 3

# Skip values with _
_, important, _ = (10, 42, 99)
print(important)   # 42

# Unpacking in for loops
pairs = [(1, "one"), (2, "two"), (3, "three")]
for num, word in pairs:
    print(f"{num} = {word}")

# Dict unpacking
user = {"name": "Aryant", "age": 22}
name, age = user.values()   # order preserved in Python 3.7+'''
      ..language = 'python'
      ..difficulty = 'easy'
      ..section = 'Basics'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 2. CONTROL FLOW
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_005'
      ..topicId = 'python'
      ..title = 'If / Elif / Else'
      ..description = 'Python\'s conditional statements. No ternary operator — use inline if-else expressions instead.'
      ..code = '''temperature = 35

# Standard if-elif-else
if temperature > 30:
    print("Hot day!")
elif 20 <= temperature <= 30:   # chained comparison!
    print("Pleasant day")
else:
    print("Cold day")

# Inline conditional expression (ternary-style)
weather = "Hot" if temperature > 30 else "Cool"
print(f"Weather: {weather}")

# Truthiness — these are all False:
# False, None, 0, 0.0, "", [], {}, set()
name = ""
if not name:
    print("Name is empty")   # prints

# Walrus operator := (Python 3.8+) — assign and test in one
import re
text = "Hello 42 world"
if m := re.search(r"\\d+", text):
    print(f"Found number: {m.group()}")  # Found number: 42

# match statement (Python 3.10+) — like switch
status_code = 404
match status_code:
    case 200:
        print("OK")
    case 404:
        print("Not Found")
    case 500:
        print("Server Error")
    case _:
        print("Unknown")'''
      ..language = 'python'
      ..difficulty = 'very_easy'
      ..section = 'Control Flow'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_006'
      ..topicId = 'python'
      ..title = 'Loops'
      ..description = 'for loops iterate over any iterable. while loops run until a condition is False.'
      ..code = '''# for loop over a list
fruits = ["Apple", "Banana", "Cherry"]
for fruit in fruits:
    print(fruit)

# range() — generate numbers
for i in range(5):          print(i, end=" ")  # 0 1 2 3 4
for i in range(1, 6):       print(i, end=" ")  # 1 2 3 4 5
for i in range(0, 10, 2):   print(i, end=" ")  # 0 2 4 6 8
for i in range(5, 0, -1):   print(i, end=" ")  # 5 4 3 2 1

# enumerate() — get index AND value
for i, fruit in enumerate(fruits, start=1):
    print(f"{i}. {fruit}")
# 1. Apple
# 2. Banana

# zip() — iterate over two lists in parallel
names = ["Alice", "Bob", "Carol"]
scores = [95, 88, 91]
for name, score in zip(names, scores):
    print(f"{name}: {score}")

# while loop
count = 0
while count < 5:
    print(count, end=" ")
    count += 1   # 0 1 2 3 4

# break and continue
for n in range(1, 11):
    if n == 4:  continue   # skip 4
    if n == 7:  break      # stop at 7
    print(n, end=" ")      # 1 2 3 5 6

# for...else — else runs if loop completed without break
for n in range(2, 10):
    if 100 % n == 0:
        print(f"Factor: {n}")
        break
else:
    print("No factor found")'''
      ..language = 'python'
      ..difficulty = 'very_easy'
      ..section = 'Control Flow'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 3. FUNCTIONS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_007'
      ..topicId = 'python'
      ..title = 'Function Basics'
      ..description = 'Define functions with def. Support default args, *args, **kwargs, and type hints.'
      ..code = '''# Basic function with type hints
def greet(name: str) -> str:
    return f"Hello, {name}!"

print(greet("Aryant"))   # Hello, Aryant!

# Default arguments
def create_user(name: str, role: str = "user", active: bool = True) -> dict:
    return {"name": name, "role": role, "active": active}

print(create_user("Aryant"))
print(create_user("Admin", role="admin"))
print(create_user("Guest", active=False))

# *args — collect extra positional args as a tuple
def sum_all(*numbers: int) -> int:
    return sum(numbers)

print(sum_all(1, 2, 3))       # 6
print(sum_all(10, 20, 30, 40)) # 100

# **kwargs — collect extra keyword args as a dict
def log_event(event: str, **metadata) -> None:
    print(f"[{event}]", metadata)

log_event("login", user="Aryant", ip="192.168.1.1")
# [login] {'user': 'Aryant', 'ip': '192.168.1.1'}

# Combining all forms
def full_function(a, b=10, *args, **kwargs):
    print(f"a={a}, b={b}, args={args}, kwargs={kwargs}")

full_function(1, 2, 3, 4, x=5, y=6)
# a=1, b=2, args=(3, 4), kwargs={'x': 5, 'y': 6}

# Return multiple values (as a tuple)
def min_max(numbers: list) -> tuple[int, int]:
    return min(numbers), max(numbers)

lo, hi = min_max([3, 1, 4, 1, 5, 9])
print(f"Min: {lo}, Max: {hi}")  # Min: 1, Max: 9'''
      ..language = 'python'
      ..difficulty = 'very_easy'
      ..section = 'Functions'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_008'
      ..topicId = 'python'
      ..title = 'Lambda & Higher-Order Functions'
      ..description = 'Lambda creates anonymous functions. map, filter, sorted accept functions as arguments.'
      ..code = '''# Lambda — anonymous single-expression function
square = lambda x: x * x
add    = lambda a, b: a + b
print(square(5))    # 25
print(add(3, 4))    # 7

# Lambdas with map, filter
numbers = [1, 2, 3, 4, 5, 6]

doubled  = list(map(lambda x: x * 2, numbers))
evens    = list(filter(lambda x: x % 2 == 0, numbers))
print(doubled)   # [2, 4, 6, 8, 10, 12]
print(evens)     # [2, 4, 6]

# sorted with key function
users = [{"name": "Bob", "age": 30}, {"name": "Alice", "age": 25}]
by_age  = sorted(users, key=lambda u: u["age"])
by_name = sorted(users, key=lambda u: u["name"])

# Functions as arguments (higher-order functions)
def apply(func, value):
    return func(value)

print(apply(str.upper, "hello"))  # HELLO
print(apply(lambda x: x**2, 4))  # 16

# Functions returning functions (closures)
def multiplier(factor: int):
    return lambda x: x * factor

triple = multiplier(3)
times10 = multiplier(10)
print(triple(7))    # 21
print(times10(5))   # 50

# functools.reduce — fold a list into one value
from functools import reduce
product = reduce(lambda a, b: a * b, [1, 2, 3, 4, 5])
print(product)  # 120'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'Functions'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_009'
      ..topicId = 'python'
      ..title = 'Decorators'
      ..description = 'Decorators wrap a function to add behavior. Use functools.wraps to preserve metadata.'
      ..code = '''import functools
import time

# Simple decorator — adds timing
def timer(func):
    @functools.wraps(func)   # preserve function name & docstring
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        elapsed = time.time() - start
        print(f"{func.__name__} took {elapsed:.4f}s")
        return result
    return wrapper

@timer
def slow_function():
    time.sleep(0.1)
    return "done"

slow_function()  # slow_function took 0.1001s

# Decorator with arguments
def retry(times=3):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            for attempt in range(1, times + 1):
                try:
                    return func(*args, **kwargs)
                except Exception as e:
                    print(f"Attempt {attempt} failed: {e}")
            return None
        return wrapper
    return decorator

@retry(times=3)
def flaky_api_call():
    import random
    if random.random() < 0.7:
        raise ConnectionError("Timeout")
    return "Success!"

# Stacking decorators (applied bottom-up)
@timer
@retry(times=2)
def fetch_data(url: str):
    return f"data from {url}"

# Property decorator — turn method into attribute
class Circle:
    def __init__(self, radius: float):
        self._radius = radius

    @property
    def radius(self) -> float:
        return self._radius

    @radius.setter
    def radius(self, value: float):
        if value < 0:
            raise ValueError("Radius must be positive")
        self._radius = value

    @property
    def area(self) -> float:
        import math
        return math.pi * self._radius ** 2

c = Circle(5)
print(c.area)    # 78.53...
c.radius = 10    # uses setter'''
      ..language = 'python'
      ..difficulty = 'hard'
      ..section = 'Functions'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_010'
      ..topicId = 'python'
      ..title = 'Generators & yield'
      ..description = 'Generators produce values lazily one at a time — memory efficient for large sequences.'
      ..code = '''# Generator function — uses yield instead of return
def count_up(start: int, end: int):
    current = start
    while current <= end:
        yield current   # pause and return value
        current += 1

gen = count_up(1, 5)
print(next(gen))   # 1
print(next(gen))   # 2
for n in count_up(1, 3):
    print(n)       # 1, 2, 3

# Generator expression (like list comprehension but lazy)
squares_gen  = (x**2 for x in range(1_000_000))  # no memory used yet
squares_list = [x**2 for x in range(1_000_000)]  # all in memory

# Only compute what you need
print(next(squares_gen))   # 0 (computed on demand)

# Infinite generator
def fibonacci():
    a, b = 0, 1
    while True:
        yield a
        a, b = b, a + b

fib = fibonacci()
first_10 = [next(fib) for _ in range(10)]
print(first_10)  # [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

# itertools for generator utilities
import itertools

# islice — take first N from an infinite generator
fib = fibonacci()
print(list(itertools.islice(fib, 8)))  # [0, 1, 1, 2, 3, 5, 8, 13]

# chain — iterate multiple iterables as one
combined = itertools.chain([1, 2], [3, 4], [5, 6])
print(list(combined))  # [1, 2, 3, 4, 5, 6]

# yield from — delegate to a sub-generator
def flatten(nested):
    for item in nested:
        if isinstance(item, list):
            yield from flatten(item)
        else:
            yield item

print(list(flatten([1, [2, [3, 4]], 5])))  # [1, 2, 3, 4, 5]'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'Functions'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 4. COLLECTIONS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_011'
      ..topicId = 'python'
      ..title = 'Lists'
      ..description = 'Ordered, mutable sequences. The workhorse of Python data structures.'
      ..code = '''# Create
fruits = ["Apple", "Banana", "Cherry"]
mixed  = [1, "two", 3.0, True]
nested = [[1, 2], [3, 4], [5, 6]]

# Access
print(fruits[0])    # Apple
print(fruits[-1])   # Cherry (last)
print(fruits[1:3])  # ['Banana', 'Cherry']

# Modify
fruits.append("Mango")           # add to end
fruits.insert(1, "Avocado")      # insert at index
fruits.extend(["Grape", "Kiwi"]) # add multiple
fruits.remove("Banana")          # remove by value
popped = fruits.pop()            # remove and return last
popped = fruits.pop(0)           # remove at index
fruits.sort()                    # sort in-place
fruits.reverse()                 # reverse in-place
fruits.clear()                   # remove all

# Useful methods
nums = [3, 1, 4, 1, 5, 9, 2, 6]
print(len(nums))        # 8
print(sum(nums))        # 31
print(min(nums))        # 1
print(max(nums))        # 9
print(nums.count(1))    # 2
print(nums.index(4))    # 2 (first occurrence)
print(sorted(nums))     # new sorted list (original unchanged)

# List comprehension — Pythonic way to build lists
squares    = [x**2 for x in range(1, 6)]          # [1, 4, 9, 16, 25]
even_sq    = [x**2 for x in range(10) if x % 2 == 0]
flat       = [n for row in nested for n in row]   # flatten 2D

# Copy
copy1 = fruits.copy()   # shallow copy
copy2 = fruits[:]       # also shallow copy
import copy
deep  = copy.deepcopy(nested)  # deep copy (for nested structures)'''
      ..language = 'python'
      ..difficulty = 'very_easy'
      ..section = 'Collections'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_012'
      ..topicId = 'python'
      ..title = 'Dictionaries'
      ..description = 'Key-value store. Keys must be hashable. Ordered since Python 3.7.'
      ..code = '''# Create
user = {"name": "Aryant", "age": 22, "city": "Bangalore"}
empty = {}
from_pairs = dict([("a", 1), ("b", 2)])
from_keys  = dict.fromkeys(["x", "y", "z"], 0)  # {x:0, y:0, z:0}

# Access
print(user["name"])                  # Aryant
print(user.get("email"))             # None (no KeyError)
print(user.get("email", "N/A"))      # N/A (default)

# Modify
user["email"] = "a@dev.com"          # add/update
user.update({"age": 23, "role": "dev"})  # update multiple
del user["city"]                     # delete key
removed = user.pop("role", None)     # pop with default

# Iteration
for key in user:              print(key)
for value in user.values():   print(value)
for k, v in user.items():     print(f"{k}: {v}")

# Useful methods
print("name" in user)          # True
print(list(user.keys()))       # ['name', 'age', 'email']
print(list(user.values()))     # ['Aryant', 23, 'a@dev.com']

# Dict comprehension
scores = {"Alice": 85, "Bob": 92, "Carol": 78}
grades = {name: "Pass" if s >= 80 else "Fail"
          for name, s in scores.items()}

# Merge dicts (Python 3.9+)
defaults = {"theme": "light", "lang": "en"}
overrides = {"theme": "dark"}
merged = defaults | overrides   # {'theme': 'dark', 'lang': 'en'}

# setdefault — get or set a key
counts = {}
for word in "the quick brown fox the fox".split():
    counts[word] = counts.get(word, 0) + 1
print(counts)  # {'the': 2, 'quick': 1, 'brown': 1, 'fox': 2}

# defaultdict — auto-creates missing keys
from collections import defaultdict
groups = defaultdict(list)
for name, dept in [("Alice", "Eng"), ("Bob", "Eng"), ("Carol", "HR")]:
    groups[dept].append(name)
print(dict(groups))  # {'Eng': ['Alice', 'Bob'], 'HR': ['Carol']}'''
      ..language = 'python'
      ..difficulty = 'easy'
      ..section = 'Collections'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_013'
      ..topicId = 'python'
      ..title = 'Tuples & Sets'
      ..description = 'Tuple is immutable sequence. Set is an unordered collection of unique elements.'
      ..code = '''# TUPLES — immutable, ordered
point = (3, 4)
single = (42,)    # trailing comma required for single-element tuple
empty  = ()

x, y = point      # unpacking
print(point[0])   # 3

# Tuples are hashable — can be dict keys or set elements
locations = {(12.97, 77.59): "Bangalore", (28.61, 77.21): "Delhi"}

# Named tuples — like a lightweight struct
from collections import namedtuple
Point = namedtuple("Point", ["x", "y"])
p = Point(3, 4)
print(p.x, p.y)   # 3  4
print(p)           # Point(x=3, y=4)

# Better: dataclass or typing.NamedTuple
from typing import NamedTuple
class Color(NamedTuple):
    r: int
    g: int
    b: int
    alpha: float = 1.0

red = Color(255, 0, 0)
print(red)         # Color(r=255, g=0, b=0, alpha=1.0)

# SETS — unordered, unique elements
fruits = {"apple", "banana", "apple", "cherry"}
print(fruits)       # {'apple', 'banana', 'cherry'} (no duplicates)
print(len(fruits))  # 3

fruits.add("mango")
fruits.discard("banana")   # no error if missing
fruits.remove("apple")     # KeyError if missing

# Set operations
a = {1, 2, 3, 4}
b = {3, 4, 5, 6}

print(a | b)    # {1,2,3,4,5,6}   — union
print(a & b)    # {3,4}            — intersection
print(a - b)    # {1,2}            — difference
print(a ^ b)    # {1,2,5,6}        — symmetric difference

print(a.issubset({1,2,3,4,5}))    # True
print(a.isdisjoint({7, 8, 9}))    # True

# Set comprehension
even_set = {x for x in range(20) if x % 2 == 0}'''
      ..language = 'python'
      ..difficulty = 'easy'
      ..section = 'Collections'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 5. OOP
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_014'
      ..topicId = 'python'
      ..title = 'Classes & __init__'
      ..description = 'Define classes with __init__ for initialization. self refers to the instance.'
      ..code = '''class User:
    # Class variable — shared across all instances
    user_count = 0

    def __init__(self, name: str, email: str, age: int = 0):
        # Instance variables — unique to each object
        self.name  = name
        self.email = email
        self.age   = age
        User.user_count += 1

    # Instance method
    def greet(self) -> str:
        return f"Hi, I'm {self.name} ({self.email})"

    # Property — computed attribute
    @property
    def display_name(self) -> str:
        return self.name.title()

    # Class method — receives class, not instance
    @classmethod
    def from_dict(cls, data: dict) -> "User":
        return cls(data["name"], data["email"], data.get("age", 0))

    # Static method — no class or instance reference
    @staticmethod
    def is_valid_email(email: str) -> bool:
        return "@" in email and "." in email.split("@")[-1]

    # String representation
    def __repr__(self) -> str:
        return f"User(name={self.name!r}, email={self.email!r})"

    def __str__(self) -> str:
        return f"{self.name} <{self.email}>"

    def __len__(self) -> int:
        return len(self.name)

u1 = User("aryant", "a@dev.com", 22)
u2 = User.from_dict({"name": "Bob", "email": "bob@x.com"})

print(u1.display_name)          # Aryant
print(User.is_valid_email("bad")) # False
print(User.user_count)          # 2
print(repr(u1))  # User(name='aryant', email='a@dev.com')
print(len(u1))   # 6'''
      ..language = 'python'
      ..difficulty = 'easy'
      ..section = 'OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_015'
      ..topicId = 'python'
      ..title = 'Dataclasses'
      ..description = '@dataclass auto-generates __init__, __repr__, __eq__, and more. The modern way to define data objects.'
      ..code = '''from dataclasses import dataclass, field, asdict, astuple
from typing import ClassVar

@dataclass
class Product:
    id: int
    name: str
    price: float
    in_stock: bool = True
    tags: list[str] = field(default_factory=list)  # mutable default!

    # ClassVar — not included in __init__
    category: ClassVar[str] = "General"

    # Post-init — runs after __init__
    def __post_init__(self):
        if self.price < 0:
            raise ValueError("Price cannot be negative")
        self.name = self.name.strip()

    @property
    def discounted_price(self) -> float:
        return self.price * 0.9

p1 = Product(1, "Keyboard", 1499.0, tags=["electronics", "input"])
p2 = Product(1, "Keyboard", 1499.0)

print(p1)         # Product(id=1, name='Keyboard', price=1499.0, ...)
print(p1 == p2)   # True (compares by field values)

# Convert to dict / tuple
print(asdict(p1))   # {'id': 1, 'name': 'Keyboard', ...}
print(astuple(p1))  # (1, 'Keyboard', 1499.0, True, [])

# Frozen dataclass — immutable like a namedtuple
@dataclass(frozen=True)
class Point:
    x: float
    y: float

    def distance_to_origin(self) -> float:
        return (self.x**2 + self.y**2) ** 0.5

p = Point(3.0, 4.0)
print(p.distance_to_origin())  # 5.0
# p.x = 10  # raises FrozenInstanceError

# Ordered dataclass — enables comparison operators
@dataclass(order=True)
class Version:
    major: int
    minor: int
    patch: int = 0

v1 = Version(2, 1)
v2 = Version(1, 9, 5)
print(v1 > v2)   # True'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_016'
      ..topicId = 'python'
      ..title = 'Inheritance & Polymorphism'
      ..description = 'Python supports single and multiple inheritance. super() calls parent class methods.'
      ..code = '''from abc import ABC, abstractmethod

# Abstract base class
class Shape(ABC):
    def __init__(self, color: str = "black"):
        self.color = color

    @abstractmethod
    def area(self) -> float: ...

    @abstractmethod
    def perimeter(self) -> float: ...

    def describe(self) -> str:
        return (f"{self.color.title()} {self.__class__.__name__}: "
                f"area={self.area():.2f}, perimeter={self.perimeter():.2f}")

class Circle(Shape):
    def __init__(self, radius: float, color: str = "black"):
        super().__init__(color)
        self.radius = radius

    def area(self) -> float:
        import math
        return math.pi * self.radius ** 2

    def perimeter(self) -> float:
        import math
        return 2 * math.pi * self.radius

class Rectangle(Shape):
    def __init__(self, width: float, height: float, color: str = "black"):
        super().__init__(color)
        self.width = width
        self.height = height

    def area(self) -> float:
        return self.width * self.height

    def perimeter(self) -> float:
        return 2 * (self.width + self.height)

# Polymorphism
shapes: list[Shape] = [
    Circle(5, "red"),
    Rectangle(4, 6, "blue"),
    Circle(3),
]

for shape in shapes:
    print(shape.describe())

# Multiple inheritance
class Flyable:
    def fly(self): return f"{self.__class__.__name__} is flying"

class Swimmable:
    def swim(self): return f"{self.__class__.__name__} is swimming"

class Duck(Flyable, Swimmable):
    pass

duck = Duck()
print(duck.fly())   # Duck is flying
print(duck.swim())  # Duck is swimming
print(Duck.__mro__) # Method Resolution Order'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 6. COMPREHENSIONS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_017'
      ..topicId = 'python'
      ..title = 'Comprehensions'
      ..description = 'Concise syntax for building lists, dicts, sets, and generators. More Pythonic than loops.'
      ..code = '''# List comprehension
squares  = [x**2 for x in range(1, 6)]
evens    = [x for x in range(20) if x % 2 == 0]
words    = ["hello", "world", "python"]
upper    = [w.upper() for w in words if len(w) > 4]

# Nested list comprehension (matrix)
matrix  = [[1,2,3],[4,5,6],[7,8,9]]
flat    = [n for row in matrix for n in row]  # [1,2,3,4,5,6,7,8,9]
transposed = [[row[i] for row in matrix] for i in range(3)]

# Dict comprehension
scores = {"Alice": 85, "Bob": 92, "Carol": 78}
grades = {name: "A" if s >= 90 else "B" if s >= 80 else "C"
          for name, s in scores.items()}
inverted = {v: k for k, v in {"a": 1, "b": 2}.items()}  # {1:'a', 2:'b'}

# Set comprehension
unique_lengths = {len(w) for w in words}   # {5, 4, 6}

# Generator expression — lazy, memory efficient
total = sum(x**2 for x in range(1_000_000))  # no list created

# Conditional expression inside comprehension
labels = ["even" if x % 2 == 0 else "odd" for x in range(6)]
# ['even', 'odd', 'even', 'odd', 'even', 'odd']

# Real-world example
users = [
    {"name": "Alice", "age": 30, "active": True},
    {"name": "Bob",   "age": 17, "active": True},
    {"name": "Carol", "age": 25, "active": False},
]

active_adults = [
    u["name"].upper()
    for u in users
    if u["active"] and u["age"] >= 18
]
print(active_adults)  # ['ALICE']

# Walrus operator in comprehension (Python 3.8+)
results = [y for x in range(10) if (y := x**2) > 10]
print(results)  # [16, 25, 36, 49, 64, 81]'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'Comprehensions'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 7. ERROR HANDLING
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_018'
      ..topicId = 'python'
      ..title = 'Exceptions & Custom Errors'
      ..description = 'Handle errors with try/except/else/finally. Define custom exceptions for domain errors.'
      ..code = '''# Basic try/except
try:
    result = 10 / 0
except ZeroDivisionError as e:
    print(f"Error: {e}")   # Error: division by zero

# Multiple exception types
def parse_int(s: str) -> int:
    try:
        return int(s)
    except (ValueError, TypeError) as e:
        print(f"Cannot parse: {e}")
        return 0

# else — runs only if NO exception was raised
# finally — ALWAYS runs (cleanup)
def read_file(path: str) -> str:
    f = None
    try:
        f = open(path)
        content = f.read()
    except FileNotFoundError:
        print(f"File not found: {path}")
        return ""
    except PermissionError:
        print("No permission to read file")
        return ""
    else:
        print("File read successfully")
        return content
    finally:
        if f:
            f.close()   # always runs — even if exception occurred

# Custom exception hierarchy
class AppError(Exception):
    """Base exception for all app errors."""
    pass

class ValidationError(AppError):
    def __init__(self, field: str, message: str):
        self.field = field
        self.message = message
        super().__init__(f"{field}: {message}")

class NetworkError(AppError):
    def __init__(self, status_code: int = None):
        self.status_code = status_code
        msg = f"Network error (status: {status_code})" if status_code else "Network error"
        super().__init__(msg)

class NotFoundError(AppError):
    def __init__(self, resource: str, id):
        super().__init__(f"{resource} with id={id} not found")

# Raise and catch custom errors
def get_user(user_id: int) -> dict:
    if user_id <= 0:
        raise ValidationError("user_id", "must be positive")
    users = {1: {"name": "Aryant"}}
    if user_id not in users:
        raise NotFoundError("User", user_id)
    return users[user_id]

try:
    user = get_user(99)
except ValidationError as e:
    print(f"Validation failed: {e.field} — {e.message}")
except NotFoundError as e:
    print(f"Not found: {e}")
except AppError as e:
    print(f"App error: {e}")'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'Error Handling'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_019'
      ..topicId = 'python'
      ..title = 'Context Managers'
      ..description = 'with statement ensures resources are properly cleaned up. Use contextlib for custom managers.'
      ..code = '''# Built-in context managers
# File — auto-closes even if exception occurs
with open("data.txt", "w") as f:
    f.write("Hello, World!")
# f is automatically closed here

# Multiple context managers
with open("src.txt") as src, open("dst.txt", "w") as dst:
    dst.write(src.read())

# Custom context manager — class-based
class Timer:
    def __init__(self, label: str = ""):
        self.label = label

    def __enter__(self):
        import time
        self.start = time.time()
        return self          # value assigned to "as" variable

    def __exit__(self, exc_type, exc_val, exc_tb):
        import time
        elapsed = time.time() - self.start
        print(f"{self.label}: {elapsed:.4f}s")
        return False         # don't suppress exceptions

with Timer("Data processing") as t:
    result = [x**2 for x in range(100_000)]
# Data processing: 0.0123s

# Custom context manager — function-based (simpler)
from contextlib import contextmanager

@contextmanager
def managed_db_connection(url: str):
    conn = connect(url)       # setup
    try:
        yield conn            # provide resource to body
    except Exception as e:
        conn.rollback()
        raise
    finally:
        conn.close()          # always cleanup

with managed_db_connection("sqlite:///app.db") as db:
    db.execute("INSERT INTO users ...")
    db.commit()

# suppress — silently ignore specific exceptions
from contextlib import suppress

with suppress(FileNotFoundError):
    import os
    os.remove("maybe_missing.txt")  # no crash if file doesn't exist'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'Error Handling'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 8. TYPE HINTS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_020'
      ..topicId = 'python'
      ..title = 'Type Hints'
      ..description = 'Python 3.10+ type annotations for safer, self-documenting code. Checked by mypy/pyright.'
      ..code = '''from typing import Optional, Union, Any, TypeVar, Generic
from collections.abc import Callable, Sequence, Iterator

# Basic annotations
name: str = "Aryant"
age: int = 22
scores: list[int] = [90, 85, 92]
user: dict[str, Any] = {"name": "Alice", "age": 30}

# Optional — value or None
def find_user(user_id: int) -> Optional[dict]:   # same as dict | None
    return None

# Union — one of several types (3.10+: use X | Y)
def process(value: int | str | None) -> str:
    return str(value)

# Callable — function type
def apply(func: Callable[[int, int], int], a: int, b: int) -> int:
    return func(a, b)

# TypeVar — generic placeholder
T = TypeVar("T")

def first(items: list[T]) -> T | None:
    return items[0] if items else None

# Generic class
class Stack(Generic[T]):
    def __init__(self) -> None:
        self._items: list[T] = []

    def push(self, item: T) -> None:
        self._items.append(item)

    def pop(self) -> T:
        return self._items.pop()

s: Stack[int] = Stack()
s.push(1)

# TypedDict — typed dict structure
from typing import TypedDict

class UserDict(TypedDict):
    name: str
    age: int
    email: str

def greet_user(user: UserDict) -> str:
    return f"Hello, {user['name']}!"

# Literal — restrict to specific values
from typing import Literal

def set_theme(mode: Literal["light", "dark", "auto"]) -> None:
    print(f"Theme: {mode}")

# Protocol — structural typing (duck typing with type safety)
from typing import Protocol

class Drawable(Protocol):
    def draw(self) -> str: ...

class Circle:
    def draw(self) -> str: return "○"

def render(shape: Drawable) -> None:
    print(shape.draw())

render(Circle())  # works — Circle implements Drawable'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'Type Hints'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 9. ASYNC / AWAIT
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_021'
      ..topicId = 'python'
      ..title = 'async / await basics'
      ..description = 'asyncio enables concurrent I/O without threads. async def defines a coroutine.'
      ..code = '''import asyncio

# async def creates a coroutine function
async def fetch_user(user_id: int) -> dict:
    await asyncio.sleep(1)   # non-blocking pause (simulates network)
    return {"id": user_id, "name": f"User_{user_id}"}

# Run a single coroutine
async def main():
    user = await fetch_user(1)   # wait for result
    print(user)

asyncio.run(main())

# Run coroutines concurrently with gather
async def load_dashboard():
    # All three start at the same time!
    user, posts, notifications = await asyncio.gather(
        fetch_user(1),
        fetch_posts(1),
        fetch_notifications(1)
    )
    print(f"Loaded for {user['name']}: {len(posts)} posts")

# TaskGroup (Python 3.11+) — better error handling
async def load_data():
    async with asyncio.TaskGroup() as tg:
        user_task = tg.create_task(fetch_user(1))
        posts_task = tg.create_task(fetch_posts(1))
    # All tasks done here
    return user_task.result(), posts_task.result()

# Async context manager
async def fetch_with_session(url: str) -> str:
    async with aiohttp.ClientSession() as session:   # __aenter__/__aexit__
        async with session.get(url) as response:
            return await response.text()

# Async generator
async def paginated_users(page_size: int = 10):
    page = 0
    while True:
        users = await fetch_users_page(page, page_size)
        if not users:
            break
        for user in users:
            yield user
        page += 1

# Consume async generator
async def process_all():
    async for user in paginated_users():
        process(user)'''
      ..language = 'python'
      ..difficulty = 'hard'
      ..section = 'Async / Await'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_022'
      ..topicId = 'python'
      ..title = 'asyncio Patterns'
      ..description = 'Timeouts, cancellation, semaphores, and queues for production async code.'
      ..code = '''import asyncio

# Timeout — cancel if too slow
async def fetch_with_timeout(url: str, timeout: float = 5.0) -> str:
    try:
        async with asyncio.timeout(timeout):   # Python 3.11+
            return await fetch(url)
    except TimeoutError:
        print(f"Timeout fetching {url}")
        return ""

# Semaphore — limit concurrent operations
async def fetch_all_limited(urls: list[str]) -> list[str]:
    sem = asyncio.Semaphore(10)   # max 10 concurrent requests

    async def fetch_one(url: str) -> str:
        async with sem:
            return await fetch(url)

    return await asyncio.gather(*[fetch_one(url) for url in urls])

# Queue — producer / consumer pattern
async def producer(queue: asyncio.Queue):
    for i in range(10):
        await queue.put(i)
        await asyncio.sleep(0.1)
    await queue.put(None)   # sentinel to signal done

async def consumer(queue: asyncio.Queue, name: str):
    while True:
        item = await queue.get()
        if item is None:
            break
        print(f"{name} processed: {item}")
        queue.task_done()

async def main():
    queue = asyncio.Queue(maxsize=5)
    await asyncio.gather(
        producer(queue),
        consumer(queue, "Worker-1"),
        consumer(queue, "Worker-2"),
    )

# Run blocking code in executor (don't block the event loop)
async def read_large_file(path: str) -> str:
    loop = asyncio.get_running_loop()
    # run_in_executor uses a thread pool for blocking I/O
    return await loop.run_in_executor(None, Path(path).read_text)

asyncio.run(main())'''
      ..language = 'python'
      ..difficulty = 'very_hard'
      ..section = 'Async / Await'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 10. FILE I/O
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_023'
      ..topicId = 'python'
      ..title = 'File I/O & Pathlib'
      ..description = 'Read and write files using pathlib (modern) and built-in open().'
      ..code = '''from pathlib import Path

# pathlib — modern, OOP file paths
p = Path("data/users.csv")
print(p.name)         # users.csv
print(p.stem)         # users
print(p.suffix)       # .csv
print(p.parent)       # data

# Create directories
Path("output/logs").mkdir(parents=True, exist_ok=True)

# Write text
Path("hello.txt").write_text("Hello, World!", encoding="utf-8")

# Read text — all at once
content = Path("hello.txt").read_text(encoding="utf-8")

# Read lines — memory efficient
with open("data.txt", encoding="utf-8") as f:
    for line in f:           # iterates line by line
        print(line.strip())

# Write multiple lines
lines = ["line 1\\n", "line 2\\n", "line 3\\n"]
with open("output.txt", "w") as f:
    f.writelines(lines)

# Append to existing file
with open("log.txt", "a") as f:
    f.write("New log entry\\n")

# Binary files
with open("image.png", "rb") as f:
    data = f.read()

# JSON
import json

user = {"name": "Aryant", "age": 22, "skills": ["Python", "Kotlin"]}
Path("user.json").write_text(json.dumps(user, indent=2))
loaded = json.loads(Path("user.json").read_text())

# CSV
import csv

with open("users.csv", "w", newline="") as f:
    writer = csv.DictWriter(f, fieldnames=["name", "age"])
    writer.writeheader()
    writer.writerows([{"name": "Alice", "age": 30}, {"name": "Bob", "age": 25}])

with open("users.csv") as f:
    reader = csv.DictReader(f)
    for row in reader:
        print(row)  # {'name': 'Alice', 'age': '30'}

# Glob — find files by pattern
py_files = list(Path(".").glob("**/*.py"))
csv_files = list(Path("data").glob("*.csv"))'''
      ..language = 'python'
      ..difficulty = 'easy'
      ..section = 'File I/O'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 11. MODULES & PACKAGES
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_024'
      ..topicId = 'python'
      ..title = 'Modules & Imports'
      ..description = 'Import standard library, third-party, and your own modules. Use __all__ to control exports.'
      ..code = '''# Standard imports
import os
import sys
import json
import math
from pathlib import Path
from datetime import datetime, timedelta
from collections import defaultdict, Counter, deque
from typing import Optional

# Specific imports
from math import pi, sqrt, ceil, floor
print(sqrt(16))   # 4.0

# Alias
import numpy as np
import pandas as pd
from datetime import datetime as dt

# Relative import (inside a package)
# from .utils import helper_function
# from ..models import User

# __all__ — control what "from module import *" exports
# In your_module.py:
__all__ = ["PublicClass", "public_function"]

# Conditional import
try:
    import ujson as json        # fast JSON if available
except ImportError:
    import json                 # fall back to stdlib

# importlib — dynamic imports
import importlib
module = importlib.import_module("json")
json_module = importlib.import_module("collections")

# Useful stdlib modules
from functools import lru_cache, partial, reduce
from itertools import chain, product, combinations, permutations
from contextlib import contextmanager, suppress
from dataclasses import dataclass, field
from enum import Enum, auto
from abc import ABC, abstractmethod
import re
import hashlib
import uuid
import logging
import threading
import subprocess

# __name__ guard — only run if this is the main script
if __name__ == "__main__":
    print("Running as main script")'''
      ..language = 'python'
      ..difficulty = 'easy'
      ..section = 'Modules & Packages'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 12. STANDARD LIBRARY ESSENTIALS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_025'
      ..topicId = 'python'
      ..title = 'collections & itertools'
      ..description = 'Power tools from the standard library: Counter, defaultdict, deque, chain, and more.'
      ..code = '''from collections import Counter, defaultdict, deque, OrderedDict, namedtuple
from itertools import chain, combinations, permutations, product, groupby, islice

# Counter — count occurrences
words = "the quick brown fox jumps over the lazy fox".split()
freq = Counter(words)
print(freq.most_common(3))   # [('fox', 2), ('the', 2), ('quick', 1)]
print(freq["the"])            # 2
freq.update(["the", "dog"])  # add more counts

# defaultdict — auto-creates missing keys
graph = defaultdict(list)
graph["A"].append("B")   # no KeyError even if "A" wasn't there
graph["A"].append("C")

word_lengths = defaultdict(set)
for word in words:
    word_lengths[len(word)].add(word)

# deque — efficient append/pop from both ends
q = deque(maxlen=3)   # circular buffer of size 3
for i in range(5):
    q.append(i)
print(q)   # deque([2, 3, 4], maxlen=3)

q.appendleft(0)   # add to front O(1)
q.popleft()       # remove from front O(1)

# ────── itertools ──────

# chain — flatten one level
all_items = list(chain([1, 2], [3, 4], [5, 6]))  # [1,2,3,4,5,6]

# islice — slice a generator/iterator
first_five = list(islice(range(100), 5))   # [0, 1, 2, 3, 4]

# combinations and permutations
print(list(combinations("ABC", 2)))
# [('A','B'), ('A','C'), ('B','C')]

print(list(permutations([1, 2, 3], 2)))
# [(1,2),(1,3),(2,1),(2,3),(3,1),(3,2)]

# product — cartesian product
sizes   = ["S", "M", "L"]
colors  = ["Red", "Blue"]
variants = list(product(sizes, colors))
# [('S','Red'),('S','Blue'),('M','Red'), ...]

# groupby — group consecutive items by key (sort first!)
data = sorted([("fruit", "apple"), ("veg", "carrot"), ("fruit", "banana")],
              key=lambda x: x[0])
for category, items in groupby(data, key=lambda x: x[0]):
    print(category, list(items))'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'Standard Library'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_026'
      ..topicId = 'python'
      ..title = 'Enums & Dataclasses Advanced'
      ..description = 'Enum for named constants. Combine with dataclasses for expressive domain models.'
      ..code = '''from enum import Enum, auto, Flag
from dataclasses import dataclass, field
from datetime import datetime

# Basic Enum
class Color(Enum):
    RED   = "red"
    GREEN = "green"
    BLUE  = "blue"

c = Color.RED
print(c)         # Color.RED
print(c.value)   # red
print(c.name)    # RED

# auto() — auto-assign values
class Direction(Enum):
    NORTH = auto()   # 1
    SOUTH = auto()   # 2
    EAST  = auto()   # 3
    WEST  = auto()   # 4

# Enum with methods
class Status(Enum):
    PENDING  = "pending"
    ACTIVE   = "active"
    INACTIVE = "inactive"
    BANNED   = "banned"

    @property
    def is_usable(self) -> bool:
        return self in (Status.PENDING, Status.ACTIVE)

    def transition_to(self, new_status: "Status") -> bool:
        valid = {
            Status.PENDING:  {Status.ACTIVE, Status.BANNED},
            Status.ACTIVE:   {Status.INACTIVE, Status.BANNED},
            Status.INACTIVE: {Status.ACTIVE},
        }
        return new_status in valid.get(self, set())

print(Status.ACTIVE.is_usable)                       # True
print(Status.ACTIVE.transition_to(Status.INACTIVE))  # True

# Flag — bitwise combinations
class Permission(Flag):
    READ    = auto()
    WRITE   = auto()
    EXECUTE = auto()
    ALL = READ | WRITE | EXECUTE

user_perms = Permission.READ | Permission.WRITE
print(Permission.READ in user_perms)  # True
print(user_perms)  # Permission.READ|WRITE

# Combining Enum with dataclass
@dataclass
class User:
    id: int
    name: str
    status: Status = Status.PENDING
    permissions: Permission = Permission.READ
    created_at: datetime = field(default_factory=datetime.now)'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'Standard Library'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 13. FUNCTIONAL PROGRAMMING
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_027'
      ..topicId = 'python'
      ..title = 'functools & Caching'
      ..description = 'functools provides tools for higher-order functions, caching, and partial application.'
      ..code = '''from functools import lru_cache, cache, partial, reduce, wraps

# lru_cache — memoize function results (Least Recently Used)
@lru_cache(maxsize=128)
def fibonacci(n: int) -> int:
    if n < 2:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)

print(fibonacci(50))    # fast — computed once, cached
print(fibonacci.cache_info())  # CacheInfo(hits=48, misses=51, ...)

# @cache (Python 3.9+) — unbounded cache, simpler
@cache
def factorial(n: int) -> int:
    return 1 if n <= 1 else n * factorial(n - 1)

# partial — fix some arguments of a function
def power(base: int, exp: int) -> int:
    return base ** exp

square = partial(power, exp=2)
cube   = partial(power, exp=3)
print(square(5))   # 25
print(cube(3))     # 27

# partial with class methods
from functools import partial
import os

# pre-fill prefix argument
join_base = partial(os.path.join, "/usr/local")
print(join_base("bin", "python"))  # /usr/local/bin/python

# reduce — fold sequence into one value
from functools import reduce
product = reduce(lambda a, b: a * b, [1, 2, 3, 4, 5])  # 120
max_val = reduce(lambda a, b: a if a > b else b, [3, 1, 4, 1, 5])  # 5

# total_ordering — define __lt__, get all comparisons free
from functools import total_ordering

@total_ordering
class Student:
    def __init__(self, gpa: float):
        self.gpa = gpa

    def __eq__(self, other): return self.gpa == other.gpa
    def __lt__(self, other): return self.gpa < other.gpa
    # __le__, __gt__, __ge__ auto-generated!

s1, s2 = Student(3.5), Student(3.8)
print(s1 < s2)   # True
print(s1 >= s2)  # False'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'Functional Programming'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 14. NETWORKING (HTTPX / REQUESTS)
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_028'
      ..topicId = 'python'
      ..title = 'HTTP Requests with httpx'
      ..description = 'httpx supports both sync and async HTTP. Preferred over requests for modern Python.'
      ..code = '''import httpx
from typing import Any

BASE_URL = "https://api.github.com"

# Synchronous requests
def get_user(username: str) -> dict:
    with httpx.Client(
        base_url=BASE_URL,
        headers={"Accept": "application/vnd.github+json"},
        timeout=30.0
    ) as client:
        response = client.get(f"/users/{username}")
        response.raise_for_status()   # raise on 4xx/5xx
        return response.json()

# Async requests (preferred for async apps)
async def get_repos(username: str) -> list[dict]:
    async with httpx.AsyncClient(base_url=BASE_URL, timeout=30.0) as client:
        response = await client.get(f"/users/{username}/repos")
        response.raise_for_status()
        return response.json()

# Error handling
async def safe_fetch(url: str) -> dict | None:
    async with httpx.AsyncClient() as client:
        try:
            r = await client.get(url, timeout=10.0)
            r.raise_for_status()
            return r.json()
        except httpx.TimeoutException:
            print("Request timed out")
        except httpx.HTTPStatusError as e:
            print(f"HTTP {e.response.status_code}: {e.request.url}")
        except httpx.RequestError as e:
            print(f"Network error: {e}")
    return None

# POST with JSON body
async def create_issue(token: str, repo: str, title: str, body: str) -> dict:
    async with httpx.AsyncClient(
        base_url=BASE_URL,
        headers={"Authorization": f"Bearer {token}"}
    ) as client:
        r = await client.post(
            f"/repos/{repo}/issues",
            json={"title": title, "body": body}
        )
        r.raise_for_status()
        return r.json()

# Parallel requests
import asyncio

async def fetch_many(urls: list[str]) -> list[dict]:
    async with httpx.AsyncClient() as client:
        tasks = [client.get(url) for url in urls]
        responses = await asyncio.gather(*tasks, return_exceptions=True)
        return [r.json() for r in responses if isinstance(r, httpx.Response)]'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'Networking'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 15. PYDANTIC & VALIDATION
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_029'
      ..topicId = 'python'
      ..title = 'Pydantic Models'
      ..description = 'Pydantic validates data and serializes/deserializes JSON automatically using type hints.'
      ..code = '''from pydantic import BaseModel, Field, EmailStr, field_validator, model_validator
from typing import Optional
from datetime import datetime
from enum import Enum

class Role(str, Enum):
    ADMIN  = "admin"
    USER   = "user"
    VIEWER = "viewer"

class UserCreate(BaseModel):
    name:     str = Field(..., min_length=1, max_length=100)
    email:    EmailStr
    age:      int = Field(..., ge=0, le=150)
    role:     Role = Role.USER
    bio:      Optional[str] = None

    # Field-level validator
    @field_validator("name")
    @classmethod
    def name_must_not_be_whitespace(cls, v: str) -> str:
        if v.strip() != v:
            raise ValueError("Name cannot have leading/trailing whitespace")
        return v.title()   # normalize to title case

    # Model-level validator (cross-field)
    @model_validator(mode="after")
    def admin_requires_bio(self) -> "UserCreate":
        if self.role == Role.ADMIN and not self.bio:
            raise ValueError("Admin users must have a bio")
        return self

class UserResponse(BaseModel):
    id:         int
    name:       str
    email:       str
    created_at: datetime

    model_config = {"from_attributes": True}   # allow ORM objects

# Parse from dict / JSON
user = UserCreate(name="aryant", email="a@dev.com", age=22)
print(user.name)   # Aryant (normalized)
print(user.role)   # Role.USER

# Parse from JSON string
user2 = UserCreate.model_validate_json(
    \'{"name": "Bob", "email": "bob@x.com", "age": 25}\'
)

# Serialize to dict / JSON
print(user.model_dump())
print(user.model_dump_json(indent=2))

# Validation errors
try:
    bad = UserCreate(name="", email="not-an-email", age=-1)
except Exception as e:
    print(e)   # ValidationError with field-level details'''
      ..language = 'python'
      ..difficulty = 'hard'
      ..section = 'Pydantic & Validation'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 16. TESTING
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_031'
      ..topicId = 'python'
      ..title = 'Regular Expressions'
      ..description = 'The re module provides full regex support. Compile patterns for reuse. Use raw strings r"..." to avoid escape issues.'
      ..code = '''import re

text = "Contact us at support@example.com or sales@company.org"

# Search — find first match
match = re.search(r"[\\w.+-]+@[\\w-]+\\.[\\w.]+", text)
if match:
    print(match.group())   # support@example.com
    print(match.start())   # 14 (position)

# Findall — return all matches as list
emails = re.findall(r"[\\w.+-]+@[\\w-]+\\.[\\w.]+", text)
print(emails)  # ['support@example.com', 'sales@company.org']

# Finditer — return match objects (lazy)
for m in re.finditer(r"[\\w.+-]+@[\\w-]+\\.[\\w.]+", text):
    print(f"{m.group()} at position {m.start()}")

# Groups — capture parts of the match
pattern = r"(\\w+)@([\\w-]+)\\.(\\w+)"
m = re.search(pattern, text)
if m:
    print(m.group(0))   # full match
    print(m.group(1))   # local part
    print(m.group(2))   # domain
    print(m.groups())   # ('support', 'example', 'com')

# Named groups
pattern = r"(?P<user>[\\w.+-]+)@(?P<domain>[\\w-]+\\.\\w+)"
m = re.search(pattern, text)
if m:
    print(m.group("user"))    # support
    print(m.group("domain"))  # example.com
    print(m.groupdict())

# Sub — replace matches
cleaned = re.sub(r"[\\w.+-]+@[\\w-]+\\.[\\w.]+", "[REDACTED]", text)
print(cleaned)  # Contact us at [REDACTED] or [REDACTED]

# Sub with function
def mask_email(m: re.Match) -> str:
    user, domain = m.group().split("@")
    return f"{user[0]}***@{domain}"

masked = re.sub(r"[\\w.+-]+@[\\w-]+\\.[\\w.]+", mask_email, text)
print(masked)  # s***@example.com or s***@company.org

# Compile — reuse pattern for performance
email_re = re.compile(r"[\\w.+-]+@[\\w-]+\\.[\\w.]+", re.IGNORECASE)
valid = bool(email_re.fullmatch("user@example.com"))

# Split on pattern
parts = re.split(r"[,;\\s]+", "one, two;  three four")
print(parts)   # ['one', 'two', 'three', 'four']

# Common patterns
PHONE    = r"(\\+?\\d[\\d\\s\\-().]{7,}\\d)"
URL      = r"https?://[^\\s]+"
DATE_ISO = r"\\d{4}-\\d{2}-\\d{2}"
IPV4     = r"\\b(?:\\d{1,3}\\.){3}\\d{1,3}\\b"'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'Advanced Strings'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_032'
      ..topicId = 'python'
      ..title = 'String Formatting Deep Dive'
      ..description = 'All Python formatting techniques: f-strings, format(), Template, and format spec mini-language.'
      ..code = '''# Format spec mini-language inside f-strings
# {value:[[fill]align][sign][#][0][width][grouping][.precision][type]}

value = 3.14159265
print(f"{value:.2f}")         # 3.14   — 2 decimal places
print(f"{value:10.3f}")       # "     3.142" — width 10, right-aligned
print(f"{value:<10.3f}")      # "3.142     " — left-aligned
print(f"{value:^10.3f}")      # "  3.142   " — center-aligned
print(f"{value:+.2f}")        # +3.14  — always show sign

n = 1_234_567
print(f"{n:,}")               # 1,234,567 — thousand separator
print(f"{n:_}")               # 1_234_567 — underscore separator
print(f"{n:e}")               # 1.234567e+06 — scientific notation
print(f"{n:010d}")            # 0001234567 — zero-padded

# Integer bases
byte = 255
print(f"{byte:b}")    # 11111111 — binary
print(f"{byte:#b}")   # 0b11111111
print(f"{byte:o}")    # 377 — octal
print(f"{byte:x}")    # ff — hex lowercase
print(f"{byte:X}")    # FF — hex uppercase
print(f"{byte:#x}")   # 0xff

# Percentage
ratio = 0.7654
print(f"{ratio:.1%}")   # 76.5%

# Dynamic width and precision
width, prec = 12, 4
print(f"{3.14159:{width}.{prec}f}")   # "      3.1416"

# str.format() — older style, still useful for templates
template = "Dear {name},\\nYour order #{order_id} is {status}."
msg = template.format(name="Alice", order_id=42, status="shipped")

# Positional
print("{0} + {1} = {2}".format(1, 2, 3))

# String Template — safe for user-controlled input
from string import Template
t = Template("Hello, \$name! You have \$count messages.")
print(t.substitute(name="Bob", count=5))
# safe_substitute won't raise on missing keys
print(t.safe_substitute(name="Carol"))  # Hello, Carol! You have \$count messages.

# textwrap — wrap long strings
import textwrap
long = "This is a very long sentence that needs to be wrapped at a certain column width for readability."
print(textwrap.fill(long, width=40))
print(textwrap.indent("line1\\nline2\\nline3", "    "))  # indent 4 spaces
print(textwrap.dedent("""
    hello
    world
"""))   # removes common leading whitespace'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'Advanced Strings'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 2. ADVANCED COLLECTIONS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_033'
      ..topicId = 'python'
      ..title = 'heapq & Priority Queues'
      ..description = 'heapq implements a min-heap. Use it for priority queues, top-N problems, and scheduling.'
      ..code = '''import heapq

# heapq — min-heap (smallest item always at index 0)
nums = [3, 1, 4, 1, 5, 9, 2, 6]
heapq.heapify(nums)           # convert list to heap in-place O(n)
print(nums[0])                # 1 — smallest

heapq.heappush(nums, 0)       # push new item
smallest = heapq.heappop(nums) # pop and return smallest (0)

# peek without popping
print(nums[0])                # smallest item

# nlargest / nsmallest — O(n log k)
data = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3]
print(heapq.nlargest(3, data))   # [9, 6, 5]
print(heapq.nsmallest(3, data))  # [1, 1, 2]

# Max-heap — negate values
nums = [3, 1, 4, 1, 5, 9]
max_heap = [-x for x in nums]
heapq.heapify(max_heap)
largest = -heapq.heappop(max_heap)  # 9

# Priority queue with tuples (priority, item)
tasks = []
heapq.heappush(tasks, (3, "low priority task"))
heapq.heappush(tasks, (1, "urgent task"))
heapq.heappush(tasks, (2, "normal task"))

while tasks:
    priority, task = heapq.heappop(tasks)
    print(f"[{priority}] {task}")
# [1] urgent task
# [2] normal task
# [3] low priority task

# With objects — add tie-breaker counter
from dataclasses import dataclass, field
from typing import Any
import itertools

counter = itertools.count()

@dataclass(order=True)
class PrioritizedItem:
    priority: int
    count: int = field(default_factory=lambda: next(counter))
    item: Any = field(compare=False, default=None)

pq = []
heapq.heappush(pq, PrioritizedItem(2, item="task A"))
heapq.heappush(pq, PrioritizedItem(1, item="task B"))
heapq.heappush(pq, PrioritizedItem(1, item="task C"))  # same priority

while pq:
    print(heapq.heappop(pq).item)
# task B, task C, task A (FIFO within same priority)

# merge sorted iterables
a = [1, 3, 5, 7]
b = [2, 4, 6, 8]
merged = list(heapq.merge(a, b))
print(merged)   # [1, 2, 3, 4, 5, 6, 7, 8]'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'Advanced Collections'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_034'
      ..topicId = 'python'
      ..title = 'bisect — Binary Search & Sorted Lists'
      ..description = 'bisect maintains sorted lists efficiently. Useful for insertion, search, and range queries.'
      ..code = '''import bisect

# bisect_right / bisect_left — find insertion point
sorted_list = [1, 3, 5, 7, 9, 11]
pos = bisect.bisect_right(sorted_list, 5)   # 3 — insert after existing 5
pos = bisect.bisect_left(sorted_list, 5)    # 2 — insert before existing 5

# insort — insert and keep sorted (O(n) due to list shifting)
bisect.insort(sorted_list, 6)
print(sorted_list)  # [1, 3, 5, 6, 7, 9, 11]

bisect.insort_left(sorted_list, 6)
print(sorted_list)  # [1, 3, 5, 6, 6, 7, 9, 11]

# Binary search — check if value exists
def binary_search(lst: list, target) -> bool:
    idx = bisect.bisect_left(lst, target)
    return idx < len(lst) and lst[idx] == target

print(binary_search([1, 3, 5, 7], 5))   # True
print(binary_search([1, 3, 5, 7], 4))   # False

# Grade lookup using bisect
def grade(score: int) -> str:
    breakpoints = [50, 60, 70, 80, 90]
    grades = ["F", "D", "C", "B", "A+", "A"]
    return grades[bisect.bisect(breakpoints, score)]

print(grade(45))   # F
print(grade(75))   # B
print(grade(95))   # A

# Range count — how many values fall in [lo, hi]?
def count_range(lst: list, lo, hi) -> int:
    return bisect.bisect_right(lst, hi) - bisect.bisect_left(lst, lo)

data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(count_range(data, 3, 7))   # 5 (values 3,4,5,6,7)

# Nearest value
def find_nearest(sorted_lst: list, target) -> int:
    idx = bisect.bisect_left(sorted_lst, target)
    if idx == 0:
        return sorted_lst[0]
    if idx == len(sorted_lst):
        return sorted_lst[-1]
    before = sorted_lst[idx - 1]
    after  = sorted_lst[idx]
    return after if (after - target) < (target - before) else before

print(find_nearest([1, 3, 6, 10], 4))   # 3
print(find_nearest([1, 3, 6, 10], 5))   # 6'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'Advanced Collections'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_035'
      ..topicId = 'python'
      ..title = 'array & memoryview'
      ..description = 'array is a typed, compact alternative to list. memoryview allows zero-copy slicing of buffers.'
      ..code = '''import array

# array — typed, more compact than list for numeric data
# Type codes: 'b'=int8, 'h'=int16, 'i'=int32, 'l'=int64,
#             'f'=float32, 'd'=float64, 'u'=unicode char

int_arr = array.array('i', [1, 2, 3, 4, 5])
float_arr = array.array('f', [1.1, 2.2, 3.3])

print(int_arr[0])        # 1
int_arr.append(6)
int_arr.extend([7, 8])

# Size comparison vs list
import sys
lst = list(range(10_000))
arr = array.array('i', range(10_000))
print(sys.getsizeof(lst))  # ~87632 bytes
print(arr.buffer_info()[1] * arr.itemsize)  # ~40000 bytes

# Convert to/from list
as_list = int_arr.tolist()
int_arr2 = array.array('i', as_list)

# Write/read to binary file
with open("data.bin", "wb") as f:
    int_arr.tofile(f)

with open("data.bin", "rb") as f:
    loaded = array.array('i')
    loaded.fromfile(f, 5)  # read 5 items

# memoryview — zero-copy buffer protocol
data = bytearray(b"Hello, World!")
view = memoryview(data)

# Slice without copying
chunk = view[7:12]
print(bytes(chunk))  # b'World'

# Modify through view
view[0] = ord('J')
print(bytes(data))   # b'Jello, World!'

# Cast to different types
nums = array.array('h', [1, 2, 3, 4])   # int16
view = memoryview(nums).cast('B')         # view as bytes
print(list(view))   # raw bytes

# Efficient slicing of large byte buffers
large_buffer = bytearray(1_000_000)
view = memoryview(large_buffer)
chunk = view[500_000:600_000]   # no copy!'''
      ..language = 'python'
      ..difficulty = 'hard'
      ..section = 'Advanced Collections'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 3. ADVANCED OOP
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_036'
      ..topicId = 'python'
      ..title = 'Metaclasses'
      ..description = 'Metaclasses are the "class of a class". They control how classes are created. type is the default metaclass.'
      ..code = '''# type() can create classes dynamically
Dog = type("Dog", (object,), {
    "species": "Canis familiaris",
    "bark": lambda self: "Woof!",
})

fido = Dog()
print(fido.bark())   # Woof!

# Custom metaclass — runs when a class is *defined*
class SingletonMeta(type):
    _instances: dict = {}

    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super().__call__(*args, **kwargs)
        return cls._instances[cls]

class Database(metaclass=SingletonMeta):
    def __init__(self, url: str = "sqlite:///app.db"):
        self.url = url

db1 = Database("postgres://localhost/mydb")
db2 = Database()
print(db1 is db2)   # True — same object

# Registry metaclass — auto-register subclasses
class PluginMeta(type):
    registry: dict = {}

    def __new__(mcs, name, bases, namespace):
        cls = super().__new__(mcs, name, bases, namespace)
        if bases:   # skip the base class itself
            mcs.registry[name] = cls
        return cls

class Plugin(metaclass=PluginMeta):
    def run(self): ...

class CSVPlugin(Plugin):
    def run(self): return "processing CSV"

class JSONPlugin(Plugin):
    def run(self): return "processing JSON"

print(PluginMeta.registry)
# {'CSVPlugin': <class 'CSVPlugin'>, 'JSONPlugin': <class 'JSONPlugin'>}

# Use the registry
def get_plugin(name: str) -> Plugin:
    cls = PluginMeta.registry.get(name)
    if not cls:
        raise KeyError(f"No plugin named '{name}'")
    return cls()

p = get_plugin("CSVPlugin")
print(p.run())   # processing CSV

# Validation metaclass — enforce interface contracts
class ValidatedMeta(type):
    def __new__(mcs, name, bases, namespace):
        for method in namespace.get("__required_methods__", []):
            if method not in namespace:
                raise TypeError(f"Class {name} must implement '{method}'")
        return super().__new__(mcs, name, bases, namespace)

class Controller(metaclass=ValidatedMeta):
    __required_methods__ = ["handle", "validate"]
    def handle(self): ...
    def validate(self): ...'''
      ..language = 'python'
      ..difficulty = 'very_hard'
      ..section = 'Advanced OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_037'
      ..topicId = 'python'
      ..title = 'Descriptors'
      ..description = 'Descriptors implement __get__, __set__, __delete__ to customize attribute access. Powers @property under the hood.'
      ..code = '''# A descriptor is any object that defines __get__, __set__, or __delete__

class Validator:
    """Reusable validated attribute."""

    def __init__(self, min_val=None, max_val=None):
        self.min_val = min_val
        self.max_val = max_val

    def __set_name__(self, owner, name):
        self.name = name
        self.private = f"_{name}"

    def __get__(self, obj, objtype=None):
        if obj is None:
            return self           # accessed on class, not instance
        return getattr(obj, self.private, None)

    def __set__(self, obj, value):
        if not isinstance(value, (int, float)):
            raise TypeError(f"{self.name} must be numeric")
        if self.min_val is not None and value < self.min_val:
            raise ValueError(f"{self.name} must be >= {self.min_val}")
        if self.max_val is not None and value > self.max_val:
            raise ValueError(f"{self.name} must be <= {self.max_val}")
        setattr(obj, self.private, value)

class Product:
    price    = Validator(min_val=0)
    quantity = Validator(min_val=0, max_val=10_000)

    def __init__(self, name: str, price: float, quantity: int):
        self.name     = name
        self.price    = price
        self.quantity = quantity

p = Product("Widget", 9.99, 100)
print(p.price)    # 9.99

try:
    p.price = -1
except ValueError as e:
    print(e)   # price must be >= 0

# Lazy property descriptor — compute once, cache
class lazy_property:
    def __init__(self, func):
        self.func = func
        self.__doc__ = func.__doc__

    def __set_name__(self, owner, name):
        self.name = name

    def __get__(self, obj, objtype=None):
        if obj is None:
            return self
        value = self.func(obj)
        # Cache by writing directly to instance __dict__
        obj.__dict__[self.name] = value
        return value

class DataSet:
    def __init__(self, data: list):
        self.data = data

    @lazy_property
    def statistics(self) -> dict:
        print("Computing statistics...")   # runs once
        return {
            "mean":   sum(self.data) / len(self.data),
            "min":    min(self.data),
            "max":    max(self.data),
        }

ds = DataSet([1, 2, 3, 4, 5])
print(ds.statistics)   # Computing statistics... {'mean': 3.0, ...}
print(ds.statistics)   # cached — no recomputation'''
      ..language = 'python'
      ..difficulty = 'very_hard'
      ..section = 'Advanced OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_038'
      ..topicId = 'python'
      ..title = '__slots__ & Memory Optimization'
      ..description = '__slots__ prevents __dict__ creation, reducing memory by ~40-50% for objects with many instances.'
      ..code = '''import sys

# Without __slots__ — each instance has a __dict__
class PointNormal:
    def __init__(self, x: float, y: float):
        self.x = x
        self.y = y

# With __slots__ — fixed attribute set, no __dict__
class Point:
    __slots__ = ("x", "y")

    def __init__(self, x: float, y: float):
        self.x = x
        self.y = y

p1 = PointNormal(1.0, 2.0)
p2 = Point(1.0, 2.0)
print(sys.getsizeof(p1))   # ~48 bytes + __dict__ (~232 bytes)
print(sys.getsizeof(p2))   # ~56 bytes (no __dict__)

# Can't add new attributes to slotted class
try:
    p2.z = 3.0   # AttributeError: 'Point' object has no attribute 'z'
except AttributeError as e:
    print(e)

# Inheritance with __slots__
class Point3D(Point):
    __slots__ = ("z",)  # only NEW slots; x, y inherited

    def __init__(self, x, y, z):
        super().__init__(x, y)
        self.z = z

# Benchmark: 1 million instances
import tracemalloc

tracemalloc.start()
normal_points = [PointNormal(i, i) for i in range(100_000)]
snap1 = tracemalloc.take_snapshot()

tracemalloc.start()
slotted_points = [Point(i, i) for i in range(100_000)]
snap2 = tracemalloc.take_snapshot()

# Common use case: data-heavy applications
class Particle:
    """Used in physics simulations — millions of instances."""
    __slots__ = ("x", "y", "z", "vx", "vy", "vz", "mass", "charge")

    def __init__(self, x, y, z, mass=1.0, charge=0.0):
        self.x = x; self.y = y; self.z = z
        self.vx = 0.0; self.vy = 0.0; self.vz = 0.0
        self.mass = mass; self.charge = charge

# Also works with dataclasses (Python 3.10+)
from dataclasses import dataclass

@dataclass(slots=True)   # auto-generates __slots__
class Vector:
    x: float
    y: float
    z: float = 0.0

v = Vector(1.0, 2.0, 3.0)
print(v)           # Vector(x=1.0, y=2.0, z=3.0)
print(v.__slots__) # ('x', 'y', 'z')'''
      ..language = 'python'
      ..difficulty = 'hard'
      ..section = 'Advanced OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_039'
      ..topicId = 'python'
      ..title = 'Abstract Base Classes & Protocols'
      ..description = 'ABCs enforce interfaces at instantiation time. Protocols enable structural subtyping (duck typing with type safety).'
      ..code = '''from abc import ABC, abstractmethod
from typing import Protocol, runtime_checkable

# Abstract Base Class — nominal typing
class Serializable(ABC):
    @abstractmethod
    def serialize(self) -> dict: ...

    @abstractmethod
    def to_json(self) -> str: ...

    # Concrete method available to all subclasses
    def validate(self) -> bool:
        data = self.serialize()
        return all(v is not None for v in data.values())

    # Abstract class method
    @classmethod
    @abstractmethod
    def from_dict(cls, data: dict) -> "Serializable": ...

class User(Serializable):
    def __init__(self, name: str, email: str):
        self.name = name
        self.email = email

    def serialize(self) -> dict:
        return {"name": self.name, "email": self.email}

    def to_json(self) -> str:
        import json
        return json.dumps(self.serialize())

    @classmethod
    def from_dict(cls, data: dict) -> "User":
        return cls(data["name"], data["email"])

# Can't instantiate ABC directly
try:
    s = Serializable()   # TypeError
except TypeError as e:
    print(e)

# Protocol — structural typing (no explicit inheritance needed)
@runtime_checkable
class Drawable(Protocol):
    def draw(self) -> str: ...
    def get_color(self) -> str: ...

class Circle:
    # Does NOT inherit from Drawable — just implements the methods
    def draw(self) -> str: return "○"
    def get_color(self) -> str: return "red"

class Square:
    def draw(self) -> str: return "□"
    def get_color(self) -> str: return "blue"

def render_all(shapes: list[Drawable]) -> None:
    for shape in shapes:
        print(f"{shape.get_color()} {shape.draw()}")

render_all([Circle(), Square()])  # works without inheritance!

# Runtime check
print(isinstance(Circle(), Drawable))  # True (runtime_checkable)

# Combining ABC and Protocol
class Repository(Protocol):
    def find_by_id(self, id: int): ...
    def save(self, entity) -> None: ...
    def delete(self, id: int) -> None: ...

class UserRepository:
    def find_by_id(self, id: int): return {"id": id}
    def save(self, entity) -> None: pass
    def delete(self, id: int) -> None: pass

def process(repo: Repository) -> None:
    user = repo.find_by_id(1)
    print(user)

process(UserRepository())   # works!'''
      ..language = 'python'
      ..difficulty = 'hard'
      ..section = 'Advanced OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_040'
      ..topicId = 'python'
      ..title = 'Magic / Dunder Methods'
      ..description = 'Dunder methods customize how your objects behave with operators, len(), str(), iteration, and more.'
      ..code = '''class Vector:
    def __init__(self, x: float, y: float):
        self.x = x
        self.y = y

    # String representation
    def __repr__(self) -> str:
        return f"Vector({self.x}, {self.y})"

    def __str__(self) -> str:
        return f"({self.x}, {self.y})"

    # Arithmetic operators
    def __add__(self, other: "Vector") -> "Vector":
        return Vector(self.x + other.x, self.y + other.y)

    def __sub__(self, other: "Vector") -> "Vector":
        return Vector(self.x - other.x, self.y - other.y)

    def __mul__(self, scalar: float) -> "Vector":
        return Vector(self.x * scalar, self.y * scalar)

    def __rmul__(self, scalar: float) -> "Vector":
        return self.__mul__(scalar)   # scalar * vector

    def __neg__(self) -> "Vector":
        return Vector(-self.x, -self.y)

    def __abs__(self) -> float:
        return (self.x**2 + self.y**2) ** 0.5

    # Comparison
    def __eq__(self, other) -> bool:
        return isinstance(other, Vector) and self.x == other.x and self.y == other.y

    def __lt__(self, other: "Vector") -> bool:
        return abs(self) < abs(other)

    # Container protocol
    def __len__(self) -> int:
        return 2   # a 2D vector has 2 components

    def __getitem__(self, index: int) -> float:
        return (self.x, self.y)[index]

    def __iter__(self):
        yield self.x
        yield self.y

    # Boolean
    def __bool__(self) -> bool:
        return self.x != 0 or self.y != 0

    # Context manager
    def __enter__(self): return self
    def __exit__(self, *args): pass

    # Callable
    def __call__(self, scale: float) -> "Vector":
        return self * scale

v1 = Vector(1, 2)
v2 = Vector(3, 4)

print(v1 + v2)       # (4, 6)
print(v1 * 3)        # (3, 6)
print(3 * v1)        # (3, 6)  — uses __rmul__
print(abs(v2))       # 5.0
print(list(v1))      # [1, 2]  — iterable!
x, y = v1            # unpacking!
print(v1[0])         # 1
print(bool(Vector(0, 0)))  # False

scaler = v1
print(scaler(10))    # (10, 20)  — callable!'''
      ..language = 'python'
      ..difficulty = 'hard'
      ..section = 'Advanced OOP'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 4. CONCURRENCY
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_041'
      ..topicId = 'python'
      ..title = 'Threading'
      ..description = 'threading runs tasks concurrently using OS threads. Best for I/O-bound work. The GIL limits CPU-bound parallelism.'
      ..code = '''import threading
import time
from queue import Queue

# Basic thread
def worker(name: str, delay: float):
    print(f"{name} starting")
    time.sleep(delay)
    print(f"{name} done")

t = threading.Thread(target=worker, args=("Thread-1", 2.0), daemon=True)
t.start()
t.join()   # wait for completion

# Multiple threads
threads = []
for i in range(5):
    t = threading.Thread(target=worker, args=(f"T-{i}", 0.5))
    threads.append(t)
    t.start()

for t in threads:
    t.join()

# Thread subclass
class DownloadThread(threading.Thread):
    def __init__(self, url: str, result_list: list):
        super().__init__(daemon=True)
        self.url = url
        self.result_list = result_list

    def run(self):
        # simulate download
        time.sleep(0.1)
        self.result_list.append(f"data from {self.url}")

results = []
threads = [DownloadThread(f"https://api.example.com/{i}", results) for i in range(5)]
for t in threads: t.start()
for t in threads: t.join()
print(results)

# Lock — prevent race conditions
counter = 0
lock = threading.Lock()

def increment():
    global counter
    with lock:        # acquire and release automatically
        counter += 1

# RLock — reentrant lock (same thread can acquire multiple times)
rlock = threading.RLock()

# Event — signal between threads
ready = threading.Event()

def producer():
    time.sleep(1)
    print("Producer: data ready")
    ready.set()

def consumer():
    ready.wait()   # blocks until event is set
    print("Consumer: processing data")

# Semaphore — limit concurrent access
sem = threading.Semaphore(3)  # max 3 threads at once

def limited_worker(n):
    with sem:
        time.sleep(0.1)
        print(f"Worker {n} done")

# Thread-safe Queue
q = Queue(maxsize=10)

def producer_q():
    for i in range(10):
        q.put(i)
    q.put(None)  # sentinel

def consumer_q():
    while (item := q.get()) is not None:
        print(f"Processing {item}")
        q.task_done()

t1 = threading.Thread(target=producer_q)
t2 = threading.Thread(target=consumer_q)
t1.start(); t2.start()
t1.join(); t2.join()'''
      ..language = 'python'
      ..difficulty = 'hard'
      ..section = 'Concurrency'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_042'
      ..topicId = 'python'
      ..title = 'multiprocessing & ProcessPoolExecutor'
      ..description = 'multiprocessing bypasses the GIL for true CPU parallelism. Each process has its own memory.'
      ..code = '''from multiprocessing import Process, Pool, Queue, Value, Array
from concurrent.futures import ProcessPoolExecutor, as_completed
import os

# Basic process
def cpu_task(n: int) -> int:
    return sum(i * i for i in range(n))

if __name__ == "__main__":
    p = Process(target=cpu_task, args=(10_000,))
    p.start()
    p.join()

# Pool — run tasks across multiple cores
with Pool(processes=os.cpu_count()) as pool:
    results = pool.map(cpu_task, [10_000, 20_000, 30_000])
    print(results)

    # starmap for multiple args
    pairs = [(2, 10), (3, 20), (5, 30)]
    results = pool.starmap(pow, pairs)   # [1024, 3486784401, ...]

    # imap — lazy version of map
    for result in pool.imap(cpu_task, range(10)):
        print(result)

# ProcessPoolExecutor — higher-level API (recommended)
def factorize(n: int) -> list[int]:
    factors = []
    d = 2
    while d * d <= n:
        while n % d == 0:
            factors.append(d)
            n //= d
        d += 1
    if n > 1:
        factors.append(n)
    return factors

numbers = [112272535095293, 112582705942171, 112272535095293]

with ProcessPoolExecutor(max_workers=4) as executor:
    # submit returns a Future
    futures = {executor.submit(factorize, n): n for n in numbers}

    for future in as_completed(futures):
        n = futures[future]
        try:
            factors = future.result()
            print(f"{n}: {factors}")
        except Exception as e:
            print(f"Error for {n}: {e}")

# Shared memory between processes
shared_val = Value('i', 0)    # shared integer
shared_arr = Array('d', [0.0] * 10)  # shared float array

# Multiprocessing Queue
q = Queue()

def producer(q):
    for i in range(5):
        q.put(i)

def consumer(q):
    while not q.empty():
        print(q.get())'''
      ..language = 'python'
      ..difficulty = 'hard'
      ..section = 'Concurrency'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_043'
      ..topicId = 'python'
      ..title = 'ThreadPoolExecutor & Futures'
      ..description = 'concurrent.futures provides a high-level API for both thread and process pools.'
      ..code = '''from concurrent.futures import ThreadPoolExecutor, ProcessPoolExecutor, as_completed, wait
import time

def fetch_url(url: str) -> tuple[str, int]:
    """Simulate fetching a URL."""
    time.sleep(0.1)
    return url, 200  # (url, status_code)

urls = [f"https://api.example.com/item/{i}" for i in range(10)]

# map — like built-in map, blocks until all done
with ThreadPoolExecutor(max_workers=5) as executor:
    results = list(executor.map(fetch_url, urls))
    print(results)

# submit — get a Future object immediately
with ThreadPoolExecutor(max_workers=5) as executor:
    futures = [executor.submit(fetch_url, url) for url in urls]

    # Process as they complete (not submission order)
    for future in as_completed(futures):
        url, status = future.result()
        print(f"{status}: {url}")

# Add timeout
with ThreadPoolExecutor() as executor:
    future = executor.submit(time.sleep, 5)
    try:
        result = future.result(timeout=2.0)
    except TimeoutError:
        print("Task timed out")
        future.cancel()

# Attach callbacks
def on_done(future):
    print(f"Done: {future.result()}")

with ThreadPoolExecutor() as executor:
    f = executor.submit(fetch_url, "https://api.example.com")
    f.add_done_callback(on_done)

# wait — wait for specific completion conditions
from concurrent.futures import FIRST_COMPLETED, ALL_COMPLETED

with ThreadPoolExecutor() as executor:
    futures = [executor.submit(time.sleep, i * 0.1) for i in range(5)]
    done, not_done = wait(futures, return_when=FIRST_COMPLETED)
    print(f"{len(done)} done, {len(not_done)} pending")

# Batch processing pattern
def process_batch(items: list, batch_fn, max_workers: int = 8) -> list:
    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        futures = {executor.submit(batch_fn, item): item for item in items}
        results = []
        for future in as_completed(futures):
            try:
                results.append(future.result())
            except Exception as e:
                print(f"Error processing {futures[future]}: {e}")
        return results'''
      ..language = 'python'
      ..difficulty = 'hard'
      ..section = 'Concurrency'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 5. DESIGN PATTERNS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_044'
      ..topicId = 'python'
      ..title = 'Singleton, Factory & Observer Patterns'
      ..description = 'Common design patterns in Pythonic style. Patterns are tools, not rules — apply judiciously.'
      ..code = '''# ── SINGLETON ──────────────────────────────────────────
# Use metaclass or module-level instance
class Config:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance.settings = {}
        return cls._instance

cfg1 = Config()
cfg2 = Config()
print(cfg1 is cfg2)   # True

# ── FACTORY ─────────────────────────────────────────────
from abc import ABC, abstractmethod

class Notification(ABC):
    @abstractmethod
    def send(self, message: str) -> None: ...

class EmailNotification(Notification):
    def send(self, message: str) -> None:
        print(f"Email: {message}")

class SMSNotification(Notification):
    def send(self, message: str) -> None:
        print(f"SMS: {message}")

class PushNotification(Notification):
    def send(self, message: str) -> None:
        print(f"Push: {message}")

def notification_factory(channel: str) -> Notification:
    channels = {
        "email": EmailNotification,
        "sms":   SMSNotification,
        "push":  PushNotification,
    }
    cls = channels.get(channel.lower())
    if not cls:
        raise ValueError(f"Unknown channel: {channel}")
    return cls()

n = notification_factory("email")
n.send("Hello!")

# ── OBSERVER ────────────────────────────────────────────
from typing import Callable

class EventEmitter:
    def __init__(self):
        self._listeners: dict[str, list[Callable]] = {}

    def on(self, event: str, listener: Callable) -> None:
        self._listeners.setdefault(event, []).append(listener)

    def off(self, event: str, listener: Callable) -> None:
        self._listeners.get(event, []).remove(listener)

    def emit(self, event: str, *args, **kwargs) -> None:
        for listener in self._listeners.get(event, []):
            listener(*args, **kwargs)

emitter = EventEmitter()
emitter.on("login", lambda user: print(f"{user} logged in"))
emitter.on("login", lambda user: print(f"Sending welcome email to {user}"))
emitter.emit("login", "Alice")
# Alice logged in
# Sending welcome email to Alice'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'Design Patterns'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_045'
      ..topicId = 'python'
      ..title = 'Builder, Strategy & Decorator Patterns'
      ..description = 'Builder constructs complex objects step-by-step. Strategy swaps algorithms at runtime. Decorator adds behavior.'
      ..code = '''# ── BUILDER ─────────────────────────────────────────────
class QueryBuilder:
    def __init__(self, table: str):
        self._table = table
        self._conditions: list[str] = []
        self._columns: list[str] = ["*"]
        self._limit: int | None = None
        self._order_by: str | None = None

    def select(self, *columns: str) -> "QueryBuilder":
        self._columns = list(columns)
        return self   # return self for chaining

    def where(self, condition: str) -> "QueryBuilder":
        self._conditions.append(condition)
        return self

    def order(self, column: str) -> "QueryBuilder":
        self._order_by = column
        return self

    def limit(self, n: int) -> "QueryBuilder":
        self._limit = n
        return self

    def build(self) -> str:
        query = f"SELECT {', '.join(self._columns)} FROM {self._table}"
        if self._conditions:
            query += f" WHERE {' AND '.join(self._conditions)}"
        if self._order_by:
            query += f" ORDER BY {self._order_by}"
        if self._limit:
            query += f" LIMIT {self._limit}"
        return query

query = (QueryBuilder("users")
         .select("name", "email")
         .where("age >= 18")
         .where("active = TRUE")
         .order("name")
         .limit(10)
         .build())
print(query)
# SELECT name, email FROM users WHERE age >= 18 AND active = TRUE ORDER BY name LIMIT 10

# ── STRATEGY ────────────────────────────────────────────
from typing import Callable

class Sorter:
    def __init__(self, strategy: Callable[[list], list]):
        self._strategy = strategy

    def sort(self, data: list) -> list:
        return self._strategy(data)

# Swap strategies at runtime
asc_sorter  = Sorter(sorted)
desc_sorter = Sorter(lambda d: sorted(d, reverse=True))
abs_sorter  = Sorter(lambda d: sorted(d, key=abs))

data = [3, -1, 4, -1, 5, -9, 2, 6]
print(asc_sorter.sort(data))   # [-9, -1, -1, 2, 3, 4, 5, 6]
print(abs_sorter.sort(data))   # [-1, -1, 2, 3, 4, 5, 6, -9]

# ── DECORATOR (Structural) ───────────────────────────────
class TextProcessor:
    def process(self, text: str) -> str:
        return text

class UpperCaseDecorator:
    def __init__(self, wrapped: TextProcessor):
        self._wrapped = wrapped
    def process(self, text: str) -> str:
        return self._wrapped.process(text).upper()

class TrimDecorator:
    def __init__(self, wrapped: TextProcessor):
        self._wrapped = wrapped
    def process(self, text: str) -> str:
        return self._wrapped.process(text).strip()

processor = UpperCaseDecorator(TrimDecorator(TextProcessor()))
print(processor.process("  hello world  "))  # "HELLO WORLD"'''
      ..language = 'python'
      ..difficulty = 'hard'
      ..section = 'Design Patterns'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 6. ADVANCED FUNCTIONS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_046'
      ..topicId = 'python'
      ..title = 'Closures & Scoping (LEGB)'
      ..description = 'Python looks up names in Local → Enclosing → Global → Built-in order. Closures capture enclosing scope variables.'
      ..code = '''# LEGB: Local, Enclosing, Global, Built-in

x = "global"

def outer():
    x = "enclosing"

    def inner():
        x = "local"
        print(x)   # local (L)
    inner()
    print(x)       # enclosing (E)

outer()
print(x)           # global (G)

# global — modify global from inside function
count = 0

def increment():
    global count
    count += 1

increment()
print(count)   # 1

# nonlocal — modify enclosing scope variable
def make_counter():
    n = 0

    def counter():
        nonlocal n
        n += 1
        return n

    return counter

c1 = make_counter()
c2 = make_counter()   # independent counter
print(c1())   # 1
print(c1())   # 2
print(c2())   # 1

# Closure — function that remembers enclosing scope
def make_adder(step: int):
    def adder(x: int) -> int:
        return x + step   # step captured from enclosing scope
    return adder

add5  = make_adder(5)
add10 = make_adder(10)
print(add5(3))    # 8
print(add10(3))   # 13

# Inspect closure
print(add5.__closure__)            # tuple of cell objects
print(add5.__closure__[0].cell_contents)  # 5

# Common gotcha — late binding in loops
funcs_bad = [lambda x: x * i for i in range(3)]
print([f(2) for f in funcs_bad])   # [4, 4, 4] — all use last i=2!

# Fix: use default argument to capture current value
funcs_good = [lambda x, i=i: x * i for i in range(3)]
print([f(2) for f in funcs_good])  # [0, 2, 4] — correct!

# Or use partial
from functools import partial

def multiply(x, factor): return x * factor
funcs = [partial(multiply, factor=i) for i in range(3)]
print([f(2) for f in funcs])   # [0, 2, 4]'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'Advanced Functions'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_047'
      ..topicId = 'python'
      ..title = 'Coroutines & send()'
      ..description = 'Generators can receive values via send(), acting as coroutines. Useful for pipelines and cooperative multitasking.'
      ..code = '''# Basic send() — generator receives a value
def accumulator():
    total = 0
    while True:
        value = yield total   # yield sends total out, receives value in
        if value is None:
            break
        total += value

gen = accumulator()
next(gen)        # prime the generator (advance to first yield)
gen.send(10)     # total = 10
gen.send(20)     # total = 30
result = gen.send(5)
print(result)    # 35

# Pipeline with coroutines
def pipeline(*coroutines):
    """Chain coroutines: each sends its output to the next."""
    def decorator(producer):
        for co in reversed(coroutines):
            co.__next__()   # prime each
        def run(*args):
            result = producer(*args)
            for co in coroutines:
                result = co.send(result)
            return result
        return run
    return decorator

# Logger coroutine
def logger(target=None):
    while True:
        item = yield
        print(f"LOG: {item}")
        if target:
            target.send(item)

# Averager coroutine
def running_average():
    total, count = 0, 0
    avg = None
    while True:
        value = yield avg
        if value is not None:
            total += value
            count += 1
            avg = total / count

avg = running_average()
next(avg)                  # prime it
print(avg.send(10))        # 10.0
print(avg.send(20))        # 15.0
print(avg.send(30))        # 20.0

# throw() and close()
def resilient_gen():
    try:
        while True:
            value = yield
            print(f"Got: {value}")
    except ValueError as e:
        print(f"Error: {e}")
    finally:
        print("Generator closing")

g = resilient_gen()
next(g)
g.send(42)             # Got: 42
g.throw(ValueError, "bad input")   # Error: bad input
g.close()              # Generator closing (via GeneratorExit)'''
      ..language = 'python'
      ..difficulty = 'very_hard'
      ..section = 'Advanced Functions'
      ..isSaved = false
      ..lastViewedAt = null,

    // ═══════════════════════════════════════════════════════════
    // 7. SYSTEM & OS
    // ═══════════════════════════════════════════════════════════

    Snippet()
      ..snippetId = 'python_048'
      ..topicId = 'python'
      ..title = 'os & sys Modules'
      ..description = 'os provides OS-level file, process, and environment operations. sys exposes Python runtime internals.'
      ..code = '''import os
import sys

# ── ENVIRONMENT VARIABLES ───────────────────────────────
db_url = os.environ.get("DATABASE_URL", "sqlite:///default.db")
api_key = os.environ["API_KEY"]   # KeyError if missing

os.environ["DEBUG"] = "true"

# ── PATHS ────────────────────────────────────────────────
cwd = os.getcwd()               # current working directory
script_dir = os.path.dirname(os.path.abspath(__file__))

# os.path (legacy — prefer pathlib)
joined = os.path.join("/home", "user", "docs", "file.txt")
base = os.path.basename("/home/user/file.txt")  # file.txt
ext  = os.path.splitext("file.py")[1]           # .py
exists = os.path.exists("/etc/hosts")

# ── DIRECTORY OPERATIONS ─────────────────────────────────
os.makedirs("data/cache", exist_ok=True)
os.rename("old.txt", "new.txt")
os.remove("file.txt")          # delete file
os.rmdir("empty_dir")          # delete empty dir

# Walk directory tree
for dirpath, dirnames, filenames in os.walk("src"):
    for fname in filenames:
        full_path = os.path.join(dirpath, fname)
        print(full_path)

# List directory
entries = os.listdir(".")
files   = [f for f in entries if os.path.isfile(f)]
dirs    = [f for f in entries if os.path.isdir(f)]

# Scandir — more efficient than listdir
with os.scandir(".") as it:
    for entry in it:
        if entry.is_file() and entry.name.endswith(".py"):
            print(entry.name, entry.stat().st_size)

# ── PROCESS ─────────────────────────────────────────────
print(os.getpid())              # current process ID
print(os.getenv("HOME"))        # home directory

# ── sys ──────────────────────────────────────────────────
print(sys.version)              # Python version string
print(sys.platform)             # 'linux', 'darwin', 'win32'
print(sys.argv)                 # command-line arguments
print(sys.path)                 # module search paths

# Exit
sys.exit(0)                     # 0 = success, non-zero = error

# Redirect stdout
import io
old_stdout = sys.stdout
sys.stdout = io.StringIO()
print("captured!")
output = sys.stdout.getvalue()
sys.stdout = old_stdout
print(f"Got: {output.strip()}")   # Got: captured!

# sys.stdin / stdout / stderr
sys.stderr.write("Error message\\n")'''
      ..language = 'python'
      ..difficulty = 'easy'
      ..section = 'System & OS'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_049'
      ..topicId = 'python'
      ..title = 'subprocess'
      ..description = 'subprocess runs shell commands and external programs. Use run() for simple cases, Popen for streaming.'
      ..code = '''import subprocess

# run() — synchronous, waits for command to finish
result = subprocess.run(
    ["ls", "-la"],
    capture_output=True,   # capture stdout and stderr
    text=True,             # decode as string (not bytes)
    check=True             # raise CalledProcessError on non-zero exit
)
print(result.stdout)
print(result.returncode)   # 0

# Shell string (use carefully — injection risk with user input)
result = subprocess.run(
    "echo hello && echo world",
    shell=True,
    capture_output=True,
    text=True
)

# Input — send data to stdin
result = subprocess.run(
    ["sort"],
    input="banana\\napple\\ncherry\\n",
    capture_output=True,
    text=True
)
print(result.stdout)  # apple\nbanana\ncherry\n

# Error handling
try:
    subprocess.run(["false"], check=True)
except subprocess.CalledProcessError as e:
    print(f"Command failed with code {e.returncode}")

# Popen — streaming (for long-running commands)
with subprocess.Popen(
    ["tail", "-f", "/var/log/syslog"],
    stdout=subprocess.PIPE,
    text=True
) as proc:
    for line in proc.stdout:
        print(line.strip())
        if "error" in line.lower():
            proc.terminate()
            break

# Communicate — send input, get output (with timeout)
proc = subprocess.Popen(
    ["python3", "-c", "print(input('> '))"],
    stdin=subprocess.PIPE,
    stdout=subprocess.PIPE,
    text=True
)
stdout, stderr = proc.communicate(input="hello\\n", timeout=5)
print(stdout)   # hello

# Run Python script
import sys
subprocess.run([sys.executable, "script.py", "--arg", "value"])

# Capture stderr separately
result = subprocess.run(
    ["git", "status"],
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
    text=True,
    # cwd="/some/repo" 
)'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'System & OS'
      ..isSaved = false
      ..lastViewedAt = null,

    Snippet()
      ..snippetId = 'python_050'
      ..topicId = 'python'
      ..title = 'argparse — CLI Tools'
      ..description = 'argparse is the standard library for building command-line interfaces with typed arguments, flags, and subcommands.'
      ..code = '''import argparse
import sys

def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="mytool",
        description="A sample CLI tool",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="Examples:\\n  mytool process data.csv -o out.json --verbose"
    )

    # Positional argument
    parser.add_argument("input", help="Input file path")

    # Optional argument
    parser.add_argument("-o", "--output", default="output.json",
                        help="Output file (default: %(default)s)")

    # Flag (boolean)
    parser.add_argument("-v", "--verbose", action="store_true",
                        help="Enable verbose output")

    # Integer argument
    parser.add_argument("-n", "--count", type=int, default=10,
                        metavar="N", help="Number of results")

    # Choices
    parser.add_argument("--format", choices=["json", "csv", "xml"],
                        default="json", help="Output format")

    # Multiple values
    parser.add_argument("--tags", nargs="+", help="One or more tags")

    # Append multiple times
    parser.add_argument("--header", action="append", dest="headers",
                        help="Add header (can repeat)")

    return parser

# Subcommands
def build_subcommand_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(prog="app")
    subparsers = parser.add_subparsers(dest="command", required=True)

    # 'serve' subcommand
    serve = subparsers.add_parser("serve", help="Start the server")
    serve.add_argument("--port", type=int, default=8000)
    serve.add_argument("--host", default="127.0.0.1")

    # 'migrate' subcommand
    migrate = subparsers.add_parser("migrate", help="Run database migrations")
    migrate.add_argument("--dry-run", action="store_true")

    return parser

# Main entry point
def main():
    parser = build_subcommand_parser()
    args = parser.parse_args()

    if args.command == "serve":
        print(f"Serving on {args.host}:{args.port}")
    elif args.command == "migrate":
        if args.dry_run:
            print("Dry run: no changes applied")
        else:
            print("Running migrations...")

if __name__ == "__main__":
    # main()
    pass

# Test without running from command line:
# args = parser.parse_args(["serve", "--port", "9000"])'''
      ..language = 'python'
      ..difficulty = 'medium'
      ..section = 'System & OS'
      ..isSaved = false
      ..lastViewedAt = null,

  ];
}
