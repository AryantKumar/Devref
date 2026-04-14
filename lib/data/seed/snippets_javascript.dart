import '../models/snippet.dart';

List<Snippet> getJavaScriptSnippets() {
  return [
    Snippet()..snippetId='js_001'..topicId='javascript'..title='Hello World'..description='Basic console output in JavaScript.'..code='console.log("Hello, World!");'..language='javascript'..difficulty='very_easy'..section='Introduction to JavaScript'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_002'..topicId='javascript'..title='Variables (let, const, var)'..description='let and const are block-scoped; var is function-scoped. const prevents reassignment.'..code='''const name = "JavaScript";
let version = 2024;
var legacy = true; // function-scoped

// const prevents reassignment
// name = "JS"; // TypeError

version = 2025; // OK with let
console.log(`\${name} \${version}`);'''..language='javascript'..difficulty='very_easy'..section='Data Types and Variables'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_003'..topicId='javascript'..title='Arrow Functions'..description='Arrow functions provide concise syntax for function expressions with lexical this binding.'..code='''const add = (a, b) => a + b;
const square = x => x * x;
const greet = name => {
  const greeting = `Hello, \${name}!`;
  return greeting;
};

console.log(add(2, 3));    // 5
console.log(square(4));    // 16
console.log(greet("JS"));  // Hello, JS!

// Array methods with arrows
const nums = [1, 2, 3, 4, 5];
const doubled = nums.map(n => n * 2);
const evens = nums.filter(n => n % 2 === 0);
console.log(doubled, evens);'''..language='javascript'..difficulty='very_easy'..section='Data Types and Variables'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_004'..topicId='javascript'..title='Template Literals'..description='Template literals enable string interpolation, multi-line strings, and tagged templates.'..code='''const name = "World";
const age = 25;

// Interpolation
console.log(`Hello, \${name}!`);
console.log(`Next year: \${age + 1}`);

// Multi-line
const html = `
  <div>
    <h1>\${name}</h1>
    <p>Age: \${age}</p>
  </div>
`;
console.log(html);

// Tagged template
function highlight(strings, ...values) {
  return strings.reduce((result, str, i) =>
    result + str + (values[i] ? `**\${values[i]}**` : ""), "");
}
console.log(highlight`Hello \${name}, you are \${age}`);'''..language='javascript'..difficulty='very_easy'..section='Conditional Expressions'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_005'..topicId='javascript'..title='Destructuring Assignment'..description='Extract values from arrays and objects into distinct variables using destructuring patterns.'..code='''// Array destructuring
const [a, b, ...rest] = [1, 2, 3, 4, 5];
console.log(a, b, rest); // 1 2 [3,4,5]

// Object destructuring
const { name, age, city = "Unknown" } = {
  name: "Alice", age: 30
};
console.log(name, age, city);

// Nested destructuring
const { address: { street, zip } } = {
  address: { street: "123 Main", zip: "10001" }
};
console.log(street, zip);

// Function parameter destructuring
function display({ name, role = "user" }) {
  console.log(`\${name} (\${role})`);
}
display({ name: "Bob" });'''..language='javascript'..difficulty='very_easy'..section='Conditional Expressions'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_006'..topicId='javascript'..title='Array Methods (map, filter, reduce)'..description='Core functional array methods for transforming, filtering, and aggregating data.'..code='''const products = [
  { name: "Phone", price: 699, inStock: true },
  { name: "Laptop", price: 1299, inStock: false },
  { name: "Tablet", price: 499, inStock: true },
  { name: "Watch", price: 399, inStock: true },
];

const available = products.filter(p => p.inStock);
const names = available.map(p => p.name);
const total = available.reduce((sum, p) => sum + p.price, 0);
const expensive = products.find(p => p.price > 1000);
const anyAvailable = products.some(p => p.inStock);

console.log("Available:", names);
console.log("Total:", total);
console.log("Expensive:", expensive?.name);
console.log("Any available:", anyAvailable);'''..language='javascript'..difficulty='very_easy'..section='Functions'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_007'..topicId='javascript'..title='Objects and Spread Operator'..description='Create and manipulate objects using shorthand syntax, computed properties, and spread operator.'..code='''const x = 10, y = 20;
const point = { x, y }; // shorthand
console.log(point);

// Computed property
const key = "color";
const config = { [key]: "blue", size: 42 };
console.log(config);

// Spread
const defaults = { theme: "dark", lang: "en" };
const user = { ...defaults, lang: "fr", name: "Alice" };
console.log(user);

// Object methods
const entries = Object.entries(user);
const keys = Object.keys(user);
const frozen = Object.freeze({ ...user });
console.log(entries);'''..language='javascript'..difficulty='very_easy'..section='Objects and Classes'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_008'..topicId='javascript'..title='Classes'..description='ES6 classes provide syntactic sugar over prototypal inheritance with constructor, methods, and extends.'..code='''class Animal {
  constructor(name) {
    this.name = name;
  }
  speak() {
    return `\${this.name} makes a noise.`;
  }
}

class Dog extends Animal {
  constructor(name, breed) {
    super(name);
    this.breed = breed;
  }
  speak() {
    return `\${this.name} barks!`;
  }
}

const dog = new Dog("Rex", "Labrador");
console.log(dog.speak());
console.log(dog instanceof Animal); // true'''..language='javascript'..difficulty='very_easy'..section='Arrays and Collections'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_009'..topicId='javascript'..title='Optional Chaining & Nullish Coalescing'..description='Safely access deeply nested properties with ?. and provide defaults with ?? operator.'..code='''const user = {
  name: "Alice",
  address: {
    street: "123 Main St",
    city: "Berlin"
  },
  getFullName() { return this.name; }
};

console.log(user?.address?.city);   // "Berlin"
console.log(user?.phone?.number);   // undefined
console.log(user?.getFullName?.());  // "Alice"

// Nullish coalescing (??)
const port = null ?? 3000;        // 3000
const host = "" ?? "localhost";    // "" (not nullish)
const count = 0 ?? 42;            // 0 (not nullish)
const val = undefined ?? "default"; // "default"

console.log(port, host, count, val);'''..language='javascript'..difficulty='very_easy'..section='Data Types and Variables'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_010'..topicId='javascript'..title='Error Handling (try/catch)'..description='Handle runtime errors with try-catch-finally blocks and custom error types.'..code='''class ValidationError extends Error {
  constructor(field, message) {
    super(message);
    this.field = field;
    this.name = "ValidationError";
  }
}

function validateAge(age) {
  if (typeof age !== "number") {
    throw new TypeError("Age must be a number");
  }
  if (age < 0 || age > 150) {
    throw new ValidationError("age", "Age must be 0-150");
  }
  return true;
}

try {
  validateAge(200);
} catch (e) {
  if (e instanceof ValidationError) {
    console.log(`Field: \${e.field}, Error: \${e.message}`);
  } else {
    console.log(`Unexpected: \${e.message}`);
  }
} finally {
  console.log("Validation complete");
}'''..language='javascript'..difficulty='very_easy'..section='Error Handling'..isSaved=false..lastViewedAt=null,

    // â”€â”€ Medium (10) â”€â”€
    Snippet()..snippetId='js_011'..topicId='javascript'..title='Closures'..description='A closure is a function that captures variables from its surrounding lexical scope.'..code='''function createCounter(initial = 0) {
  let count = initial;
  return {
    increment: () => ++count,
    decrement: () => --count,
    getCount: () => count,
    reset: () => { count = initial; }
  };
}

const counter = createCounter(10);
console.log(counter.increment()); // 11
console.log(counter.increment()); // 12
console.log(counter.decrement()); // 11
counter.reset();
console.log(counter.getCount());  // 10

// Private variables via closure
function createPerson(name) {
  let _age = 0; // private
  return {
    getName: () => name,
    getAge: () => _age,
    birthday: () => { _age++; }
  };
}'''..language='javascript'..difficulty='medium'..section='Arrays and Collections'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_012'..topicId='javascript'..title='Promises'..description='Promises represent eventual completion or failure of an async operation and enable chaining.'..code='''function fetchUser(id) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (id > 0) {
        resolve({ id, name: `User_\${id}` });
      } else {
        reject(new Error("Invalid ID"));
      }
    }, 100);
  });
}

// Chaining
fetchUser(1)
  .then(user => {
    console.log("Got:", user.name);
    return fetchUser(2);
  })
  .then(user => console.log("Got:", user.name))
  .catch(err => console.error(err.message));

// Promise.all - parallel
Promise.all([fetchUser(1), fetchUser(2), fetchUser(3)])
  .then(users => console.log("All:", users.map(u => u.name)));

// Promise.allSettled
Promise.allSettled([fetchUser(1), fetchUser(-1)])
  .then(results => results.forEach(r =>
    console.log(r.status, r.value?.name || r.reason?.message)
  ));'''..language='javascript'..difficulty='medium'..section='Functions'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_013'..topicId='javascript'..title='Async/Await'..description='Async/await provides syntactic sugar over Promises for writing asynchronous code that looks synchronous.'..code='''async function fetchData(url) {
  const response = await fetch(url);
  if (!response.ok) throw new Error(`HTTP \${response.status}`);
  return response.json();
}

async function fetchMultiple(urls) {
  const promises = urls.map(url => fetchData(url));
  return Promise.all(promises);
}

// Error handling with async/await
async function safeRequest(url) {
  try {
    const data = await fetchData(url);
    return { success: true, data };
  } catch (error) {
    return { success: false, error: error.message };
  }
}

// Sequential vs Parallel
async function demo() {
  // Sequential
  const user = await fetchData("/api/user/1");
  const posts = await fetchData("/api/posts?userId=1");

  // Parallel (faster!)
  const [user2, posts2] = await Promise.all([
    fetchData("/api/user/2"),
    fetchData("/api/posts?userId=2")
  ]);
}'''..language='javascript'..difficulty='medium'..section='Objects and Classes'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_014'..topicId='javascript'..title='Map and Set'..description='Map provides key-value storage with any key type; Set stores unique values. Both maintain insertion order.'..code='''// Map
const userMap = new Map();
userMap.set("alice", { age: 30, role: "admin" });
userMap.set("bob", { age: 25, role: "user" });

console.log(userMap.get("alice")); // {age: 30, role: "admin"}
console.log(userMap.has("charlie")); // false
console.log(userMap.size); // 2

// Object keys in Map
const objKey = { id: 1 };
const cache = new Map();
cache.set(objKey, "cached data");
console.log(cache.get(objKey)); // "cached data"

// Set
const unique = new Set([1, 2, 3, 2, 1, 4]);
console.log([...unique]); // [1, 2, 3, 4]

unique.add(5);
unique.delete(1);
console.log(unique.has(3)); // true

// Set operations
const a = new Set([1, 2, 3]);
const b = new Set([2, 3, 4]);
const union = new Set([...a, ...b]);
const intersection = new Set([...a].filter(x => b.has(x)));
console.log([...union], [...intersection]);'''..language='javascript'..difficulty='medium'..section='Async Programming'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_015'..topicId='javascript'..title='Generators'..description='Generator functions produce sequences of values lazily using yield. They return an iterator.'..code='''function* range(start, end, step = 1) {
  for (let i = start; i < end; i += step) {
    yield i;
  }
}

function* fibonacci() {
  let a = 0, b = 1;
  while (true) {
    yield a;
    [a, b] = [b, a + b];
  }
}

// Using generators
for (const n of range(0, 10, 2)) {
  process.stdout.write(n + " "); // 0 2 4 6 8
}
console.log();

// Take first N from infinite generator
function take(gen, n) {
  const result = [];
  for (const val of gen) {
    result.push(val);
    if (result.length >= n) break;
  }
  return result;
}

console.log(take(fibonacci(), 10));
// [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]'''..language='javascript'..difficulty='medium'..section='Functions'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_016'..topicId='javascript'..title='Iterators and Symbol.iterator'..description='Make any object iterable by implementing the Symbol.iterator protocol for use in for...of loops.'..code='''class Range {
  constructor(start, end) {
    this.start = start;
    this.end = end;
  }

  [Symbol.iterator]() {
    let current = this.start;
    const end = this.end;
    return {
      next() {
        if (current <= end) {
          return { value: current++, done: false };
        }
        return { done: true };
      }
    };
  }
}

const range = new Range(1, 5);
for (const n of range) {
  console.log(n); // 1, 2, 3, 4, 5
}

// Spread works too
console.log([...new Range(10, 15)]);
// [10, 11, 12, 13, 14, 15]

// Destructuring works
const [first, second] = new Range(100, 200);
console.log(first, second); // 100 101'''..language='javascript'..difficulty='medium'..section='Objects and Classes'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_017'..topicId='javascript'..title='Event Emitter Pattern'..description='Implement a publish-subscribe event system with on, off, once, and emit methods.'..code='''class EventEmitter {
  constructor() {
    this.events = new Map();
  }

  on(event, listener) {
    if (!this.events.has(event)) {
      this.events.set(event, []);
    }
    this.events.get(event).push(listener);
    return this;
  }

  off(event, listener) {
    const listeners = this.events.get(event);
    if (listeners) {
      this.events.set(event, listeners.filter(l => l !== listener));
    }
    return this;
  }

  once(event, listener) {
    const wrapper = (...args) => {
      listener(...args);
      this.off(event, wrapper);
    };
    return this.on(event, wrapper);
  }

  emit(event, ...args) {
    const listeners = this.events.get(event) || [];
    listeners.forEach(listener => listener(...args));
    return listeners.length > 0;
  }
}

const emitter = new EventEmitter();
emitter.on("data", d => console.log("Data:", d));
emitter.once("connect", () => console.log("Connected!"));
emitter.emit("connect");
emitter.emit("data", { id: 1 });'''..language='javascript'..difficulty='medium'..section='Objects and Classes'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_018'..topicId='javascript'..title='Module Pattern (ESM)'..description='ES Modules provide import/export syntax for organizing code into reusable, encapsulated modules.'..code='''// math.js - Named exports
export const PI = 3.14159;
export function add(a, b) { return a + b; }
export function multiply(a, b) { return a * b; }

// logger.js - Default export
export default class Logger {
  constructor(prefix = "") {
    this.prefix = prefix;
  }
  log(msg) { console.log(`[\${this.prefix}] \${msg}`); }
  error(msg) { console.error(`[\${this.prefix}] ERROR: \${msg}`); }
}

// app.js - Imports
// import Logger from "./logger.js";
// import { add, PI } from "./math.js";
// import * as math from "./math.js";

// Dynamic import
async function loadModule(name) {
  const module = await import(`./\${name}.js`);
  return module;
}

// Re-export pattern
// export { add, multiply } from "./math.js";
// export { default as Logger } from "./logger.js";'''..language='javascript'..difficulty='medium'..section='Arrays and Collections'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_019'..topicId='javascript'..title='WeakMap and WeakSet'..description='WeakMap and WeakSet hold weak references, allowing garbage collection of keys when no other references exist.'..code='''// WeakMap for private data
const privateData = new WeakMap();

class User {
  constructor(name, password) {
    this.name = name;
    privateData.set(this, { password });
  }

  checkPassword(pw) {
    return privateData.get(this).password === pw;
  }
}

const user = new User("Alice", "secret123");
console.log(user.name);              // "Alice"
console.log(user.checkPassword("secret123")); // true
// password not accessible from outside

// WeakSet for tracking
const processed = new WeakSet();

function processOnce(obj) {
  if (processed.has(obj)) {
    console.log("Already processed:", obj.id);
    return;
  }
  processed.add(obj);
  console.log("Processing:", obj.id);
}

const item = { id: 1 };
processOnce(item); // Processing: 1
processOnce(item); // Already processed: 1'''..language='javascript'..difficulty='medium'..section='Data Types and Variables'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_020'..topicId='javascript'..title='Array and Object Patterns'..description='Advanced patterns: grouping, partitioning, chunking, and deep cloning with modern JavaScript.'..code='''// Group by
const people = [
  { name: "Alice", dept: "Eng" },
  { name: "Bob", dept: "Sales" },
  { name: "Charlie", dept: "Eng" },
  { name: "Diana", dept: "Sales" },
];

const grouped = Object.groupBy(people, p => p.dept);
console.log(grouped);

// Chunk array
function chunk(arr, size) {
  return Array.from(
    { length: Math.ceil(arr.length / size) },
    (_, i) => arr.slice(i * size, i * size + size)
  );
}
console.log(chunk([1,2,3,4,5,6,7], 3));

// Deep clone
const original = { a: 1, b: { c: 2 }, d: [3, 4] };
const clone = structuredClone(original);
clone.b.c = 99;
console.log(original.b.c); // 2 (unchanged)

// Partition
const [pass, fail] = [1,2,3,4,5,6].reduce(
  ([p, f], n) => n > 3 ? [[...p, n], f] : [p, [...f, n]],
  [[], []]
);
console.log(pass, fail);'''..language='javascript'..difficulty='medium'..section='Functions'..isSaved=false..lastViewedAt=null,

    // â”€â”€ Hard (10) â”€â”€
    Snippet()..snippetId='js_021'..topicId='javascript'..title='Proxy and Reflect'..description='Proxy intercepts operations on objects (get, set, delete). Reflect provides default behavior methods.'..code='''const validator = {
  set(target, prop, value) {
    if (prop === "age" && typeof value !== "number") {
      throw new TypeError("Age must be a number");
    }
    if (prop === "age" && (value < 0 || value > 150)) {
      throw new RangeError("Age must be 0-150");
    }
    return Reflect.set(target, prop, value);
  },
  get(target, prop) {
    if (!(prop in target)) {
      console.warn(`Property "\${prop}" does not exist`);
      return undefined;
    }
    return Reflect.get(target, prop);
  },
  deleteProperty(target, prop) {
    if (prop === "id") {
      throw new Error("Cannot delete id");
    }
    return Reflect.deleteProperty(target, prop);
  }
};

const user = new Proxy({ id: 1, name: "Alice" }, validator);
user.age = 30;         // OK
user.name = "Bob";     // OK
console.log(user.phone); // Warning + undefined
// user.age = -1;      // RangeError
// delete user.id;     // Error'''..language='javascript'..difficulty='hard'..section='Objects and Classes'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_022'..topicId='javascript'..title='Event Loop & Microtasks'..description='Understanding the JavaScript event loop, microtask queue (Promises), and macrotask queue (setTimeout).'..code='''console.log("1: Start");

setTimeout(() => console.log("2: setTimeout"), 0);

Promise.resolve()
  .then(() => console.log("3: Promise 1"))
  .then(() => console.log("4: Promise 2"));

queueMicrotask(() => console.log("5: Microtask"));

requestAnimationFrame?.(() => console.log("6: rAF"));

console.log("7: End");

// Output order:
// 1: Start
// 7: End
// 3: Promise 1  (microtask)
// 5: Microtask  (microtask)
// 4: Promise 2  (microtask)
// 2: setTimeout (macrotask)
// 6: rAF        (before next paint)

// Explanation:
// 1. Synchronous code runs first (1, 7)
// 2. Microtasks drain completely (3, 5, 4)
// 3. One macrotask runs (2)
// 4. rAF runs before paint (6)'''..language='javascript'..difficulty='hard'..section='Async Programming'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_023'..topicId='javascript'..title='Prototype Chain'..description='Deep dive into prototypal inheritance, __proto__, Object.create, and property lookup chain.'..code='''const animal = {
  type: "Animal",
  describe() {
    return `\${this.name} is a \${this.type}`;
  }
};

const dog = Object.create(animal);
dog.type = "Dog";
dog.bark = function() { return `\${this.name}: Woof!`; };

const myDog = Object.create(dog);
myDog.name = "Rex";

console.log(myDog.describe()); // Rex is a Dog
console.log(myDog.bark());     // Rex: Woof!

// Prototype chain inspection
console.log(Object.getPrototypeOf(myDog) === dog);    // true
console.log(Object.getPrototypeOf(dog) === animal);    // true
console.log(myDog.hasOwnProperty("name"));   // true
console.log(myDog.hasOwnProperty("bark"));   // false

// Property lookup chain
for (const key in myDog) {
  const own = myDog.hasOwnProperty(key) ? "(own)" : "(inherited)";
  console.log(`  \${key}: \${own}`);
}'''..language='javascript'..difficulty='hard'..section='Objects and Classes'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_024'..topicId='javascript'..title='Async Iterators'..description='Async iterators enable consuming asynchronous data streams using for-await-of loops.'..code='''async function* fetchPages(baseUrl, maxPages = 5) {
  let page = 1;
  while (page <= maxPages) {
    // Simulate API call
    await new Promise(r => setTimeout(r, 100));
    const data = {
      page,
      items: Array.from({ length: 3 }, (_, i) =>
        ({ id: (page - 1) * 3 + i + 1, name: `Item \${(page - 1) * 3 + i + 1}` })
      ),
      hasMore: page < maxPages
    };
    yield data;
    if (!data.hasMore) break;
    page++;
  }
}

async function main() {
  const allItems = [];
  for await (const page of fetchPages("/api/items", 3)) {
    console.log(`Page \${page.page}: \${page.items.length} items`);
    allItems.push(...page.items);
  }
  console.log(`Total: \${allItems.length} items`);
}

main();'''..language='javascript'..difficulty='hard'..section='Objects and Classes'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_025'..topicId='javascript'..title='Currying and Partial Application'..description='Transform a multi-argument function into a chain of single-argument functions for flexibility.'..code='''// Manual curry
const curry = (fn) => {
  const arity = fn.length;
  return function curried(...args) {
    if (args.length >= arity) {
      return fn(...args);
    }
    return (...moreArgs) => curried(...args, ...moreArgs);
  };
};

const add = curry((a, b, c) => a + b + c);
console.log(add(1)(2)(3));    // 6
console.log(add(1, 2)(3));    // 6
console.log(add(1)(2, 3));    // 6

// Practical use
const multiply = curry((a, b) => a * b);
const double = multiply(2);
const triple = multiply(3);

console.log([1, 2, 3].map(double)); // [2, 4, 6]
console.log([1, 2, 3].map(triple)); // [3, 6, 9]

// Partial application
const log = (level, timestamp, message) =>
  console.log(`[\${level}] \${timestamp}: \${message}`);
const errorLog = log.bind(null, "ERROR", new Date().toISOString());
errorLog("Something failed");'''..language='javascript'..difficulty='hard'..section='Async Programming'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_026'..topicId='javascript'..title='AbortController for Cancellation'..description='Cancel fetch requests and async operations using AbortController and AbortSignal.'..code='''async function fetchWithTimeout(url, timeout = 5000) {
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), timeout);

  try {
    const response = await fetch(url, {
      signal: controller.signal
    });
    clearTimeout(timeoutId);
    return await response.json();
  } catch (error) {
    clearTimeout(timeoutId);
    if (error.name === "AbortError") {
      throw new Error(`Request timed out after \${timeout}ms`);
    }
    throw error;
  }
}

// Cancel multiple concurrent requests
async function raceRequests(urls) {
  const controller = new AbortController();
  try {
    const result = await Promise.race(
      urls.map(url =>
        fetch(url, { signal: controller.signal }).then(r => r.json())
      )
    );
    controller.abort(); // cancel remaining
    return result;
  } catch (e) {
    controller.abort();
    throw e;
  }
}'''..language='javascript'..difficulty='hard'..section='Functions'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_027'..topicId='javascript'..title='Web Workers'..description='Run CPU-intensive tasks in background threads using Web Workers without blocking the main thread.'..code='''// main.js
const worker = new Worker("worker.js");

worker.onmessage = (event) => {
  console.log("Result from worker:", event.data);
};

worker.onerror = (error) => {
  console.error("Worker error:", error.message);
};

worker.postMessage({ type: "fibonacci", n: 40 });

// worker.js
self.onmessage = (event) => {
  const { type, n } = event.data;

  switch (type) {
    case "fibonacci":
      const result = fibonacci(n);
      self.postMessage({ type, result, n });
      break;
    case "prime":
      const primes = sieveOfEratosthenes(n);
      self.postMessage({ type, result: primes });
      break;
  }
};

function fibonacci(n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

function sieveOfEratosthenes(limit) {
  const sieve = new Uint8Array(limit + 1).fill(1);
  sieve[0] = sieve[1] = 0;
  for (let i = 2; i * i <= limit; i++) {
    if (sieve[i]) {
      for (let j = i * i; j <= limit; j += i) sieve[j] = 0;
    }
  }
  return [...sieve.entries()].filter(([, v]) => v).map(([i]) => i);
}'''..language='javascript'..difficulty='hard'..section='Objects and Classes'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_028'..topicId='javascript'..title='Symbol and Well-Known Symbols'..description='Symbols create unique property keys. Well-known symbols customize object behavior like iteration and conversion.'..code='''const id = Symbol("id");
const obj = { [id]: 42, name: "test" };

console.log(obj[id]);       // 42
console.log(Object.keys(obj)); // ["name"] - symbols excluded

// Well-known symbols
class Money {
  constructor(amount, currency) {
    this.amount = amount;
    this.currency = currency;
  }

  [Symbol.toPrimitive](hint) {
    switch (hint) {
      case "number": return this.amount;
      case "string": return `\${this.amount} \${this.currency}`;
      default: return this.amount;
    }
  }

  [Symbol.iterator]() {
    // Iterate over individual units
    let remaining = this.amount;
    return {
      next() {
        if (remaining > 0) {
          remaining--;
          return { value: 1, done: false };
        }
        return { done: true };
      }
    };
  }
}

const price = new Money(5, "USD");
console.log(`Price: \${price}`);  // "5 USD"
console.log(price + 10);          // 15
console.log([...price]);           // [1, 1, 1, 1, 1]'''..language='javascript'..difficulty='hard'..section='Objects and Classes'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_029'..topicId='javascript'..title='Private Fields and Static Methods'..description='True private fields with # syntax. Static methods and properties aren\'t accessible from instances.'..code='''class BankAccount {
  #balance;
  #history = [];
  static #totalAccounts = 0;

  constructor(owner, initial = 0) {
    this.owner = owner;
    this.#balance = initial;
    this.#history.push({ type: "open", amount: initial });
    BankAccount.#totalAccounts++;
  }

  deposit(amount) {
    if (amount <= 0) throw new Error("Invalid amount");
    this.#balance += amount;
    this.#log("deposit", amount);
  }

  withdraw(amount) {
    if (amount > this.#balance) throw new Error("Insufficient funds");
    this.#balance -= amount;
    this.#log("withdraw", amount);
  }

  get balance() { return this.#balance; }
  get history() { return [...this.#history]; }

  #log(type, amount) {
    this.#history.push({ type, amount, balance: this.#balance });
  }

  static get totalAccounts() { return BankAccount.#totalAccounts; }
}

const acc = new BankAccount("Alice", 100);
acc.deposit(50);
acc.withdraw(30);
console.log(acc.balance); // 120
console.log(acc.history);
// acc.#balance; // SyntaxError!'''..language='javascript'..difficulty='hard'..section='Async Programming'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_030'..topicId='javascript'..title='Memoization'..description='Cache function results to avoid redundant computation for expensive or recursive functions.'..code='''function memoize(fn) {
  const cache = new Map();
  return function (...args) {
    const key = JSON.stringify(args);
    if (cache.has(key)) {
      console.log(`Cache hit: \${key}`);
      return cache.get(key);
    }
    const result = fn.apply(this, args);
    cache.set(key, result);
    return result;
  };
}

// Memoized fibonacci
const fib = memoize(function (n) {
  if (n <= 1) return n;
  return fib(n - 1) + fib(n - 2);
});

console.time("fib(40)");
console.log(fib(40)); // 102334155
console.timeEnd("fib(40)");

// Memoized API call
const fetchUser = memoize(async (id) => {
  const res = await fetch(`/api/users/\${id}`);
  return res.json();
});'''..language='javascript'..difficulty='hard'..section='Functions'..isSaved=false..lastViewedAt=null,

    // â”€â”€ Very Hard (10) â”€â”€
    Snippet()..snippetId='js_031'..topicId='javascript'..title='Custom Observable (RxJS-like)'..description='Implement a basic Observable pattern with subscribe, map, filter, and merge operators from scratch.'..code='''class Observable {
  constructor(subscribe) {
    this._subscribe = subscribe;
  }

  subscribe(observer) {
    const obs = typeof observer === "function"
      ? { next: observer, error: () => {}, complete: () => {} }
      : observer;
    return this._subscribe(obs);
  }

  map(fn) {
    return new Observable(observer => {
      return this.subscribe({
        next: val => observer.next(fn(val)),
        error: err => observer.error(err),
        complete: () => observer.complete()
      });
    });
  }

  filter(predicate) {
    return new Observable(observer => {
      return this.subscribe({
        next: val => predicate(val) && observer.next(val),
        error: err => observer.error(err),
        complete: () => observer.complete()
      });
    });
  }

  static fromEvent(element, event) {
    return new Observable(observer => {
      const handler = e => observer.next(e);
      element.addEventListener(event, handler);
      return () => element.removeEventListener(event, handler);
    });
  }
}

// Usage
const numbers = new Observable(observer => {
  [1, 2, 3, 4, 5].forEach(n => observer.next(n));
  observer.complete();
});

numbers
  .filter(n => n % 2 === 0)
  .map(n => n * 10)
  .subscribe({ next: v => console.log(v) });'''..language='javascript'..difficulty='very_hard'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_032'..topicId='javascript'..title='Dependency Injection Container'..description='Build a simple IoC container for managing dependencies with singleton and transient lifetimes.'..code='''class Container {
  #registrations = new Map();
  #singletons = new Map();

  register(name, factory, { singleton = false } = {}) {
    this.#registrations.set(name, { factory, singleton });
    return this;
  }

  resolve(name) {
    const reg = this.#registrations.get(name);
    if (!reg) throw new Error(`Not registered: \${name}`);

    if (reg.singleton) {
      if (!this.#singletons.has(name)) {
        this.#singletons.set(name, reg.factory(this));
      }
      return this.#singletons.get(name);
    }
    return reg.factory(this);
  }
}

// Usage
class Logger {
  log(msg) { console.log(`[LOG] \${msg}`); }
}

class UserService {
  constructor(logger, db) {
    this.logger = logger;
    this.db = db;
  }
  createUser(name) {
    this.logger.log(`Creating \${name}`);
    return { id: Date.now(), name };
  }
}

const container = new Container();
container.register("logger", () => new Logger(), { singleton: true });
container.register("db", () => ({ query: (q) => console.log(`SQL: \${q}`) }));
container.register("userService", (c) =>
  new UserService(c.resolve("logger"), c.resolve("db"))
);

const svc = container.resolve("userService");
svc.createUser("Alice");'''..language='javascript'..difficulty='very_hard'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_033'..topicId='javascript'..title='Promise.withResolvers & Advanced Patterns'..description='Advanced Promise patterns including deferred, retry with backoff, and concurrent limiting.'..code='''// Retry with exponential backoff
async function retryWithBackoff(fn, maxRetries = 3, baseDelay = 100) {
  for (let attempt = 0; attempt <= maxRetries; attempt++) {
    try {
      return await fn();
    } catch (error) {
      if (attempt === maxRetries) throw error;
      const delay = baseDelay * Math.pow(2, attempt);
      console.log(`Retry \${attempt + 1} in \${delay}ms`);
      await new Promise(r => setTimeout(r, delay));
    }
  }
}

// Concurrent limiter
class ConcurrencyLimiter {
  #running = 0;
  #queue = [];

  constructor(limit) { this.limit = limit; }

  async run(fn) {
    while (this.#running >= this.limit) {
      await new Promise(resolve => this.#queue.push(resolve));
    }
    this.#running++;
    try {
      return await fn();
    } finally {
      this.#running--;
      this.#queue.shift()?.();
    }
  }
}

// Usage
const limiter = new ConcurrencyLimiter(3);
const tasks = Array.from({ length: 10 }, (_, i) =>
  limiter.run(async () => {
    console.log(`Task \${i} started`);
    await new Promise(r => setTimeout(r, 100));
    console.log(`Task \${i} done`);
    return i;
  })
);
Promise.all(tasks).then(r => console.log("All done:", r));'''..language='javascript'..difficulty='very_hard'..section='Async Programming'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_034'..topicId='javascript'..title='Reactive State Management'..description='Build a minimal reactive state management system with computed values and subscribers.'..code='''function createStore(initialState) {
  let state = structuredClone(initialState);
  const listeners = new Set();
  const computed = new Map();

  function getState() { return structuredClone(state); }

  function setState(updater) {
    const newState = typeof updater === "function"
      ? updater(structuredClone(state))
      : updater;
    state = { ...state, ...newState };
    notify();
  }

  function subscribe(listener) {
    listeners.add(listener);
    return () => listeners.delete(listener);
  }

  function addComputed(name, selector) {
    computed.set(name, selector);
  }

  function getComputed(name) {
    const selector = computed.get(name);
    return selector ? selector(state) : undefined;
  }

  function notify() {
    const snapshot = getState();
    listeners.forEach(fn => fn(snapshot));
  }

  return { getState, setState, subscribe, addComputed, getComputed };
}

const store = createStore({ count: 0, items: [] });
store.addComputed("doubleCount", s => s.count * 2);
store.subscribe(s => console.log("State:", s));
store.setState(s => ({ count: s.count + 1 }));
console.log(store.getComputed("doubleCount")); // 2'''..language='javascript'..difficulty='very_hard'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_035'..topicId='javascript'..title='Metaprogramming with Proxy Traps'..description='Use all Proxy handler traps to create a fully observable, validated, and logged object wrapper.'..code='''function createTraced(target, name = "obj") {
  return new Proxy(target, {
    get(target, prop, receiver) {
      console.log(`GET \${name}.\${String(prop)}`);
      const value = Reflect.get(target, prop, receiver);
      if (typeof value === "object" && value !== null) {
        return createTraced(value, `\${name}.\${String(prop)}`);
      }
      return value;
    },
    set(target, prop, value) {
      console.log(`SET \${name}.\${String(prop)} = \${JSON.stringify(value)}`);
      return Reflect.set(target, prop, value);
    },
    deleteProperty(target, prop) {
      console.log(`DELETE \${name}.\${String(prop)}`);
      return Reflect.deleteProperty(target, prop);
    },
    has(target, prop) {
      console.log(`HAS \${name}.\${String(prop)}`);
      return Reflect.has(target, prop);
    },
    apply(target, thisArg, args) {
      console.log(`CALL \${name}(\${args.join(", ")})`);
      return Reflect.apply(target, thisArg, args);
    }
  });
}

const data = createTraced({
  user: { name: "Alice", age: 30 },
  scores: [10, 20, 30]
});

data.user.name;          // GET obj.user, GET obj.user.name
data.user.age = 31;      // SET obj.user.age = 31
"name" in data.user;     // HAS obj.user.name'''..language='javascript'..difficulty='very_hard'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_036'..topicId='javascript'..title='Custom Async Iterator with Backpressure'..description='Implement backpressure-aware async iteration using pull-based data flow.'..code='''class AsyncQueue {
  #queue = [];
  #resolvers = [];
  #done = false;

  push(value) {
    if (this.#resolvers.length > 0) {
      const resolve = this.#resolvers.shift();
      resolve({ value, done: false });
    } else {
      this.#queue.push(value);
    }
  }

  close() {
    this.#done = true;
    for (const resolve of this.#resolvers) {
      resolve({ value: undefined, done: true });
    }
    this.#resolvers = [];
  }

  [Symbol.asyncIterator]() {
    return {
      next: () => {
        if (this.#queue.length > 0) {
          return Promise.resolve({
            value: this.#queue.shift(), done: false
          });
        }
        if (this.#done) {
          return Promise.resolve({ done: true });
        }
        return new Promise(resolve => this.#resolvers.push(resolve));
      }
    };
  }
}

async function main() {
  const queue = new AsyncQueue();
  // Producer
  setTimeout(() => {
    for (let i = 0; i < 5; i++) queue.push(i);
    queue.close();
  }, 10);
  // Consumer
  for await (const item of queue) {
    console.log("Got:", item);
  }
}
main();'''..language='javascript'..difficulty='very_hard'..section='Async Programming'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_037'..topicId='javascript'..title='Virtual DOM Implementation'..description='Build a minimal virtual DOM with createElement, diff, and patch functions.'..code='''function createElement(type, props = {}, ...children) {
  return { type, props, children: children.flat() };
}

function render(vNode) {
  if (typeof vNode === "string") return document.createTextNode(vNode);
  const el = document.createElement(vNode.type);
  for (const [key, value] of Object.entries(vNode.props)) {
    if (key.startsWith("on")) {
      el.addEventListener(key.slice(2).toLowerCase(), value);
    } else {
      el.setAttribute(key, value);
    }
  }
  vNode.children.forEach(child => el.appendChild(render(child)));
  return el;
}

function diff(oldNode, newNode) {
  if (!oldNode) return { type: "CREATE", newNode };
  if (!newNode) return { type: "REMOVE" };
  if (typeof oldNode !== typeof newNode ||
      (typeof oldNode === "string" && oldNode !== newNode) ||
      oldNode.type !== newNode.type) {
    return { type: "REPLACE", newNode };
  }
  if (oldNode.type) {
    return {
      type: "UPDATE",
      props: diffProps(oldNode.props, newNode.props),
      children: diffChildren(oldNode.children, newNode.children)
    };
  }
  return null;
}

function diffProps(oldP, newP) {
  const patches = [];
  for (const [k, v] of Object.entries(newP)) {
    if (oldP[k] !== v) patches.push({ key: k, value: v });
  }
  return patches;
}

function diffChildren(oldC, newC) {
  return newC.map((child, i) => diff(oldC[i], child));
}'''..language='javascript'..difficulty='very_hard'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_038'..topicId='javascript'..title='SharedArrayBuffer & Atomics'..description='Share memory between threads using SharedArrayBuffer with atomic operations for thread-safe access.'..code='''// Main thread
const buffer = new SharedArrayBuffer(1024);
const view = new Int32Array(buffer);

// Atomics operations
Atomics.store(view, 0, 42);
console.log(Atomics.load(view, 0)); // 42

// Atomic add (thread-safe increment)
Atomics.add(view, 0, 8);
console.log(Atomics.load(view, 0)); // 50

// Compare and swap
const old = Atomics.compareExchange(view, 0, 50, 100);
console.log(old); // 50 (previous value)
console.log(Atomics.load(view, 0)); // 100

// Mutex implementation using Atomics
class AtomicLock {
  constructor(sab, index = 0) {
    this.view = new Int32Array(sab);
    this.index = index;
  }
  lock() {
    while (Atomics.compareExchange(this.view, this.index, 0, 1) !== 0) {
      Atomics.wait(this.view, this.index, 1);
    }
  }
  unlock() {
    Atomics.store(this.view, this.index, 0);
    Atomics.notify(this.view, this.index, 1);
  }
}

// Usage in worker:
// const lock = new AtomicLock(sharedBuffer);
// lock.lock();
// // critical section
// lock.unlock();'''..language='javascript'..difficulty='very_hard'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_039'..topicId='javascript'..title='FinalizationRegistry & Weak References'..description='Track object garbage collection with FinalizationRegistry and create weak references with WeakRef.'..code='''class ResourceManager {
  #registry;
  #resources = new Map();

  constructor() {
    this.#registry = new FinalizationRegistry(key => {
      console.log(`GC collected resource: \${key}`);
      this.#resources.delete(key);
    });
  }

  create(key, resource) {
    const ref = new WeakRef(resource);
    this.#resources.set(key, ref);
    this.#registry.register(resource, key);
    return resource;
  }

  get(key) {
    const ref = this.#resources.get(key);
    if (!ref) return undefined;
    const obj = ref.deref();
    if (!obj) {
      this.#resources.delete(key);
      return undefined;
    }
    return obj;
  }

  get size() {
    let count = 0;
    for (const [key, ref] of this.#resources) {
      if (ref.deref()) count++;
      else this.#resources.delete(key);
    }
    return count;
  }
}

const manager = new ResourceManager();

let bigData = { data: new Array(10000).fill("x") };
manager.create("dataset1", bigData);
console.log("Before:", manager.size);
bigData = null; // Allow GC
// After GC runs: "GC collected resource: dataset1"'''..language='javascript'..difficulty='very_hard'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_040'..topicId='javascript'..title='Compile-time Type Guards (JSDoc)'..description='Use JSDoc annotations for TypeScript-like type checking in plain JavaScript with VS Code support.'..code='''/**
 * @typedef {Object} User
 * @property {number} id
 * @property {string} name
 * @property {string} email
 * @property {"admin" | "user" | "guest"} role
 */

/**
 * @template T
 * @typedef {Object} Result
 * @property {boolean} success
 * @property {T} [data]
 * @property {string} [error]
 */

/**
 * Creates a success result
 * @template T
 * @param {T} data
 * @returns {Result<T>}
 */
function ok(data) {
  return { success: true, data };
}

/**
 * Creates a failure result
 * @param {string} error
 * @returns {Result<never>}
 */
function err(error) {
  return { success: false, error };
}

/**
 * @param {number} id
 * @returns {Promise<Result<User>>}
 */
async function getUser(id) {
  if (id <= 0) return err("Invalid ID");
  return ok({ id, name: "Alice", email: "a@b.com", role: "admin" });
}

getUser(1).then(result => {
  if (result.success) console.log(result.data.name);
  else console.error(result.error);
});'''..language='javascript'..difficulty='very_hard'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,

    // —— Professional & Modern APIs (10) ——
    Snippet()..snippetId='js_041'..topicId='javascript'..title='Intl.NumberFormat'..description='Format numbers and currencies based on locale and options.'..code='''// Currency formatting
const amount = 123456.78;
const usd = new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" });
const eur = new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" });

console.log(usd.format(amount)); // "$123,456.78"
console.log(eur.format(amount)); // "123.456,78 €"

// Unit formatting
const weight = new Intl.NumberFormat("en-US", {
  style: "unit",
  unit: "kilogram",
  unitDisplay: "long"
});
console.log(weight.format(5.5)); // "5.5 kilograms"

// Compact notation
const views = new Intl.NumberFormat("en-US", { notation: "compact" });
console.log(views.format(1200000)); // "1.2M"'''..language='javascript'..difficulty='medium'..section='Standard Library'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_042'..topicId='javascript'..title='Intl.RelativeTimeFormat'..description='Format time differences into human-readable strings like "2 days ago".'..code='''const rtf = new Intl.RelativeTimeFormat("en", { numeric: "auto" });

console.log(rtf.format(-1, "day"));    // "yesterday"
console.log(rtf.format(1, "day"));     // "tomorrow"
console.log(rtf.format(-3, "week"));   // "3 weeks ago"
console.log(rtf.format(10, "second")); // "in 10 seconds"

// Practical usage
function getRelativeTime(epoch) {
  const diff = epoch - Date.now();
  const days = Math.round(diff / (1000 * 60 * 60 * 24));
  return rtf.format(days, "day");
}

console.log(getRelativeTime(Date.now() - 432000000)); // "5 days ago"'''..language='javascript'..difficulty='medium'..section='Standard Library'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_043'..topicId='javascript'..title='Intersection Observer'..description='Efficiently detect when elements enter or exit the viewport for lazy-loading or animations.'..code='''const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      console.log("Element visible:", entry.target.id);
      entry.target.classList.add("fade-in");
      // Stop observing after firing once
      observer.unobserve(entry.target);
    }
  });
}, { threshold: 0.5 }); // 50% visibility trigger

// Observe images
document.querySelectorAll("img[data-src]").forEach(img => {
  observer.observe(img);
});

// Polyfill-like detection
if (!("IntersectionObserver" in window)) {
  console.log("IntersectionObserver not supported");
}'''..language='javascript'..difficulty='medium'..section='Web APIs'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_044'..topicId='javascript'..title='BroadcastChannel API'..description='Simple tab-to-tab or window-to-window communication on the same origin.'..code='''// Tab 1
const channel = new BroadcastChannel("auth_events");

function login() {
  channel.postMessage({ type: "LOGIN", user: "Alice" });
}

// Tab 2
const receiver = new BroadcastChannel("auth_events");
receiver.onmessage = (event) => {
  if (event.data.type === "LOGIN") {
    console.log("User logged in on another tab:", event.data.user);
    // Sync UI or reload state
    location.reload();
  }
};

// Cleanup
// channel.close();'''..language='javascript'..difficulty='medium'..section='Web APIs'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_045'..topicId='javascript'..title='Resize Observer'..description='Monitor size changes of specific DOM elements, independent of viewport resize.'..code='''const textarea = document.querySelector("textarea");
const output = document.querySelector(".size-info");

const resizeObserver = new ResizeObserver(entries => {
  for (const entry of entries) {
    const { width, height } = entry.contentRect;
    output.textContent = `Size: \${Math.round(width)}x\${Math.round(height)}`;
    
    if (width < 300) {
      entry.target.classList.add("compact");
    } else {
      entry.target.classList.remove("compact");
    }
  }
});

resizeObserver.observe(textarea);'''..language='javascript'..difficulty='medium'..section='Web APIs'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_046'..topicId='javascript'..title='URLSearchParams'..description='Easy manipulation of URL query parameters without manual string parsing.'..code='''const url = new URL("https://api.example.com/search?q=js&page=1&tags=web,node");

// Get params
console.log(url.searchParams.get("q")); // "js"
console.log(url.searchParams.has("page")); // true

// Modify params
url.searchParams.set("page", "2");
url.searchParams.append("tags", "react");
url.searchParams.delete("q");

console.log(url.toString());
// "https://api.example.com/search?page=2&tags=web%2Cnode&tags=react"

// Iterate
for (const [key, value] of url.searchParams) {
  console.log(`\${key}: \${value}`);
}'''..language='javascript'..difficulty='easy'..section='Standard Library'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_047'..topicId='javascript'..title='Web Crypto API (Hashing)'..description='Generate secure SHA-256 hashes using the browser native SubtleCrypto API.'..code='''async function hashString(message) {
  const encoder = new TextEncoder();
  const data = encoder.encode(message);
  
  // Hash the data
  const hashBuffer = await crypto.subtle.digest("SHA-256", data);
  
  // Convert buffer to hex string
  const hashArray = Array.from(new Uint8Array(hashBuffer));
  const hashHex = hashArray
    .map(b => b.toString(16).padStart(2, "0"))
    .join("");
    
  return hashHex;
}

hashString("hello world").then(h => console.log("SHA-256:", h));'''..language='javascript'..difficulty='hard'..section='Web APIs'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_048'..topicId='javascript'..title='Permissions API'..description='Query the status of user-granted permissions for features like geolocation or notification.'..code='''async function checkLocationPermission() {
  try {
    const result = await navigator.permissions.query({ name: "geolocation" });
    
    console.log("Status:", result.state); // "granted", "denied", or "prompt"
    
    result.onchange = () => {
      console.log("Permission changed to:", result.state);
    };
    
    if (result.state === "granted") {
      // safe to call navigator.geolocation
    }
  } catch (error) {
    console.error("Permissions API not supported:", error);
  }
}

checkLocationPermission();'''..language='javascript'..difficulty='medium'..section='Web APIs'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_049'..topicId='javascript'..title='Performance API'..description='Measure script execution time and resource loading performance with high precision.'..code='''// Mark start
performance.mark("task-start");

// Simulate heavy task
for (let i = 0; i < 1000000; i++) { Math.sqrt(i); }

// Mark end
performance.mark("task-end");

// Measure between marks
performance.measure("Heavy Task", "task-start", "task-end");

const measure = performance.getEntriesByName("Heavy Task")[0];
console.log(`Task duration: \${measure.duration.toFixed(2)}ms`);

// Clear measurements
performance.clearMarks();
performance.clearMeasures();

// Resource timing
const resources = performance.getEntriesByType("resource");
console.log(`Scripts loaded: \${resources.filter(r => r.initiatorType === "script").length}`);'''..language='javascript'..difficulty='medium'..section='Web APIs'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='js_050'..topicId='javascript'..title='Custom Elements'..description='Create custom HTML tags with lifecycle callbacks and encapsulated logic.'..code='''class UserProfile extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: "open" });
  }

  connectedCallback() {
    const name = this.getAttribute("name") || "Guest";
    this.shadowRoot.innerHTML = `
      <style>
        div { padding: 10px; border: 1px solid #ccc; border-radius: 8px; }
        span { font-weight: bold; color: #3572A5; }
      </style>
      <div>
        Hello, <span>\${name}</span>!
      </div>
    `;
  }

  static get observedAttributes() { return ["name"]; }
  
  attributeChangedCallback(name, oldVal, newVal) {
    if (name === "name" && this.shadowRoot.innerHTML) {
      this.connectedCallback();
    }
  }
}

customElements.define("user-profile", UserProfile);
// Usage: <user-profile name="Alice"></user-profile>'''..language='javascript'..difficulty='hard'..section='Web Components'..isSaved=false..lastViewedAt=null,
  ];
}

