import '../models/snippet.dart';

List<Snippet> getRustSnippets() {
  return [
    Snippet()..snippetId='rust_001'..topicId='rust'..title='Hello World'..description='Rust programs start from fn main(). println! is a macro for formatted console output.'..code='''fn main() {
    println!("Hello, World!");
}'''..language='rust'..difficulty='very_easy'..section='Introduction to Rust'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_002'..topicId='rust'..title='Variables and Mutability'..description='Variables are immutable by default. Use mut for mutability. let supports type inference and shadowing.'..code='''fn main() {
    let name = "Rust";           // immutable
    let mut age = 7;             // mutable
    let pi: f64 = 3.14159;
    let active = true;

    println!("{name}, age {age}");
    age += 1;
    println!("Now age {age}");

    // Shadowing
    let x = 5;
    let x = x + 1;
    let x = x * 2;
    println!("x = {x}");
}'''..language='rust'..difficulty='very_easy'..section='Data Types and Variables'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_003'..topicId='rust'..title='Ownership and Borrowing'..description='Rust ownership rules: each value has one owner, values are dropped when owner goes out of scope.'..code='''fn main() {
    // Ownership transfer (move)
    let s1 = String::from("hello");
    let s2 = s1;  // s1 is moved, no longer valid
    println!("{s2}");

    // Clone for deep copy
    let s3 = s2.clone();
    println!("{s2} and {s3}");

    // Borrowing (immutable reference)
    let len = calculate_length(&s3);
    println!("Length of '{s3}': {len}");

    // Mutable reference
    let mut s = String::from("hello");
    change(&mut s);
    println!("{s}");
}

fn calculate_length(s: &String) -> usize {
    s.len()
}
fn change(s: &mut String) {
    s.push_str(", world!");
}'''..language='rust'..difficulty='very_easy'..section='Data Types and Variables'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_004'..topicId='rust'..title='Structs'..description='Structs group related data. impl blocks add methods. Derive macros auto-generate common traits.'..code='''#[derive(Debug)]
struct Point {
    x: f64,
    y: f64,
}

impl Point {
    fn new(x: f64, y: f64) -> Self {
        Point { x, y }
    }
    fn distance(&self, other: &Point) -> f64 {
        ((self.x - other.x).powi(2) +
         (self.y - other.y).powi(2)).sqrt()
    }
}

fn main() {
    let p1 = Point::new(0.0, 0.0);
    let p2 = Point::new(3.0, 4.0);
    println!("Distance: {:.2}", p1.distance(&p2));
    println!("{:?}", p1);
}'''..language='rust'..difficulty='very_easy'..section='Conditional Expressions'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_005'..topicId='rust'..title='Enums and Pattern Matching'..description='Rust enums can hold data. Match expressions must be exhaustive, covering all variants.'..code='''enum Shape {
    Circle(f64),
    Rectangle(f64, f64),
    Triangle(f64, f64),
}

impl Shape {
    fn area(&self) -> f64 {
        match self {
            Shape::Circle(r) => std::f64::consts::PI * r * r,
            Shape::Rectangle(w, h) => w * h,
            Shape::Triangle(b, h) => 0.5 * b * h,
        }
    }
}

fn main() {
    let shapes = vec![
        Shape::Circle(5.0),
        Shape::Rectangle(4.0, 6.0),
        Shape::Triangle(3.0, 8.0),
    ];
    for s in &shapes {
        println!("Area: {:.2}", s.area());
    }
}'''..language='rust'..difficulty='very_easy'..section='Conditional Expressions'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_006'..topicId='rust'..title='Vectors'..description='Vec<T> is a growable array type. Supports push, pop, indexing, iteration, and slicing.'..code='''fn main() {
    let mut nums = vec![1, 2, 3, 4, 5];
    nums.push(6);
    nums.insert(0, 0);

    println!("First: {}", nums[0]);
    println!("Last: {}", nums.last().unwrap());
    println!("Length: {}", nums.len());

    // Iteration
    let doubled: Vec<i32> = nums.iter()
        .map(|x| x * 2)
        .collect();
    println!("Doubled: {:?}", doubled);

    // Filter
    let evens: Vec<&i32> = nums.iter()
        .filter(|x| *x % 2 == 0)
        .collect();
    println!("Evens: {:?}", evens);
}'''..language='rust'..difficulty='very_easy'..section='Functions'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_007'..topicId='rust'..title='String Types'..description='Rust has two string types: String (owned, growable) and &str (borrowed slice). Both are UTF-8.'..code='''fn main() {
    let s = String::from("Hello, World!");
    let slice: &str = &s[0..5];
    println!("{slice}");

    // String methods
    println!("Len: {}", s.len());
    println!("Upper: {}", s.to_uppercase());
    println!("Contains: {}", s.contains("World"));

    let replaced = s.replace("World", "Rust");
    println!("{replaced}");

    // Split and join
    let parts: Vec<&str> = "a,b,c,d".split(',').collect();
    let joined = parts.join(" - ");
    println!("{joined}");

    // Format
    let name = "Rust";
    let greeting = format!("Hello, {name}!");
    println!("{greeting}");
}'''..language='rust'..difficulty='very_easy'..section='Structs and Enums'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_008'..topicId='rust'..title='Option and Result'..description='Option<T> handles nullable values. Result<T, E> handles operations that can fail. No null or exceptions.'..code='''fn divide(a: f64, b: f64) -> Result<f64, String> {
    if b == 0.0 {
        Err("Division by zero".to_string())
    } else {
        Ok(a / b)
    }
}

fn find_first_even(nums: &[i32]) -> Option<i32> {
    nums.iter().find(|&&x| x % 2 == 0).copied()
}

fn main() {
    // Result handling
    match divide(10.0, 3.0) {
        Ok(result) => println!("Result: {result:.2}"),
        Err(e) => println!("Error: {e}"),
    }

    // Option handling
    let nums = vec![1, 3, 5, 4, 7];
    match find_first_even(&nums) {
        Some(n) => println!("First even: {n}"),
        None => println!("No evens found"),
    }

    // Unwrap with default
    let val = find_first_even(&[1, 3, 5]).unwrap_or(0);
    println!("Default: {val}");
}'''..language='rust'..difficulty='very_easy'..section='Collections'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_009'..topicId='rust'..title='Control Flow'..description='Rust supports if/else expressions, loop, while, for-in, and if-let for pattern matching.'..code='''fn main() {
    // If as expression
    let x = 5;
    let label = if x > 3 { "big" } else { "small" };
    println!("{x} is {label}");

    // Loop with break value
    let mut counter = 0;
    let result = loop {
        counter += 1;
        if counter == 10 { break counter * 2; }
    };
    println!("Loop result: {result}");

    // For range
    for i in 0..5 {
        print!("{i} ");
    }
    println!();

    // If let
    let some_val: Option<i32> = Some(42);
    if let Some(v) = some_val {
        println!("Got: {v}");
    }
}'''..language='rust'..difficulty='very_easy'..section='Data Types and Variables'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_010'..topicId='rust'..title='HashMaps'..description='HashMap stores key-value pairs with O(1) average lookup. Keys must implement Hash and Eq traits.'..code='''use std::collections::HashMap;

fn main() {
    let mut scores = HashMap::new();
    scores.insert("Alice", 95);
    scores.insert("Bob", 87);
    scores.insert("Charlie", 92);

    // Access
    if let Some(score) = scores.get("Alice") {
        println!("Alice: {score}");
    }

    // Entry API
    scores.entry("Diana").or_insert(88);
    *scores.entry("Bob").or_insert(0) += 5;

    // Iteration
    for (name, score) in &scores {
        println!("{name}: {score}");
    }

    // Word count
    let text = "hello world hello rust hello";
    let mut freq = HashMap::new();
    for word in text.split_whitespace() {
        *freq.entry(word).or_insert(0) += 1;
    }
    println!("{:?}", freq);
}'''..language='rust'..difficulty='very_easy'..section='Error Handling'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_011'..topicId='rust'..title='Traits'..description='Traits define shared behavior. Types implement traits explicitly. Trait bounds constrain generics.'..code='''use std::fmt;

trait Summary {
    fn summarize(&self) -> String;
    fn preview(&self) -> String {
        format!("{}...", &self.summarize()[..20.min(self.summarize().len())])
    }
}

struct Article {
    title: String,
    content: String,
}

impl Summary for Article {
    fn summarize(&self) -> String {
        format!("{}: {}", self.title, self.content)
    }
}

impl fmt::Display for Article {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "[{}]", self.title)
    }
}

fn notify(item: &impl Summary) {
    println!("Breaking: {}", item.summarize());
}

fn main() {
    let a = Article {
        title: "Rust 2024".into(),
        content: "Great year for Rust".into(),
    };
    notify(&a);
    println!("{a}");
}'''..language='rust'..difficulty='medium'..section='Ownership and Borrowing'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_012'..topicId='rust'..title='Generics'..description='Generics enable writing code that works with multiple types while maintaining type safety.'..code='''fn largest<T: PartialOrd>(list: &[T]) -> &T {
    let mut max = &list[0];
    for item in &list[1..] {
        if item > max { max = item; }
    }
    max
}

struct Pair<T> {
    first: T,
    second: T,
}

impl<T: std::fmt::Display + PartialOrd> Pair<T> {
    fn new(first: T, second: T) -> Self {
        Pair { first, second }
    }
    fn larger(&self) -> &T {
        if self.first >= self.second {
            &self.first
        } else {
            &self.second
        }
    }
}

fn main() {
    let nums = vec![34, 50, 25, 100, 65];
    println!("Largest: {}", largest(&nums));

    let strs = vec!["hello", "world"];
    println!("Largest: {}", largest(&strs));

    let p = Pair::new(10, 20);
    println!("Larger: {}", p.larger());
}'''..language='rust'..difficulty='medium'..section='Traits'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_013'..topicId='rust'..title='Error Handling with ?'..description='The ? operator propagates errors concisely. Custom error types with thiserror or manual impl.'..code='''use std::fmt;
use std::num::ParseIntError;

#[derive(Debug)]
enum AppError {
    Parse(ParseIntError),
    Validation(String),
}
impl fmt::Display for AppError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            AppError::Parse(e) => write!(f, "Parse error: {e}"),
            AppError::Validation(msg) => write!(f, "Validation: {msg}"),
        }
    }
}
impl From<ParseIntError> for AppError {
    fn from(e: ParseIntError) -> Self { AppError::Parse(e) }
}

fn parse_age(input: &str) -> Result<u32, AppError> {
    let age: u32 = input.parse()?;  // auto-converts error
    if age > 150 {
        return Err(AppError::Validation("Too old".into()));
    }
    Ok(age)
}

fn main() {
    match parse_age("25") {
        Ok(age) => println!("Age: {age}"),
        Err(e) => println!("Error: {e}"),
    }
    match parse_age("abc") {
        Ok(age) => println!("Age: {age}"),
        Err(e) => println!("Error: {e}"),
    }
}'''..language='rust'..difficulty='medium'..section='Functions'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_014'..topicId='rust'..title='Closures'..description='Closures capture variables from their environment. They can be Fn, FnMut, or FnOnce.'..code='''fn apply<F: Fn(i32) -> i32>(f: F, x: i32) -> i32 {
    f(x)
}

fn make_adder(n: i32) -> impl Fn(i32) -> i32 {
    move |x| x + n
}

fn main() {
    let double = |x| x * 2;
    println!("{}", apply(double, 5));

    let add5 = make_adder(5);
    println!("{}", add5(10));

    // Closure capturing
    let mut nums = vec![1, 2, 3];
    let mut push = |n| nums.push(n);
    push(4);
    push(5);
    println!("{:?}", nums);

    // Iterator with closures
    let sum: i32 = (1..=10)
        .filter(|x| x % 2 == 0)
        .map(|x| x * x)
        .sum();
    println!("Sum of even squares: {sum}");
}'''..language='rust'..difficulty='medium'..section='Structs and Enums'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_015'..topicId='rust'..title='Iterators'..description='Rust iterators are lazy and composable. The Iterator trait requires implementing next().'..code='''struct Counter {
    count: u32,
    max: u32,
}

impl Counter {
    fn new(max: u32) -> Self {
        Counter { count: 0, max }
    }
}

impl Iterator for Counter {
    type Item = u32;
    fn next(&mut self) -> Option<u32> {
        if self.count < self.max {
            self.count += 1;
            Some(self.count)
        } else {
            None
        }
    }
}

fn main() {
    // Custom iterator
    let sum: u32 = Counter::new(5).sum();
    println!("Sum 1-5: {sum}");

    // Chaining
    let result: Vec<u32> = Counter::new(5)
        .zip(Counter::new(5).skip(1))
        .map(|(a, b)| a * b)
        .collect();
    println!("Products: {:?}", result);

    // Iterator adaptors
    let v = vec![1, 2, 3, 4, 5];
    let chunks: Vec<&[i32]> = v.chunks(2).collect();
    println!("Chunks: {:?}", chunks);
}'''..language='rust'..difficulty='medium'..section='Collections'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_016'..topicId='rust'..title='Lifetimes'..description='Lifetimes prevent dangling references. The borrow checker ensures references are always valid.'..code='''// Lifetime annotation
fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() { x } else { y }
}

// Struct with lifetime
struct Excerpt<'a> {
    text: &'a str,
}

impl<'a> Excerpt<'a> {
    fn level(&self) -> i32 { 3 }
    fn announce(&self, msg: &str) -> &str {
        println!("Attention: {msg}");
        self.text
    }
}

fn main() {
    let s1 = String::from("long string");
    let result;
    {
        let s2 = String::from("xyz");
        result = longest(s1.as_str(), s2.as_str());
        println!("Longest: {result}");
    }

    let novel = String::from("Call me Ishmael. Some years ago...");
    let first = novel.split('.').next().unwrap();
    let excerpt = Excerpt { text: first };
    println!("Excerpt: {}", excerpt.text);
}'''..language='rust'..difficulty='medium'..section='Functions'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_017'..topicId='rust'..title='Smart Pointers'..description='Box, Rc, Arc, RefCell provide heap allocation, reference counting, and interior mutability.'..code='''use std::rc::Rc;
use std::cell::RefCell;

#[derive(Debug)]
struct Node {
    value: i32,
    children: Vec<Rc<RefCell<Node>>>,
}

impl Node {
    fn new(val: i32) -> Rc<RefCell<Node>> {
        Rc::new(RefCell::new(Node {
            value: val,
            children: vec![],
        }))
    }
}

fn main() {
    // Box - heap allocation
    let boxed = Box::new(42);
    println!("Boxed: {boxed}");

    // Rc - shared ownership
    let root = Node::new(1);
    let child1 = Node::new(2);
    let child2 = Node::new(3);

    root.borrow_mut().children.push(Rc::clone(&child1));
    root.borrow_mut().children.push(Rc::clone(&child2));
    child1.borrow_mut().children.push(Node::new(4));

    println!("Root: {:?}", root.borrow().value);
    println!("Children: {}", root.borrow().children.len());
    println!("Rc count: {}", Rc::strong_count(&child1));
}'''..language='rust'..difficulty='medium'..section='Traits'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_018'..topicId='rust'..title='Collections'..description='Rust std collections: Vec, HashMap, HashSet, BTreeMap, VecDeque, LinkedList, BinaryHeap.'..code='''use std::collections::{HashSet, BTreeMap, VecDeque, BinaryHeap};

fn main() {
    // HashSet
    let mut s: HashSet<i32> = [1, 2, 3, 4].into();
    let s2: HashSet<i32> = [3, 4, 5, 6].into();
    println!("Union: {:?}", s.union(&s2).collect::<Vec<_>>());
    println!("Inter: {:?}", s.intersection(&s2).collect::<Vec<_>>());

    // BTreeMap (sorted)
    let mut bt = BTreeMap::new();
    bt.insert("c", 3);
    bt.insert("a", 1);
    bt.insert("b", 2);
    for (k, v) in &bt {
        println!("{k}: {v}");  // sorted by key
    }

    // VecDeque (double-ended queue)
    let mut dq = VecDeque::new();
    dq.push_back(1);
    dq.push_front(0);
    println!("Deque: {:?}", dq);

    // BinaryHeap (max-heap)
    let mut heap = BinaryHeap::from(vec![3, 1, 4, 1, 5]);
    println!("Max: {:?}", heap.pop());
}'''..language='rust'..difficulty='medium'..section='Structs and Enums'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_019'..topicId='rust'..title='Modules and Crates'..description='Modules organize code with mod keyword. pub controls visibility. use brings items into scope.'..code='''mod math {
    pub fn add(a: i32, b: i32) -> i32 { a + b }
    pub fn multiply(a: i32, b: i32) -> i32 { a * b }

    pub mod geometry {
        pub struct Circle {
            pub radius: f64,
        }
        impl Circle {
            pub fn new(r: f64) -> Self { Circle { radius: r } }
            pub fn area(&self) -> f64 {
                std::f64::consts::PI * self.radius.powi(2)
            }
        }
    }
}

mod utils {
    pub fn repeat(s: &str, n: usize) -> String {
        s.repeat(n)
    }
}

use math::geometry::Circle;

fn main() {
    println!("{}", math::add(2, 3));
    let c = Circle::new(5.0);
    println!("Area: {:.2}", c.area());
    println!("{}", utils::repeat("Ha", 3));
}'''..language='rust'..difficulty='medium'..section='Ownership and Borrowing'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_020'..topicId='rust'..title='File I/O'..description='std::fs provides file operations. Read/write with error handling using Result and ? operator.'..code='''use std::fs;
use std::io::{self, BufRead, Write};

fn main() -> io::Result<()> {
    // Write
    fs::write("test.txt", "Hello, Rust!\\nLine 2\\n")?;

    // Read all
    let content = fs::read_to_string("test.txt")?;
    println!("Content:\\n{content}");

    // Read lines
    let file = fs::File::open("test.txt")?;
    let reader = io::BufReader::new(file);
    for (i, line) in reader.lines().enumerate() {
        println!("Line {}: {}", i, line?);
    }

    // Append
    let mut f = fs::OpenOptions::new()
        .append(true).open("test.txt")?;
    writeln!(f, "Appended line")?;

    // Cleanup
    fs::remove_file("test.txt")?;
    Ok(())
}'''..language='rust'..difficulty='medium'..section='Traits'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_021'..topicId='rust'..title='Async/Await'..description='Rust async enables non-blocking I/O with zero-cost futures. Requires a runtime like tokio.'..code='''use std::time::Duration;
// In real code: use tokio;

async fn fetch_data(id: u32) -> String {
    // tokio::time::sleep(Duration::from_millis(100)).await;
    format!("Data-{id}")
}

async fn process() {
    let d1 = fetch_data(1).await;
    let d2 = fetch_data(2).await;
    println!("{d1}, {d2}");
}

// With tokio: #[tokio::main]
fn main() {
    // In real code:
    // let rt = tokio::runtime::Runtime::new().unwrap();
    // rt.block_on(process());
    println!("Async Rust ready!");
    println!("Use tokio or async-std as runtime");
}'''..language='rust'..difficulty='hard'..section='Concurrency'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_022'..topicId='rust'..title='Threads and Channels'..description='std::thread spawns OS threads. mpsc channels enable message passing between threads.'..code='''use std::thread;
use std::sync::mpsc;
use std::time::Duration;

fn main() {
    // Basic thread
    let handle = thread::spawn(|| {
        for i in 1..5 {
            println!("Thread: {i}");
            thread::sleep(Duration::from_millis(50));
        }
    });

    // Channel communication
    let (tx, rx) = mpsc::channel();
    let tx2 = tx.clone();

    thread::spawn(move || {
        tx.send("Hello from thread 1").unwrap();
    });
    thread::spawn(move || {
        tx2.send("Hello from thread 2").unwrap();
    });

    for msg in rx.iter().take(2) {
        println!("Received: {msg}");
    }

    handle.join().unwrap();
}'''..language='rust'..difficulty='hard'..section='Concurrency'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_023'..topicId='rust'..title='Arc and Mutex'..description='Arc enables shared ownership across threads. Mutex provides mutual exclusion for safe mutation.'..code='''use std::sync::{Arc, Mutex};
use std::thread;

fn main() {
    let counter = Arc::new(Mutex::new(0));
    let mut handles = vec![];

    for _ in 0..10 {
        let counter = Arc::clone(&counter);
        let handle = thread::spawn(move || {
            let mut num = counter.lock().unwrap();
            *num += 1;
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!("Counter: {}", *counter.lock().unwrap());
}'''..language='rust'..difficulty='hard'..section='Generics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_024'..topicId='rust'..title='Trait Objects (dyn)'..description='Trait objects enable dynamic dispatch with dyn keyword for runtime polymorphism.'..code='''trait Draw {
    fn draw(&self) -> String;
    fn area(&self) -> f64;
}

struct Circle { radius: f64 }
struct Rect { w: f64, h: f64 }

impl Draw for Circle {
    fn draw(&self) -> String { format!("Circle(r={})", self.radius) }
    fn area(&self) -> f64 { std::f64::consts::PI * self.radius.powi(2) }
}
impl Draw for Rect {
    fn draw(&self) -> String { format!("Rect({}x{})", self.w, self.h) }
    fn area(&self) -> f64 { self.w * self.h }
}

fn largest_shape(shapes: &[Box<dyn Draw>]) -> &dyn Draw {
    let mut max_idx = 0;
    for (i, s) in shapes.iter().enumerate() {
        if s.area() > shapes[max_idx].area() { max_idx = i; }
    }
    shapes[max_idx].as_ref()
}

fn main() {
    let shapes: Vec<Box<dyn Draw>> = vec![
        Box::new(Circle { radius: 5.0 }),
        Box::new(Rect { w: 4.0, h: 6.0 }),
    ];
    for s in &shapes {
        println!("{} area={:.2}", s.draw(), s.area());
    }
    println!("Largest: {}", largest_shape(&shapes).draw());
}'''..language='rust'..difficulty='hard'..section='Structs and Enums'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_025'..topicId='rust'..title='Macros'..description='Declarative macros (macro_rules!) enable metaprogramming with pattern matching on syntax.'..code='''macro_rules! hashmap {
    ( \$( \$key:expr => \$val:expr ),* \$(,)? ) => {{
        let mut map = std::collections::HashMap::new();
        \$( map.insert(\$key, \$val); )*
        map
    }};
}

macro_rules! vec_of_strings {
    ( \$( \$s:expr ),* ) => {
        vec![ \$( String::from(\$s) ),* ]
    };
}

macro_rules! log {
    (\$level:ident, \$(\$arg:tt)*) => {
        println!(
            "[{}] {}:{} {}",
            stringify!(\$level),
            file!(), line!(),
            format!(\$(\$arg)*)
        );
    };
}

fn main() {
    let scores = hashmap!{
        "Alice" => 95,
        "Bob" => 87,
    };
    println!("{:?}", scores);

    let names = vec_of_strings!["hello", "world"];
    println!("{:?}", names);

    log!(INFO, "App started with {} args", 3);
}'''..language='rust'..difficulty='hard'..section='Generics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_026'..topicId='rust'..title='Builder Pattern'..description='Builder pattern constructs complex objects step by step with method chaining and validation.'..code='''#[derive(Debug)]
struct Config {
    host: String,
    port: u16,
    max_conn: u32,
    timeout_ms: u64,
}

struct ConfigBuilder {
    host: String,
    port: u16,
    max_conn: u32,
    timeout_ms: u64,
}

impl ConfigBuilder {
    fn new(host: &str) -> Self {
        ConfigBuilder {
            host: host.into(),
            port: 8080,
            max_conn: 100,
            timeout_ms: 30000,
        }
    }
    fn port(mut self, p: u16) -> Self { self.port = p; self }
    fn max_conn(mut self, n: u32) -> Self { self.max_conn = n; self }
    fn timeout(mut self, ms: u64) -> Self { self.timeout_ms = ms; self }
    fn build(self) -> Result<Config, String> {
        if self.host.is_empty() {
            return Err("Host required".into());
        }
        Ok(Config {
            host: self.host,
            port: self.port,
            max_conn: self.max_conn,
            timeout_ms: self.timeout_ms,
        })
    }
}

fn main() {
    let cfg = ConfigBuilder::new("localhost")
        .port(9090)
        .max_conn(200)
        .build()
        .unwrap();
    println!("{cfg:?}");
}'''..language='rust'..difficulty='hard'..section='Ownership and Borrowing'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_027'..topicId='rust'..title='Async Streams'..description='Async iterators using Stream trait for processing asynchronous sequences of values.'..code='''// Simulated async stream pattern
// Real code uses tokio_stream or futures::Stream

use std::collections::VecDeque;

struct AsyncIter {
    items: VecDeque<i32>,
}

impl AsyncIter {
    fn new(items: Vec<i32>) -> Self {
        AsyncIter { items: items.into() }
    }
    fn next(&mut self) -> Option<i32> {
        self.items.pop_front()
    }
    fn map<F: Fn(i32) -> i32>(self, f: F) -> Vec<i32> {
        self.items.iter().map(|&x| f(x)).collect()
    }
    fn filter<F: Fn(&i32) -> bool>(self, f: F) -> Vec<i32> {
        self.items.iter().filter(|&&ref x| f(x)).copied().collect()
    }
}

fn main() {
    let mut stream = AsyncIter::new(vec![1, 2, 3, 4, 5]);

    // Process items
    while let Some(item) = stream.next() {
        println!("Item: {item}");
    }

    // Map and filter
    let stream2 = AsyncIter::new(vec![1, 2, 3, 4, 5]);
    let squared = stream2.map(|x| x * x);
    println!("Squared: {:?}", squared);
}'''..language='rust'..difficulty='hard'..section='Concurrency'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_028'..topicId='rust'..title='Type State Pattern'..description='Encode state machines in the type system so invalid state transitions are compile-time errors.'..code='''struct Locked;
struct Unlocked;

struct Door<State> {
    _state: std::marker::PhantomData<State>,
    name: String,
}

impl Door<Locked> {
    fn new(name: &str) -> Self {
        println!("Created locked door: {name}");
        Door { _state: std::marker::PhantomData, name: name.into() }
    }
    fn unlock(self) -> Door<Unlocked> {
        println!("Unlocking {}", self.name);
        Door { _state: std::marker::PhantomData, name: self.name }
    }
}

impl Door<Unlocked> {
    fn lock(self) -> Door<Locked> {
        println!("Locking {}", self.name);
        Door { _state: std::marker::PhantomData, name: self.name }
    }
    fn open(&self) {
        println!("Opening {}", self.name);
    }
}

fn main() {
    let door = Door::<Locked>::new("Front");
    // door.open();  // Compile error! Can not open locked door
    let door = door.unlock();
    door.open();  // OK
    let _door = door.lock();
}'''..language='rust'..difficulty='very_hard'..section='Collections'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_029'..topicId='rust'..title='Procedural-Like Macros'..description='Advanced macro patterns for DSLs, variadic functions, and code generation at compile time.'..code='''// Builder macro
macro_rules! builder {
    (\$name:ident { \$( \$field:ident : \$type:ty ),* \$(,)? }) => {
        #[derive(Debug, Default)]
        struct \$name {
            \$( \$field: \$type, )*
        }
        impl \$name {
            fn new() -> Self { Self::default() }
            \$(
                fn \$field(mut self, val: \$type) -> Self {
                    self.\$field = val;
                    self
                }
            )*
        }
    };
}

builder!(Server {
    host: String,
    port: u16,
    workers: u32,
});

// Enum with string conversion
macro_rules! string_enum {
    (\$name:ident { \$( \$variant:ident => \$str:expr ),* \$(,)? }) => {
        #[derive(Debug)]
        enum \$name { \$( \$variant, )* }
        impl \$name {
            fn as_str(&self) -> &str {
                match self { \$( \$name::\$variant => \$str, )* }
            }
        }
    };
}

string_enum!(Color {
    Red => "red",
    Green => "green",
    Blue => "blue",
});

fn main() {
    let s = Server::new()
        .host("localhost".into())
        .port(8080)
        .workers(4);
    println!("{s:?}");
    println!("{}", Color::Red.as_str());
}'''..language='rust'..difficulty='very_hard'..section='Generics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_030'..topicId='rust'..title='Zero-Cost Abstractions'..description='Rust iterators compile to the same machine code as hand-written loops with no runtime overhead.'..code='''fn sum_of_squares_loop(n: u64) -> u64 {
    let mut sum = 0u64;
    for i in 0..n {
        if i % 2 == 0 {
            sum += i * i;
        }
    }
    sum
}

fn sum_of_squares_iter(n: u64) -> u64 {
    (0..n)
        .filter(|x| x % 2 == 0)
        .map(|x| x * x)
        .sum()
}

fn main() {
    let n = 1_000_000;
    let r1 = sum_of_squares_loop(n);
    let r2 = sum_of_squares_iter(n);
    assert_eq!(r1, r2);
    println!("Both produce: {r1}");
    println!("Iterator version compiles to identical assembly!");
}'''..language='rust'..difficulty='very_hard'..section='Concurrency'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_031'..topicId='rust'..title='Pin and Unpin'..description='Pin prevents moving values in memory, essential for self-referential structs and async futures.'..code='''use std::pin::Pin;
use std::marker::PhantomPinned;

struct SelfRef {
    data: String,
    ptr: *const String,
    _pin: PhantomPinned,
}

impl SelfRef {
    fn new(data: &str) -> Pin<Box<Self>> {
        let s = SelfRef {
            data: data.to_string(),
            ptr: std::ptr::null(),
            _pin: PhantomPinned,
        };
        let mut boxed = Box::pin(s);
        let ptr = &boxed.data as *const String;
        unsafe {
            let mut_ref = Pin::as_mut(&mut boxed);
            Pin::get_unchecked_mut(mut_ref).ptr = ptr;
        }
        boxed
    }
    fn get_data(&self) -> &str {
        &self.data
    }
    fn get_ptr_data(&self) -> &str {
        unsafe { &*self.ptr }
    }
}

fn main() {
    let sr = SelfRef::new("Hello Pin!");
    println!("Data: {}", sr.get_data());
    println!("Ptr: {}", sr.get_ptr_data());
}'''..language='rust'..difficulty='very_hard'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_032'..topicId='rust'..title='Custom Iterator Adaptor'..description='Build custom iterator adaptors that compose with the standard iterator chain.'..code='''struct Windows<I: Iterator> {
    iter: I,
    buf: Vec<I::Item>,
    size: usize,
}

impl<I> Iterator for Windows<I>
where I: Iterator, I::Item: Clone {
    type Item = Vec<I::Item>;
    fn next(&mut self) -> Option<Self::Item> {
        if self.buf.len() < self.size {
            while self.buf.len() < self.size {
                match self.iter.next() {
                    Some(item) => self.buf.push(item),
                    None => return None,
                }
            }
            return Some(self.buf.clone());
        }
        match self.iter.next() {
            Some(item) => {
                self.buf.remove(0);
                self.buf.push(item);
                Some(self.buf.clone())
            }
            None => None,
        }
    }
}

trait WindowsExt: Iterator + Sized {
    fn windows(self, size: usize) -> Windows<Self> {
        Windows { iter: self, buf: Vec::new(), size }
    }
}

impl<I: Iterator> WindowsExt for I {}

fn main() {
    let data = vec![1, 2, 3, 4, 5];
    let wins: Vec<Vec<i32>> = data.into_iter().windows(3).collect();
    for w in &wins {
        println!("{:?}", w);
    }
}'''..language='rust'..difficulty='very_hard'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_033'..topicId='rust'..title='Newtype Pattern'..description='Newtypes wrap existing types for type safety, preventing accidental misuse of similar types.'..code='''use std::fmt;

struct Meters(f64);
struct Kilometers(f64);
struct Seconds(f64);

impl Meters {
    fn to_km(&self) -> Kilometers { Kilometers(self.0 / 1000.0) }
}
impl Kilometers {
    fn to_m(&self) -> Meters { Meters(self.0 * 1000.0) }
}

// Speed = distance / time
fn speed(dist: &Kilometers, time: &Seconds) -> f64 {
    dist.0 / time.0 * 3600.0  // km/h
}

impl fmt::Display for Meters {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:.1}m", self.0)
    }
}
impl fmt::Display for Kilometers {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:.1}km", self.0)
    }
}

fn main() {
    let d = Meters(5000.0);
    let km = d.to_km();
    let t = Seconds(3600.0);
    println!("{d} = {km}");
    println!("Speed: {:.1} km/h", speed(&km, &t));
    // speed(&d, &t);  // Compile error! Type mismatch
}'''..language='rust'..difficulty='very_hard'..section='Concurrency'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_034'..topicId='rust'..title='Const Generics'..description='Const generics parameterize types by constant values, enabling fixed-size arrays in generic code.'..code='''#[derive(Debug)]
struct Matrix<const ROWS: usize, const COLS: usize> {
    data: [[f64; COLS]; ROWS],
}

impl<const R: usize, const C: usize> Matrix<R, C> {
    fn new() -> Self {
        Matrix { data: [[0.0; C]; R] }
    }
    fn from_array(data: [[f64; C]; R]) -> Self {
        Matrix { data }
    }
    fn get(&self, r: usize, c: usize) -> f64 {
        self.data[r][c]
    }
    fn set(&mut self, r: usize, c: usize, val: f64) {
        self.data[r][c] = val;
    }
}

impl<const N: usize> Matrix<N, N> {
    fn identity() -> Self {
        let mut m = Self::new();
        for i in 0..N { m.data[i][i] = 1.0; }
        m
    }
}

fn main() {
    let id = Matrix::<3, 3>::identity();
    println!("{:?}", id.data);
    let m = Matrix::from_array([
        [1.0, 2.0],
        [3.0, 4.0],
    ]);
    println!("m[0][1] = {}", m.get(0, 1));
}'''..language='rust'..difficulty='very_hard'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_035'..topicId='rust'..title='GATs (Generic Associated Types)'..description='GATs allow associated types in traits to be generic, enabling lending iterators and async traits.'..code='''trait Container {
    type Item<'a> where Self: 'a;
    fn get(&self, idx: usize) -> Option<Self::Item<'_>>;
    fn len(&self) -> usize;
}

struct StrContainer {
    data: Vec<String>,
}

impl Container for StrContainer {
    type Item<'a> = &'a str;
    fn get(&self, idx: usize) -> Option<&str> {
        self.data.get(idx).map(|s| s.as_str())
    }
    fn len(&self) -> usize { self.data.len() }
}

fn print_all<C: Container>(c: &C) where for<'a> C::Item<'a>: std::fmt::Display {
    for i in 0..c.len() {
        if let Some(item) = c.get(i) {
            println!("  [{i}] {item}");
        }
    }
}

fn main() {
    let c = StrContainer {
        data: vec!["hello".into(), "world".into(), "rust".into()],
    };
    println!("Container ({} items):", c.len());
    print_all(&c);
}'''..language='rust'..difficulty='very_hard'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_036'..topicId='rust'..title='Error Handling Crate Pattern'..description='Production error handling with enum variants, From implementations, and Display for user-friendly messages.'..code='''use std::fmt;
use std::io;
use std::num::ParseIntError;

#[derive(Debug)]
enum AppError {
    Io(io::Error),
    Parse(ParseIntError),
    Config(String),
    NotFound { resource: String, id: u32 },
}

impl fmt::Display for AppError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            AppError::Io(e) => write!(f, "IO error: {e}"),
            AppError::Parse(e) => write!(f, "Parse error: {e}"),
            AppError::Config(msg) => write!(f, "Config: {msg}"),
            AppError::NotFound { resource, id } =>
                write!(f, "{resource} #{id} not found"),
        }
    }
}

impl From<io::Error> for AppError {
    fn from(e: io::Error) -> Self { AppError::Io(e) }
}
impl From<ParseIntError> for AppError {
    fn from(e: ParseIntError) -> Self { AppError::Parse(e) }
}

type Result<T> = std::result::Result<T, AppError>;

fn load_config(path: &str) -> Result<u32> {
    let content = std::fs::read_to_string(path)?;
    let port: u32 = content.trim().parse()?;
    if port == 0 {
        return Err(AppError::Config("Port cannot be 0".into()));
    }
    Ok(port)
}

fn main() {
    match load_config("config.txt") {
        Ok(port) => println!("Port: {port}"),
        Err(e) => println!("Error: {e}"),
    }
}'''..language='rust'..difficulty='very_hard'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='rust_037'..topicId='rust'..title='Unsafe Rust'..description='Unsafe blocks allow raw pointer manipulation, FFI calls, and mutable statics with programmer guarantees.'..code='''fn main() {
    // Raw pointers
    let mut x = 42;
    let r1 = &x as *const i32;
    let r2 = &mut x as *mut i32;

    unsafe {
        println!("r1: {}", *r1);
        *r2 = 100;
        println!("r2: {}", *r2);
    }

    // Unsafe function
    unsafe fn dangerous() -> i32 {
        static mut COUNTER: i32 = 0;
        COUNTER += 1;
        COUNTER
    }

    unsafe {
        println!("Call 1: {}", dangerous());
        println!("Call 2: {}", dangerous());
    }

    // Safe abstraction over unsafe
    fn split_at_mut(slice: &mut [i32], mid: usize)
        -> (&mut [i32], &mut [i32]) {
        let len = slice.len();
        let ptr = slice.as_mut_ptr();
        assert!(mid <= len);
        unsafe {
            (
                std::slice::from_raw_parts_mut(ptr, mid),
                std::slice::from_raw_parts_mut(
                    ptr.add(mid), len - mid),
            )
        }
    }

    let mut v = vec![1, 2, 3, 4, 5];
    let (a, b) = split_at_mut(&mut v, 3);
    println!("{:?} {:?}", a, b);
}'''..language='rust'..difficulty='very_hard'..section='Advanced Topics'..isSaved=false..lastViewedAt=null,
  ];
}
