import '../models/snippet.dart';

List<Snippet> getJavaSnippets() {
  return [
    // ── Very Easy (10) ──
    Snippet()..snippetId='java_001'..topicId='java'..title='Hello World'..description='The simplest Java program. Every Java app needs a main method inside a class.'..code='''public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}'''..language='java'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_002'..topicId='java'..title='Variables and Data Types'..description='Java is statically typed. Primitive types include int, double, boolean, char, and their wrapper classes.'..code='''public class Main {
    public static void main(String[] args) {
        int age = 25;
        double price = 19.99;
        boolean isActive = true;
        char grade = 'A';
        String name = "Java";

        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.printf("Price: %.2f%n", price);
        System.out.println("Active: " + isActive);
    }
}'''..language='java'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_003'..topicId='java'..title='Arrays'..description='Arrays are fixed-size containers that store elements of the same type with zero-based indexing.'..code='''import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        int[] numbers = {5, 3, 8, 1, 9, 2};
        String[] fruits = new String[3];
        fruits[0] = "Apple";
        fruits[1] = "Banana";
        fruits[2] = "Cherry";

        System.out.println(Arrays.toString(numbers));
        Arrays.sort(numbers);
        System.out.println("Sorted: " + Arrays.toString(numbers));
        System.out.println("Length: " + numbers.length);

        int index = Arrays.binarySearch(numbers, 8);
        System.out.println("Found 8 at index: " + index);
    }
}'''..language='java'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_004'..topicId='java'..title='If-Else and Switch'..description='Conditional control flow using if-else chains and the enhanced switch expression (Java 14+).'..code='''public class Main {
    public static void main(String[] args) {
        int score = 85;

        // If-else
        String grade;
        if (score >= 90) grade = "A";
        else if (score >= 80) grade = "B";
        else if (score >= 70) grade = "C";
        else grade = "F";
        System.out.println("Grade: " + grade);

        // Switch expression (Java 14+)
        String day = "MONDAY";
        String type = switch (day) {
            case "MONDAY", "TUESDAY", "WEDNESDAY",
                 "THURSDAY", "FRIDAY" -> "Weekday";
            case "SATURDAY", "SUNDAY" -> "Weekend";
            default -> "Unknown";
        };
        System.out.println(day + " is a " + type);
    }
}'''..language='java'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_005'..topicId='java'..title='For Loops'..description='Java supports traditional for loops, enhanced for-each loops, and while/do-while loops.'..code='''import java.util.List;

public class Main {
    public static void main(String[] args) {
        // Traditional for loop
        for (int i = 0; i < 5; i++) {
            System.out.print(i + " ");
        }
        System.out.println();

        // Enhanced for-each
        List<String> colors = List.of("Red", "Green", "Blue");
        for (String color : colors) {
            System.out.println(color);
        }

        // While loop
        int count = 3;
        while (count > 0) {
            System.out.println("Countdown: " + count);
            count--;
        }
    }
}'''..language='java'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_006'..topicId='java'..title='Methods'..description='Methods define reusable blocks of code with parameters, return types, and optional overloading.'..code='''public class Main {
    static int add(int a, int b) {
        return a + b;
    }

    static double add(double a, double b) {
        return a + b;
    }

    static String repeat(String s, int times) {
        return s.repeat(times);
    }

    static void swap(int[] arr, int i, int j) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }

    public static void main(String[] args) {
        System.out.println(add(2, 3));       // 5
        System.out.println(add(2.5, 3.5));   // 6.0
        System.out.println(repeat("Ha", 3)); // HaHaHa
    }
}'''..language='java'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_007'..topicId='java'..title='Classes and Objects'..description='Java classes encapsulate data and behavior. Objects are instances of classes with state and methods.'..code='''public class Person {
    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() { return name; }
    public int getAge() { return age; }

    @Override
    public String toString() {
        return "Person{name='" + name + "', age=" + age + "}";
    }

    public static void main(String[] args) {
        Person p1 = new Person("Alice", 30);
        Person p2 = new Person("Bob", 25);
        System.out.println(p1);
        System.out.println(p2.getName() + " is " + p2.getAge());
    }
}'''..language='java'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_008'..topicId='java'..title='ArrayList and HashMap'..description='ArrayList is a resizable array; HashMap stores key-value pairs. Both are part of java.util collections.'..code='''import java.util.*;

public class Main {
    public static void main(String[] args) {
        // ArrayList
        List<String> names = new ArrayList<>();
        names.add("Alice");
        names.add("Bob");
        names.add("Charlie");
        names.remove("Bob");
        System.out.println("Names: " + names);

        // HashMap
        Map<String, Integer> scores = new HashMap<>();
        scores.put("Alice", 95);
        scores.put("Bob", 87);
        scores.put("Charlie", 92);

        for (Map.Entry<String, Integer> entry : scores.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }

        System.out.println("Bob's score: " + scores.getOrDefault("Bob", 0));
    }
}'''..language='java'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_009'..topicId='java'..title='String Methods'..description='Java String class provides many utility methods for manipulation, searching, and transformation.'..code='''public class Main {
    public static void main(String[] args) {
        String s = "Hello, World!";

        System.out.println(s.length());           // 13
        System.out.println(s.toUpperCase());       // HELLO, WORLD!
        System.out.println(s.substring(7));        // World!
        System.out.println(s.contains("World"));   // true
        System.out.println(s.replace("World", "Java")); // Hello, Java!
        System.out.println(s.indexOf("World"));    // 7

        String csv = "a,b,c,d";
        String[] parts = csv.split(",");
        System.out.println(Arrays.toString(parts));

        String joined = String.join(" - ", parts);
        System.out.println(joined); // a - b - c - d

        // StringBuilder for efficient concatenation
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 5; i++) sb.append(i).append(" ");
        System.out.println(sb.toString().trim());
    }
}'''..language='java'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_010'..topicId='java'..title='Exception Handling'..description='Java exception handling with try-catch-finally blocks for robust error management.'..code='''public class Main {
    static int divide(int a, int b) {
        if (b == 0) throw new ArithmeticException("Division by zero");
        return a / b;
    }

    static int parseNumber(String s) {
        try {
            return Integer.parseInt(s);
        } catch (NumberFormatException e) {
            System.err.println("Invalid number: " + s);
            return 0;
        }
    }

    public static void main(String[] args) {
        try {
            System.out.println(divide(10, 2));  // 5
            System.out.println(divide(10, 0));  // throws
        } catch (ArithmeticException e) {
            System.err.println("Error: " + e.getMessage());
        } finally {
            System.out.println("Done");
        }

        System.out.println(parseNumber("42"));   // 42
        System.out.println(parseNumber("abc"));   // 0
    }
}'''..language='java'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,

    // ── Medium (10) ──
    Snippet()..snippetId='java_011'..topicId='java'..title='Streams API'..description='Java Streams provide functional-style operations on collections: map, filter, reduce, collect.'..code='''import java.util.*;
import java.util.stream.*;

public class Main {
    record Person(String name, int age, String city) {}

    public static void main(String[] args) {
        List<Person> people = List.of(
            new Person("Alice", 30, "Berlin"),
            new Person("Bob", 25, "Paris"),
            new Person("Charlie", 35, "Berlin"),
            new Person("Diana", 28, "Paris")
        );

        // Filter and map
        List<String> berliners = people.stream()
            .filter(p -> p.city().equals("Berlin"))
            .map(Person::name)
            .collect(Collectors.toList());

        // Group by city
        Map<String, List<Person>> byCity = people.stream()
            .collect(Collectors.groupingBy(Person::city));

        // Average age
        double avgAge = people.stream()
            .mapToInt(Person::age)
            .average().orElse(0);

        System.out.println("Berliners: " + berliners);
        System.out.println("By city: " + byCity);
        System.out.printf("Avg age: %.1f%n", avgAge);
    }
}'''..language='java'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_012'..topicId='java'..title='Generics'..description='Generics enable type-safe reusable code with type parameters for classes, interfaces, and methods.'..code='''public class Pair<A, B> {
    private final A first;
    private final B second;

    public Pair(A first, B second) {
        this.first = first;
        this.second = second;
    }

    public A getFirst() { return first; }
    public B getSecond() { return second; }

    // Generic method
    public static <T extends Comparable<T>> T max(T a, T b) {
        return a.compareTo(b) >= 0 ? a : b;
    }

    // Bounded wildcard
    public static double sum(List<? extends Number> list) {
        return list.stream().mapToDouble(Number::doubleValue).sum();
    }

    @Override
    public String toString() {
        return "(" + first + ", " + second + ")";
    }

    public static void main(String[] args) {
        Pair<String, Integer> p = new Pair<>("Alice", 30);
        System.out.println(p);
        System.out.println(max(10, 20));
        System.out.println(sum(List.of(1, 2.5, 3)));
    }
}'''..language='java'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_013'..topicId='java'..title='Interfaces and Abstract Classes'..description='Interfaces define contracts with default methods; abstract classes provide partial implementations.'..code='''interface Drawable {
    void draw();
    default String getType() { return "Shape"; }
}

interface Resizable {
    void resize(double factor);
}

abstract class Shape implements Drawable, Resizable {
    protected double x, y;

    Shape(double x, double y) {
        this.x = x;
        this.y = y;
    }

    abstract double area();
}

class Circle extends Shape {
    private double radius;

    Circle(double x, double y, double radius) {
        super(x, y);
        this.radius = radius;
    }

    @Override public void draw() {
        System.out.printf("Circle at (%.0f,%.0f) r=%.1f%n", x, y, radius);
    }
    @Override public void resize(double factor) { radius *= factor; }
    @Override public double area() { return Math.PI * radius * radius; }
}'''..language='java'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_014'..topicId='java'..title='Records (Java 16+)'..description='Records are immutable data carriers that auto-generate constructor, getters, equals, hashCode, toString.'..code='''import java.util.List;

public class Main {
    record Point(double x, double y) {
        // Compact constructor for validation
        Point {
            if (Double.isNaN(x) || Double.isNaN(y)) {
                throw new IllegalArgumentException("NaN not allowed");
            }
        }

        // Custom method
        double distanceTo(Point other) {
            double dx = this.x - other.x;
            double dy = this.y - other.y;
            return Math.sqrt(dx * dx + dy * dy);
        }
    }

    record Range(int start, int end) {
        Range {
            if (start > end) throw new IllegalArgumentException("start > end");
        }
        boolean contains(int value) { return value >= start && value <= end; }
        int size() { return end - start; }
    }

    public static void main(String[] args) {
        Point p1 = new Point(0, 0);
        Point p2 = new Point(3, 4);
        System.out.println("Distance: " + p1.distanceTo(p2));

        Range r = new Range(1, 10);
        System.out.println("Contains 5: " + r.contains(5));
    }
}'''..language='java'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_015'..topicId='java'..title='Lambda Expressions'..description='Lambdas provide concise syntax for implementing functional interfaces like Predicate, Function, Consumer.'..code='''import java.util.*;
import java.util.function.*;

public class Main {
    public static void main(String[] args) {
        // Predicate
        Predicate<String> isLong = s -> s.length() > 5;
        System.out.println(isLong.test("Hello")); // false

        // Function composition
        Function<Integer, Integer> doubleIt = x -> x * 2;
        Function<Integer, Integer> addTen = x -> x + 10;
        Function<Integer, Integer> doubleThenAdd = doubleIt.andThen(addTen);
        System.out.println(doubleThenAdd.apply(5)); // 20

        // Consumer
        Consumer<String> printer = System.out::println;
        List.of("A", "B", "C").forEach(printer);

        // Supplier
        Supplier<List<String>> listFactory = ArrayList::new;
        List<String> newList = listFactory.get();

        // Comparator
        List<String> words = new ArrayList<>(List.of("banana", "apple", "cherry"));
        words.sort(Comparator.comparingInt(String::length).thenComparing(Comparator.naturalOrder()));
        System.out.println(words);
    }
}'''..language='java'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_016'..topicId='java'..title='Optional'..description='Optional prevents NullPointerException by wrapping nullable values with safe access methods.'..code='''import java.util.Optional;

public class Main {
    record User(String name, String email) {}

    static Optional<User> findUser(String name) {
        if ("Alice".equals(name)) {
            return Optional.of(new User("Alice", "alice@mail.com"));
        }
        return Optional.empty();
    }

    public static void main(String[] args) {
        // Basic usage
        Optional<User> user = findUser("Alice");
        user.ifPresent(u -> System.out.println("Found: " + u.name()));

        // OrElse / OrElseGet
        String email = findUser("Bob")
            .map(User::email)
            .orElse("not found");
        System.out.println("Email: " + email);

        // Chaining
        String result = findUser("Alice")
            .filter(u -> u.email().contains("@"))
            .map(u -> u.name().toUpperCase())
            .orElseThrow(() -> new RuntimeException("No valid user"));
        System.out.println("Result: " + result);
    }
}'''..language='java'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_017'..topicId='java'..title='Enum with Methods'..description='Java enums can have fields, constructors, and methods making them powerful type-safe constants.'..code='''public enum Planet {
    MERCURY(3.303e+23, 2.4397e6),
    VENUS(4.869e+24, 6.0518e6),
    EARTH(5.976e+24, 6.37814e6),
    MARS(6.421e+23, 3.3972e6);

    private final double mass;
    private final double radius;
    private static final double G = 6.67300E-11;

    Planet(double mass, double radius) {
        this.mass = mass;
        this.radius = radius;
    }

    double surfaceGravity() {
        return G * mass / (radius * radius);
    }

    double surfaceWeight(double otherMass) {
        return otherMass * surfaceGravity();
    }

    public static void main(String[] args) {
        double earthWeight = 75.0;
        double mass = earthWeight / EARTH.surfaceGravity();
        for (Planet p : values()) {
            System.out.printf("Weight on %s: %.2f N%n",
                p, p.surfaceWeight(mass));
        }
    }
}'''..language='java'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_018'..topicId='java'..title='Iterator Pattern'..description='Implement Iterable interface to allow objects to be used in enhanced for loops.'..code='''import java.util.Iterator;
import java.util.NoSuchElementException;

public class NumberRange implements Iterable<Integer> {
    private final int start;
    private final int end;

    public NumberRange(int start, int end) {
        this.start = start;
        this.end = end;
    }

    @Override
    public Iterator<Integer> iterator() {
        return new Iterator<>() {
            private int current = start;

            @Override
            public boolean hasNext() { return current <= end; }

            @Override
            public Integer next() {
                if (!hasNext()) throw new NoSuchElementException();
                return current++;
            }
        };
    }

    public static void main(String[] args) {
        NumberRange range = new NumberRange(1, 5);
        for (int n : range) {
            System.out.print(n + " "); // 1 2 3 4 5
        }
    }
}'''..language='java'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_019'..topicId='java'..title='Try-With-Resources'..description='Automatically closes resources implementing AutoCloseable when leaving the try block.'..code='''import java.io.*;
import java.nio.file.*;
import java.util.List;

public class Main {
    // Custom AutoCloseable
    static class DatabaseConnection implements AutoCloseable {
        String url;
        DatabaseConnection(String url) {
            this.url = url;
            System.out.println("Connected to " + url);
        }
        String query(String sql) { return "Result for: " + sql; }
        @Override
        public void close() {
            System.out.println("Disconnected from " + url);
        }
    }

    public static void main(String[] args) throws IOException {
        // File writing
        Path path = Path.of("test.txt");
        try (var writer = Files.newBufferedWriter(path)) {
            writer.write("Hello, Java!");
        }

        // File reading
        try (var reader = Files.newBufferedReader(path)) {
            System.out.println(reader.readLine());
        }

        // Custom resource
        try (var db = new DatabaseConnection("localhost:5432")) {
            System.out.println(db.query("SELECT 1"));
        } // auto-closed here
    }
}'''..language='java'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_020'..topicId='java'..title='Collections Utility Methods'..description='Collections class provides algorithms: sort, shuffle, min, max, frequency, unmodifiable wrappers.'..code='''import java.util.*;

public class Main {
    public static void main(String[] args) {
        List<Integer> nums = new ArrayList<>(List.of(5, 3, 8, 1, 9, 2));

        Collections.sort(nums);
        System.out.println("Sorted: " + nums);

        Collections.reverse(nums);
        System.out.println("Reversed: " + nums);

        Collections.shuffle(nums);
        System.out.println("Shuffled: " + nums);

        System.out.println("Min: " + Collections.min(nums));
        System.out.println("Max: " + Collections.max(nums));

        List<String> words = List.of("a", "b", "a", "c", "a");
        System.out.println("Freq of 'a': " + Collections.frequency(words, "a"));

        // Unmodifiable
        List<String> readOnly = Collections.unmodifiableList(new ArrayList<>(words));
        // readOnly.add("d"); // throws UnsupportedOperationException

        // Synchronized
        List<String> syncList = Collections.synchronizedList(new ArrayList<>());
        syncList.add("thread-safe");
    }
}'''..language='java'..difficulty='medium'..isSaved=false..lastViewedAt=null,

    // ── Hard (10) ──
    Snippet()..snippetId='java_021'..topicId='java'..title='CompletableFuture'..description='CompletableFuture enables non-blocking async programming with composable stages and combinators.'..code='''import java.util.concurrent.*;

public class Main {
    static CompletableFuture<String> fetchUser(int id) {
        return CompletableFuture.supplyAsync(() -> {
            sleep(100);
            return "User_" + id;
        });
    }

    static CompletableFuture<Integer> fetchScore(String user) {
        return CompletableFuture.supplyAsync(() -> {
            sleep(100);
            return user.hashCode() % 100;
        });
    }

    static void sleep(long ms) {
        try { Thread.sleep(ms); } catch (InterruptedException e) {}
    }

    public static void main(String[] args) throws Exception {
        // Chain: fetch user then score
        fetchUser(1)
            .thenCompose(Main::fetchScore)
            .thenAccept(score -> System.out.println("Score: " + score))
            .join();

        // Combine two futures
        var user = fetchUser(1);
        var score = fetchUser(2);
        user.thenCombine(score, (u1, u2) -> u1 + " & " + u2)
            .thenAccept(System.out::println)
            .join();

        // All of
        var futures = CompletableFuture.allOf(
            fetchUser(1), fetchUser(2), fetchUser(3)
        );
        futures.join();
        System.out.println("All fetched");
    }
}'''..language='java'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_022'..topicId='java'..title='Concurrent Collections'..description='Thread-safe collections: ConcurrentHashMap, CopyOnWriteArrayList, BlockingQueue for concurrent access.'..code='''import java.util.concurrent.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws Exception {
        // ConcurrentHashMap - thread-safe map
        ConcurrentMap<String, Integer> map = new ConcurrentHashMap<>();
        map.put("a", 1);
        map.computeIfAbsent("b", k -> 2);
        map.merge("a", 10, Integer::sum); // a = 11
        System.out.println(map);

        // BlockingQueue - producer/consumer
        BlockingQueue<String> queue = new LinkedBlockingQueue<>(5);
        Thread producer = new Thread(() -> {
            for (int i = 0; i < 5; i++) {
                try {
                    queue.put("Item-" + i);
                    System.out.println("Produced: Item-" + i);
                } catch (InterruptedException e) { break; }
            }
        });
        Thread consumer = new Thread(() -> {
            for (int i = 0; i < 5; i++) {
                try {
                    String item = queue.take();
                    System.out.println("Consumed: " + item);
                } catch (InterruptedException e) { break; }
            }
        });
        producer.start();
        consumer.start();
        producer.join();
        consumer.join();
    }
}'''..language='java'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_023'..topicId='java'..title='Design Pattern: Builder'..description='Builder pattern constructs complex objects step-by-step with a fluent API.'..code='''public class HttpRequest {
    private final String method;
    private final String url;
    private final Map<String, String> headers;
    private final String body;
    private final int timeout;

    private HttpRequest(Builder builder) {
        this.method = builder.method;
        this.url = builder.url;
        this.headers = Map.copyOf(builder.headers);
        this.body = builder.body;
        this.timeout = builder.timeout;
    }

    @Override
    public String toString() {
        return method + " " + url + " headers=" + headers;
    }

    static class Builder {
        private String method = "GET";
        private final String url;
        private final Map<String, String> headers = new HashMap<>();
        private String body;
        private int timeout = 30000;

        Builder(String url) { this.url = url; }
        Builder method(String m) { method = m; return this; }
        Builder header(String k, String v) { headers.put(k, v); return this; }
        Builder body(String b) { body = b; return this; }
        Builder timeout(int t) { timeout = t; return this; }
        HttpRequest build() { return new HttpRequest(this); }
    }

    public static void main(String[] args) {
        HttpRequest req = new HttpRequest.Builder("https://api.example.com")
            .method("POST")
            .header("Content-Type", "application/json")
            .body("{"name":"Alice"}")
            .timeout(5000)
            .build();
        System.out.println(req);
    }
}'''..language='java'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_024'..topicId='java'..title='Sealed Classes (Java 17+)'..description='Sealed classes restrict which classes can extend them, enabling exhaustive pattern matching.'..code='''public sealed interface Shape permits Circle, Rectangle, Triangle {
    double area();
}

record Circle(double radius) implements Shape {
    public double area() { return Math.PI * radius * radius; }
}

record Rectangle(double width, double height) implements Shape {
    public double area() { return width * height; }
}

record Triangle(double base, double height) implements Shape {
    public double area() { return 0.5 * base * height; }
}

public class Main {
    static String describe(Shape shape) {
        return switch (shape) {
            case Circle c -> "Circle with radius " + c.radius();
            case Rectangle r -> "Rectangle " + r.width() + "x" + r.height();
            case Triangle t -> "Triangle base=" + t.base();
        };
    }

    public static void main(String[] args) {
        List<Shape> shapes = List.of(
            new Circle(5), new Rectangle(4, 6), new Triangle(3, 8)
        );
        shapes.forEach(s ->
            System.out.printf("%s -> area=%.2f%n", describe(s), s.area())
        );
    }
}'''..language='java'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_025'..topicId='java'..title='Reflection'..description='Java Reflection API allows runtime inspection and manipulation of classes, methods, and fields.'..code='''import java.lang.reflect.*;

public class Main {
    static class Secret {
        private String password = "hidden123";
        private int code = 42;
        private String getSecret() { return "Top Secret: " + password; }
    }

    public static void main(String[] args) throws Exception {
        Secret obj = new Secret();
        Class<?> clazz = obj.getClass();

        // List all fields
        System.out.println("Fields:");
        for (Field f : clazz.getDeclaredFields()) {
            f.setAccessible(true);
            System.out.printf("  %s %s = %s%n",
                f.getType().getSimpleName(), f.getName(), f.get(obj));
        }

        // Access private method
        Method m = clazz.getDeclaredMethod("getSecret");
        m.setAccessible(true);
        System.out.println("Method result: " + m.invoke(obj));

        // Modify private field
        Field f = clazz.getDeclaredField("password");
        f.setAccessible(true);
        f.set(obj, "changed!");
        System.out.println("After change: " + m.invoke(obj));
    }
}'''..language='java'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_026'..topicId='java'..title='Custom Annotations'..description='Define and process custom annotations at runtime using reflection for metadata-driven programming.'..code='''import java.lang.annotation.*;
import java.lang.reflect.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@interface Test {
    String description() default "";
    int priority() default 0;
}

class TestRunner {
    @Test(description = "Addition test", priority = 1)
    void testAdd() {
        assert 2 + 2 == 4 : "Addition failed";
        System.out.println("  PASS: testAdd");
    }

    @Test(description = "String test", priority = 2)
    void testString() {
        assert "hello".length() == 5 : "Length failed";
        System.out.println("  PASS: testString");
    }

    void notATest() {
        System.out.println("Skipped");
    }

    public static void main(String[] args) throws Exception {
        TestRunner runner = new TestRunner();
        Method[] methods = runner.getClass().getDeclaredMethods();
        for (Method m : methods) {
            if (m.isAnnotationPresent(Test.class)) {
                Test t = m.getAnnotation(Test.class);
                System.out.printf("Running: %s (priority=%d)%n", t.description(), t.priority());
                m.invoke(runner);
            }
        }
    }
}'''..language='java'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_027'..topicId='java'..title='Virtual Threads (Java 21)'..description='Virtual threads enable millions of lightweight threads for highly concurrent I/O-bound applications.'..code='''import java.util.concurrent.*;
import java.time.*;

public class Main {
    static String fetchUrl(String url) {
        try { Thread.sleep(100); } catch (Exception e) {}
        return "Data from " + url;
    }

    public static void main(String[] args) throws Exception {
        // Create virtual threads
        var start = Instant.now();

        try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
            var futures = new java.util.ArrayList<Future<String>>();
            for (int i = 0; i < 1000; i++) {
                final int id = i;
                futures.add(executor.submit(() ->
                    fetchUrl("https://api.example.com/" + id)
                ));
            }
            int count = 0;
            for (var f : futures) {
                f.get(); // wait for each
                count++;
            }
            System.out.println("Completed: " + count);
        }

        var elapsed = Duration.between(start, Instant.now());
        System.out.println("Time: " + elapsed.toMillis() + "ms");
        // ~100ms for 1000 requests (not 100,000ms)
    }
}'''..language='java'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_028'..topicId='java'..title='Pattern Matching (Java 21)'..description='Pattern matching with switch and instanceof for concise type-safe conditional logic.'..code='''public class Main {
    sealed interface Expr permits Num, Add, Mul {}
    record Num(int value) implements Expr {}
    record Add(Expr left, Expr right) implements Expr {}
    record Mul(Expr left, Expr right) implements Expr {}

    static int eval(Expr expr) {
        return switch (expr) {
            case Num(var v) -> v;
            case Add(var l, var r) -> eval(l) + eval(r);
            case Mul(var l, var r) -> eval(l) * eval(r);
        };
    }

    static String format(Object obj) {
        return switch (obj) {
            case Integer i when i > 0 -> "positive: " + i;
            case Integer i -> "non-positive: " + i;
            case String s when s.length() > 5 -> "long string";
            case String s -> "short: " + s;
            case null -> "null value";
            default -> obj.toString();
        };
    }

    public static void main(String[] args) {
        Expr expr = new Add(new Num(3), new Mul(new Num(4), new Num(5)));
        System.out.println("Result: " + eval(expr)); // 23
        System.out.println(format(42));
        System.out.println(format("Hi"));
    }
}'''..language='java'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_029'..topicId='java'..title='ExecutorService & Thread Pool'..description='ExecutorService manages thread pools for submitting and executing tasks concurrently.'..code='''import java.util.concurrent.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws Exception {
        ExecutorService pool = Executors.newFixedThreadPool(4);

        // Submit callable tasks
        List<Future<String>> futures = new ArrayList<>();
        for (int i = 0; i < 8; i++) {
            final int taskId = i;
            futures.add(pool.submit(() -> {
                Thread.sleep(100);
                return "Task-" + taskId + " on " +
                    Thread.currentThread().getName();
            }));
        }

        // Collect results
        for (Future<String> f : futures) {
            System.out.println(f.get());
        }

        // Scheduled executor
        ScheduledExecutorService scheduler =
            Executors.newScheduledThreadPool(1);
        scheduler.scheduleAtFixedRate(
            () -> System.out.println("Tick: " + System.currentTimeMillis()),
            0, 500, TimeUnit.MILLISECONDS
        );
        Thread.sleep(2000);

        pool.shutdown();
        scheduler.shutdown();
    }
}'''..language='java'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_030'..topicId='java'..title='Proxy and InvocationHandler'..description='Dynamic proxies create interface implementations at runtime for AOP, logging, and caching.'..code='''import java.lang.reflect.*;

interface UserService {
    String findUser(int id);
    void deleteUser(int id);
}

class UserServiceImpl implements UserService {
    public String findUser(int id) { return "User_" + id; }
    public void deleteUser(int id) {
        System.out.println("Deleted user " + id);
    }
}

class LoggingHandler implements InvocationHandler {
    private final Object target;

    LoggingHandler(Object target) { this.target = target; }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args)
            throws Throwable {
        System.out.printf("[LOG] %s(%s)%n", method.getName(),
            args != null ? java.util.Arrays.toString(args) : "");
        long start = System.nanoTime();
        Object result = method.invoke(target, args);
        long elapsed = (System.nanoTime() - start) / 1_000_000;
        System.out.printf("[LOG] %s returned in %dms%n",
            method.getName(), elapsed);
        return result;
    }
}

public class Main {
    public static void main(String[] args) {
        UserService real = new UserServiceImpl();
        UserService proxy = (UserService) Proxy.newProxyInstance(
            UserService.class.getClassLoader(),
            new Class[]{UserService.class},
            new LoggingHandler(real)
        );
        System.out.println(proxy.findUser(42));
        proxy.deleteUser(1);
    }
}'''..language='java'..difficulty='hard'..isSaved=false..lastViewedAt=null,

    // ── Very Hard (10) ──
    Snippet()..snippetId='java_031'..topicId='java'..title='Custom ClassLoader'..description='ClassLoaders control how classes are loaded. Custom loaders enable hot-reloading and sandboxing.'..code='''import java.io.*;

public class HotReloadClassLoader extends ClassLoader {
    private final String classPath;

    public HotReloadClassLoader(String classPath, ClassLoader parent) {
        super(parent);
        this.classPath = classPath;
    }

    @Override
    protected Class<?> findClass(String name) throws ClassNotFoundException {
        String path = classPath + "/" + name.replace('.', '/') + ".class";
        try (InputStream is = new FileInputStream(path)) {
            byte[] bytes = is.readAllBytes();
            return defineClass(name, bytes, 0, bytes.length);
        } catch (IOException e) {
            throw new ClassNotFoundException(name, e);
        }
    }

    public static void main(String[] args) throws Exception {
        // Each reload creates a new ClassLoader, getting fresh class
        ClassLoader loader1 = new HotReloadClassLoader("./classes",
            ClassLoader.getSystemClassLoader());
        ClassLoader loader2 = new HotReloadClassLoader("./classes",
            ClassLoader.getSystemClassLoader());

        // Classes loaded by different loaders are different
        // even if from the same .class file
        System.out.println("Different loaders = different classes");
        System.out.println("Loader1: " + loader1);
        System.out.println("Loader2: " + loader2);
    }
}'''..language='java'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_032'..topicId='java'..title='Unsafe Memory Access'..description='sun.misc.Unsafe provides low-level memory operations bypassing JVM safety checks for performance-critical code.'..code='''import sun.misc.Unsafe;
import java.lang.reflect.Field;

public class Main {
    static Unsafe getUnsafe() throws Exception {
        Field f = Unsafe.class.getDeclaredField("theUnsafe");
        f.setAccessible(true);
        return (Unsafe) f.get(null);
    }

    static class Account {
        private long balance = 100;
    }

    public static void main(String[] args) throws Exception {
        Unsafe unsafe = getUnsafe();

        // Create instance without constructor
        Account acc = (Account) unsafe.allocateInstance(Account.class);
        System.out.println("Balance (no ctor): " + acc.balance); // 0

        // Direct field access by offset
        long offset = unsafe.objectFieldOffset(
            Account.class.getDeclaredField("balance")
        );
        unsafe.putLong(acc, offset, 500L);
        System.out.println("After putLong: " + acc.balance);

        // Compare-and-swap (CAS)
        boolean swapped = unsafe.compareAndSwapLong(acc, offset, 500L, 1000L);
        System.out.println("CAS success: " + swapped + ", val: " + acc.balance);

        // Off-heap memory
        long addr = unsafe.allocateMemory(8);
        unsafe.putLong(addr, 42L);
        System.out.println("Off-heap: " + unsafe.getLong(addr));
        unsafe.freeMemory(addr);
    }
}'''..language='java'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_033'..topicId='java'..title='JVM Garbage Collection Tuning'..description='Understanding GC behavior with weak/soft/phantom references and finalization alternatives.'..code='''import java.lang.ref.*;
import java.util.*;

public class Main {
    static class HeavyObject {
        byte[] data = new byte[1024 * 1024]; // 1MB
        String name;
        HeavyObject(String name) { this.name = name; }
    }

    public static void main(String[] args) {
        // Strong reference - never GC'd while reachable
        HeavyObject strong = new HeavyObject("strong");

        // Weak reference - GC'd at next collection
        WeakReference<HeavyObject> weak =
            new WeakReference<>(new HeavyObject("weak"));

        // Soft reference - GC'd only under memory pressure
        SoftReference<HeavyObject> soft =
            new SoftReference<>(new HeavyObject("soft"));

        // Phantom reference - for cleanup after GC
        ReferenceQueue<HeavyObject> queue = new ReferenceQueue<>();
        PhantomReference<HeavyObject> phantom =
            new PhantomReference<>(new HeavyObject("phantom"), queue);

        System.out.println("Before GC:");
        System.out.println("  Weak: " + (weak.get() != null));
        System.out.println("  Soft: " + (soft.get() != null));

        System.gc();

        System.out.println("After GC:");
        System.out.println("  Weak: " + (weak.get() != null));   // likely false
        System.out.println("  Soft: " + (soft.get() != null));   // likely true

        // Cleaner (modern replacement for finalize)
        var cleaner = java.lang.ref.Cleaner.create();
        var obj = new Object();
        cleaner.register(obj, () -> System.out.println("Cleaned up!"));
    }
}'''..language='java'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_034'..topicId='java'..title='Structured Concurrency (Java 21)'..description='Structured concurrency ensures child tasks complete before parent, preventing resource leaks.'..code='''import java.util.concurrent.*;

public class Main {
    record User(String name) {}
    record Order(int id, String item) {}

    static User fetchUser() throws InterruptedException {
        Thread.sleep(100);
        return new User("Alice");
    }

    static Order fetchOrder() throws InterruptedException {
        Thread.sleep(150);
        return new Order(1, "Laptop");
    }

    static String buildResponse() throws Exception {
        try (var scope = new StructuredTaskScope.ShutdownOnFailure()) {
            var userTask = scope.fork(Main::fetchUser);
            var orderTask = scope.fork(Main::fetchOrder);

            scope.join();           // Wait for both
            scope.throwIfFailed();  // Propagate errors

            User user = userTask.get();
            Order order = orderTask.get();

            return user.name() + " ordered " + order.item();
        }
    }

    public static void main(String[] args) throws Exception {
        String result = buildResponse();
        System.out.println(result); // Alice ordered Laptop
    }
}'''..language='java'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_035'..topicId='java'..title='MethodHandle vs Reflection'..description='MethodHandles are faster than reflection for dynamic method invocation with JIT optimization.'..code='''import java.lang.invoke.*;

public class Main {
    public static String greet(String name) {
        return "Hello, " + name + "!";
    }

    public int add(int a, int b) {
        return a + b;
    }

    public static void main(String[] args) throws Throwable {
        MethodHandles.Lookup lookup = MethodHandles.lookup();

        // Static method handle
        MethodHandle greetHandle = lookup.findStatic(
            Main.class, "greet",
            MethodType.methodType(String.class, String.class)
        );
        String result = (String) greetHandle.invoke("World");
        System.out.println(result);

        // Instance method handle
        MethodHandle addHandle = lookup.findVirtual(
            Main.class, "add",
            MethodType.methodType(int.class, int.class, int.class)
        );
        int sum = (int) addHandle.invoke(new Main(), 5, 3);
        System.out.println("Sum: " + sum);

        // Field access
        MethodHandle getter = lookup.findGetter(
            String.class, "value", byte[].class
        );

        // Performance comparison
        long start = System.nanoTime();
        for (int i = 0; i < 1_000_000; i++) {
            greetHandle.invoke("test");
        }
        System.out.println("MethodHandle: " +
            (System.nanoTime() - start) / 1_000_000 + "ms");
    }
}'''..language='java'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_036'..topicId='java'..title='Annotation Processor Simulation'..description='Simulate compile-time annotation processing to generate code based on annotations.'..code='''import java.lang.annotation.*;
import java.lang.reflect.*;
import java.util.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@interface Entity { String table() default ""; }

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
@interface Column { String name() default ""; boolean nullable() default true; }

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
@interface Id {}

@Entity(table = "users")
class User {
    @Id @Column(name = "user_id") int id;
    @Column(name = "user_name", nullable = false) String name;
    @Column String email;
}

class SqlGenerator {
    static String createTable(Class<?> clazz) {
        Entity entity = clazz.getAnnotation(Entity.class);
        String table = entity.table().isEmpty() ? clazz.getSimpleName().toLowerCase() : entity.table();
        List<String> columns = new ArrayList<>();
        for (Field f : clazz.getDeclaredFields()) {
            Column col = f.getAnnotation(Column.class);
            if (col == null) continue;
            String colName = col.name().isEmpty() ? f.getName() : col.name();
            String type = mapType(f.getType());
            String constraints = f.isAnnotationPresent(Id.class) ? " PRIMARY KEY" : "";
            if (!col.nullable()) constraints += " NOT NULL";
            columns.add(colName + " " + type + constraints);
        }
        return "CREATE TABLE " + table + " (\\n  " + String.join(",\\n  ", columns) + "\\n);";
    }
    static String mapType(Class<?> t) {
        if (t == int.class || t == Integer.class) return "INTEGER";
        if (t == String.class) return "TEXT";
        return "BLOB";
    }
}

public class Main {
    public static void main(String[] args) {
        System.out.println(SqlGenerator.createTable(User.class));
    }
}'''..language='java'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_037'..topicId='java'..title='Lock-Free Data Structure'..description='Implement a lock-free stack using AtomicReference and CAS for high-performance concurrent access.'..code='''import java.util.concurrent.atomic.AtomicReference;

public class LockFreeStack<T> {
    private static class Node<T> {
        final T value;
        final Node<T> next;
        Node(T value, Node<T> next) {
            this.value = value;
            this.next = next;
        }
    }

    private final AtomicReference<Node<T>> top = new AtomicReference<>();

    public void push(T value) {
        Node<T> newNode = new Node<>(value, null);
        while (true) {
            Node<T> current = top.get();
            newNode = new Node<>(value, current);
            if (top.compareAndSet(current, newNode)) return;
            // CAS failed, retry with updated top
        }
    }

    public T pop() {
        while (true) {
            Node<T> current = top.get();
            if (current == null) return null;
            if (top.compareAndSet(current, current.next)) {
                return current.value;
            }
        }
    }

    public static void main(String[] args) throws Exception {
        LockFreeStack<Integer> stack = new LockFreeStack<>();
        // Concurrent push from multiple threads
        Thread[] threads = new Thread[4];
        for (int t = 0; t < 4; t++) {
            final int offset = t * 100;
            threads[t] = new Thread(() -> {
                for (int i = 0; i < 100; i++) stack.push(offset + i);
            });
            threads[t].start();
        }
        for (Thread th : threads) th.join();
        int count = 0;
        while (stack.pop() != null) count++;
        System.out.println("Total popped: " + count); // 400
    }
}'''..language='java'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_038'..topicId='java'..title='Memory-Mapped Files'..description='Use MappedByteBuffer for high-performance file I/O by mapping files directly into memory.'..code='''import java.io.*;
import java.nio.*;
import java.nio.channels.*;
import java.nio.file.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Path path = Path.of("mmap_test.dat");

        // Write using memory-mapped file
        try (FileChannel ch = FileChannel.open(path,
                StandardOpenOption.CREATE,
                StandardOpenOption.READ,
                StandardOpenOption.WRITE)) {
            MappedByteBuffer buf = ch.map(
                FileChannel.MapMode.READ_WRITE, 0, 1024);

            // Write structured data
            buf.putInt(42);              // 4 bytes
            buf.putDouble(3.14159);      // 8 bytes
            buf.put("Hello MMap!".getBytes()); // 11 bytes
        }

        // Read using memory-mapped file
        try (FileChannel ch = FileChannel.open(path, StandardOpenOption.READ)) {
            MappedByteBuffer buf = ch.map(
                FileChannel.MapMode.READ_ONLY, 0, ch.size());

            int intVal = buf.getInt();
            double dblVal = buf.getDouble();
            byte[] strBytes = new byte[11];
            buf.get(strBytes);

            System.out.println("Int: " + intVal);
            System.out.printf("Double: %.5f%n", dblVal);
            System.out.println("String: " + new String(strBytes));
        }

        Files.delete(path);
    }
}'''..language='java'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_039'..topicId='java'..title='Service Provider Interface (SPI)'..description='SPI enables plugin architectures via ServiceLoader for runtime discovery of implementations.'..code='''import java.util.*;

// Define service interface
interface MessageEncoder {
    String encode(String message);
    String name();
}

// Implementation 1
class Base64Encoder implements MessageEncoder {
    public String encode(String msg) {
        return Base64.getEncoder().encodeToString(msg.getBytes());
    }
    public String name() { return "Base64"; }
}

// Implementation 2
class ReverseEncoder implements MessageEncoder {
    public String encode(String msg) {
        return new StringBuilder(msg).reverse().toString();
    }
    public String name() { return "Reverse"; }
}

// Discovery and usage
public class Main {
    static List<MessageEncoder> loadEncoders() {
        // In real SPI: ServiceLoader.load(MessageEncoder.class)
        // For demo, manual registration:
        return List.of(new Base64Encoder(), new ReverseEncoder());
    }

    public static void main(String[] args) {
        String message = "Hello, SPI!";
        for (MessageEncoder encoder : loadEncoders()) {
            System.out.printf("[%s] %s -> %s%n",
                encoder.name(), message, encoder.encode(message));
        }
    }
}'''..language='java'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='java_040'..topicId='java'..title='Foreign Function & Memory API (Java 21)'..description='The Foreign Function & Memory API provides safe, efficient access to native code and off-heap memory.'..code='''import java.lang.foreign.*;
import java.lang.invoke.MethodHandle;

public class Main {
    public static void main(String[] args) throws Throwable {
        // Arena manages memory lifecycle
        try (Arena arena = Arena.ofConfined()) {
            // Allocate off-heap memory
            MemorySegment segment = arena.allocate(
                ValueLayout.JAVA_INT, 10); // array of 10 ints

            // Write values
            for (int i = 0; i < 10; i++) {
                segment.setAtIndex(ValueLayout.JAVA_INT, i, i * i);
            }

            // Read values
            System.out.print("Squares: ");
            for (int i = 0; i < 10; i++) {
                System.out.print(segment.getAtIndex(
                    ValueLayout.JAVA_INT, i) + " ");
            }
            System.out.println();

            // Allocate string
            MemorySegment str = arena.allocateFrom("Hello, FFM!");
            System.out.println("String: " + str.getString(0));

            // Struct-like layout
            StructLayout pointLayout = MemoryLayout.structLayout(
                ValueLayout.JAVA_DOUBLE.withName("x"),
                ValueLayout.JAVA_DOUBLE.withName("y")
            );
            MemorySegment point = arena.allocate(pointLayout);
            point.set(ValueLayout.JAVA_DOUBLE, 0, 3.0);  // x
            point.set(ValueLayout.JAVA_DOUBLE, 8, 4.0);  // y
            System.out.printf("Point: (%.1f, %.1f)%n",
                point.get(ValueLayout.JAVA_DOUBLE, 0),
                point.get(ValueLayout.JAVA_DOUBLE, 8));
        } // All off-heap memory freed here
    }
}'''..language='java'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
  ];
}
