import '../models/snippet.dart';

List<Snippet> getGoSnippets() {
  return [
    Snippet()..snippetId='go_001'..topicId='go'..title='Hello World'..description='Go programs start with package main and func main(). fmt.Println prints to stdout.'..code='''package main
import "fmt"
func main() {
    fmt.Println("Hello, World!")
}'''..language='go'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_002'..topicId='go'..title='Variables and Types'..description='Go is statically typed with type inference via :=. Basic types: int, float64, string, bool.'..code='''package main
import "fmt"
func main() {
    var name string = "Go"
    age := 14
    pi := 3.14159
    active := true
    fmt.Printf("Name: %s, Age: %d\\n", name, age)
    fmt.Printf("Pi: %.2f, Active: %t\\n", pi, active)
}'''..language='go'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_003'..topicId='go'..title='Arrays and Slices'..description='Arrays have fixed size. Slices are dynamic views backed by arrays with append, len, and cap.'..code='''package main
import "fmt"
func main() {
    arr := [5]int{1, 2, 3, 4, 5}
    fmt.Println("Array:", arr)
    s := []int{10, 20, 30}
    s = append(s, 40, 50)
    fmt.Println("Slice:", s)
    fmt.Println("Len:", len(s), "Cap:", cap(s))
    sub := s[1:3]
    fmt.Println("Sub:", sub)
}'''..language='go'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_004'..topicId='go'..title='If-Else and Switch'..description='Go if statements can include init statements. Switch does not need break and supports multiple matches.'..code='''package main
import "fmt"
func main() {
    score := 85
    if score >= 90 {
        fmt.Println("A")
    } else if score >= 80 {
        fmt.Println("B")
    } else {
        fmt.Println("C")
    }
    day := "Monday"
    switch day {
    case "Monday", "Tuesday", "Wednesday":
        fmt.Println("Weekday")
    case "Saturday", "Sunday":
        fmt.Println("Weekend")
    default:
        fmt.Println("Unknown")
    }
}'''..language='go'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_005'..topicId='go'..title='For Loops'..description='Go has only one loop keyword: for. It covers traditional, while, range-based, and infinite loops.'..code='''package main
import "fmt"
func main() {
    for i := 0; i < 5; i++ {
        fmt.Print(i, " ")
    }
    fmt.Println()
    colors := []string{"Red", "Green", "Blue"}
    for i, c := range colors {
        fmt.Printf("%d: %s\\n", i, c)
    }
    count := 3
    for count > 0 {
        fmt.Println("Count:", count)
        count--
    }
}'''..language='go'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_006'..topicId='go'..title='Functions'..description='Go functions support multiple return values, named returns, and variadic parameters.'..code='''package main
import (
    "fmt"
    "errors"
)
func add(a, b int) int { return a + b }
func divide(a, b float64) (float64, error) {
    if b == 0 {
        return 0, errors.New("division by zero")
    }
    return a / b, nil
}
func sum(nums ...int) int {
    total := 0
    for _, n := range nums {
        total += n
    }
    return total
}
func main() {
    fmt.Println(add(2, 3))
    result, err := divide(10, 3)
    if err != nil {
        fmt.Println("Error:", err)
    } else {
        fmt.Printf("%.2f\\n", result)
    }
    fmt.Println(sum(1, 2, 3, 4, 5))
}'''..language='go'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_007'..topicId='go'..title='Maps'..description='Maps are hash tables in Go. Use make to create, delete to remove keys, and comma-ok idiom to check existence.'..code='''package main
import "fmt"
func main() {
    scores := map[string]int{
        "Alice": 95, "Bob": 87, "Charlie": 92,
    }
    scores["Diana"] = 88
    for name, score := range scores {
        fmt.Printf("%s: %d\\n", name, score)
    }
    if val, ok := scores["Bob"]; ok {
        fmt.Println("Bob:", val)
    }
    delete(scores, "Bob")
    fmt.Println("After delete:", scores)
}'''..language='go'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_008'..topicId='go'..title='Structs'..description='Structs group related data fields. Methods can be defined on struct types with value or pointer receivers.'..code='''package main
import "fmt"
type Person struct {
    Name string
    Age  int
}
func (p Person) Greet() string {
    return fmt.Sprintf("Hi, I am %s, age %d", p.Name, p.Age)
}
func (p *Person) Birthday() {
    p.Age++
}
func main() {
    p := Person{Name: "Alice", Age: 30}
    fmt.Println(p.Greet())
    p.Birthday()
    fmt.Println("After birthday:", p.Age)
}'''..language='go'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_009'..topicId='go'..title='Pointers'..description='Go pointers hold memory addresses. Use & to get address and * to dereference. No pointer arithmetic.'..code='''package main
import "fmt"
func increment(val *int) {
    *val++
}
func main() {
    x := 42
    p := &x
    fmt.Println("Value:", *p)
    fmt.Println("Address:", p)
    increment(&x)
    fmt.Println("After increment:", x)
    y := new(int)
    *y = 100
    fmt.Println("New:", *y)
}'''..language='go'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_010'..topicId='go'..title='Error Handling'..description='Go uses explicit error returns instead of exceptions. Errors are values implementing the error interface.'..code='''package main
import (
    "errors"
    "fmt"
)
type ValidationError struct {
    Field   string
    Message string
}
func (e *ValidationError) Error() string {
    return fmt.Sprintf("%s: %s", e.Field, e.Message)
}
func validateAge(age int) error {
    if age < 0 || age > 150 {
        return &ValidationError{"age", "must be 0-150"}
    }
    return nil
}
func main() {
    if err := validateAge(200); err != nil {
        var ve *ValidationError
        if errors.As(err, &ve) {
            fmt.Printf("Field: %s, Msg: %s\\n", ve.Field, ve.Message)
        }
    }
}'''..language='go'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_011'..topicId='go'..title='Interfaces'..description='Go interfaces are satisfied implicitly. Any type implementing all methods satisfies the interface.'..code='''package main
import (
    "fmt"
    "math"
)
type Shape interface {
    Area() float64
    Perimeter() float64
}
type Circle struct{ Radius float64 }
func (c Circle) Area() float64 { return math.Pi * c.Radius * c.Radius }
func (c Circle) Perimeter() float64 { return 2 * math.Pi * c.Radius }
type Rect struct{ W, H float64 }
func (r Rect) Area() float64 { return r.W * r.H }
func (r Rect) Perimeter() float64 { return 2 * (r.W + r.H) }
func printShape(s Shape) {
    fmt.Printf("Area: %.2f, Perimeter: %.2f\\n", s.Area(), s.Perimeter())
}
func main() {
    printShape(Circle{5})
    printShape(Rect{4, 6})
}'''..language='go'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_012'..topicId='go'..title='Goroutines and Channels'..description='Goroutines are lightweight threads. Channels enable safe communication between goroutines.'..code='''package main
import (
    "fmt"
    "time"
)
func worker(id int, ch chan<- string) {
    time.Sleep(100 * time.Millisecond)
    ch <- fmt.Sprintf("Worker %d done", id)
}
func main() {
    ch := make(chan string, 5)
    for i := 1; i <= 5; i++ {
        go worker(i, ch)
    }
    for i := 0; i < 5; i++ {
        fmt.Println(<-ch)
    }
}'''..language='go'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_013'..topicId='go'..title='Select Statement'..description='Select multiplexes channel operations, allowing a goroutine to wait on multiple channels.'..code='''package main
import (
    "fmt"
    "time"
)
func main() {
    ch1 := make(chan string)
    ch2 := make(chan string)
    go func() {
        time.Sleep(100 * time.Millisecond)
        ch1 <- "one"
    }()
    go func() {
        time.Sleep(200 * time.Millisecond)
        ch2 <- "two"
    }()
    for i := 0; i < 2; i++ {
        select {
        case msg := <-ch1:
            fmt.Println("ch1:", msg)
        case msg := <-ch2:
            fmt.Println("ch2:", msg)
        case <-time.After(500 * time.Millisecond):
            fmt.Println("timeout")
        }
    }
}'''..language='go'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_014'..topicId='go'..title='Defer, Panic, Recover'..description='Defer schedules function calls at return. Panic/recover provide exception-like error handling.'..code='''package main
import "fmt"
func safeDiv(a, b int) (result int, err error) {
    defer func() {
        if r := recover(); r != nil {
            err = fmt.Errorf("recovered: %v", r)
        }
    }()
    if b == 0 {
        panic("division by zero")
    }
    return a / b, nil
}
func fileOp() {
    fmt.Println("Opening file")
    defer fmt.Println("Closing file")
    defer fmt.Println("Flushing buffer")
    fmt.Println("Reading file")
}
func main() {
    fileOp()
    r, err := safeDiv(10, 0)
    if err != nil {
        fmt.Println("Error:", err)
    } else {
        fmt.Println("Result:", r)
    }
}'''..language='go'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_015'..topicId='go'..title='Generics (Go 1.18+)'..description='Go generics enable type-parameterized functions and types with type constraints.'..code='''package main
import (
    "fmt"
    "golang.org/x/exp/constraints"
)
func Max[T constraints.Ordered](a, b T) T {
    if a > b { return a }
    return b
}
type Stack[T any] struct {
    items []T
}
func (s *Stack[T]) Push(v T) { s.items = append(s.items, v) }
func (s *Stack[T]) Pop() (T, bool) {
    if len(s.items) == 0 {
        var zero T
        return zero, false
    }
    v := s.items[len(s.items)-1]
    s.items = s.items[:len(s.items)-1]
    return v, true
}
func Map[T, U any](slice []T, fn func(T) U) []U {
    result := make([]U, len(slice))
    for i, v := range slice {
        result[i] = fn(v)
    }
    return result
}
func main() {
    fmt.Println(Max(10, 20))
    fmt.Println(Max("a", "z"))
    s := &Stack[int]{}
    s.Push(1); s.Push(2); s.Push(3)
    v, _ := s.Pop()
    fmt.Println("Popped:", v)
    doubled := Map([]int{1,2,3}, func(n int) int { return n*2 })
    fmt.Println(doubled)
}'''..language='go'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_016'..topicId='go'..title='JSON Encoding/Decoding'..description='encoding/json marshals structs to JSON and unmarshals JSON to structs using struct tags.'..code='''package main
import (
    "encoding/json"
    "fmt"
)
type User struct {
    Name  string   `json:"name"`
    Age   int      `json:"age"`
    Email string   `json:"email,omitempty"`
    Tags  []string `json:"tags"`
}
func main() {
    u := User{Name: "Alice", Age: 30, Tags: []string{"go", "dev"}}
    data, _ := json.MarshalIndent(u, "", "  ")
    fmt.Println(string(data))
    jsonStr := `{"name":"Bob","age":25,"tags":["rust"]}`
    var u2 User
    json.Unmarshal([]byte(jsonStr), &u2)
    fmt.Printf("%+v\\n", u2)
}'''..language='go'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_017'..topicId='go'..title='HTTP Server'..description='net/http provides a production-ready HTTP server with routing, middleware, and handler functions.'..code='''package main
import (
    "encoding/json"
    "fmt"
    "net/http"
)
func helloHandler(w http.ResponseWriter, r *http.Request) {
    name := r.URL.Query().Get("name")
    if name == "" { name = "World" }
    fmt.Fprintf(w, "Hello, %s!", name)
}
func jsonHandler(w http.ResponseWriter, r *http.Request) {
    data := map[string]interface{}{
        "status": "ok", "code": 200,
    }
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(data)
}
func main() {
    http.HandleFunc("/hello", helloHandler)
    http.HandleFunc("/api", jsonHandler)
    fmt.Println("Server on :8080")
    http.ListenAndServe(":8080", nil)
}'''..language='go'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_018'..topicId='go'..title='String Manipulation'..description='strings package provides functions for searching, replacing, splitting, and transforming strings.'..code='''package main
import (
    "fmt"
    "strings"
)
func main() {
    s := "Hello, World!"
    fmt.Println(strings.ToUpper(s))
    fmt.Println(strings.Contains(s, "World"))
    fmt.Println(strings.Replace(s, "World", "Go", 1))
    fmt.Println(strings.Split("a,b,c,d", ","))
    fmt.Println(strings.Join([]string{"Go","is","fun"}, " "))
    fmt.Println(strings.TrimSpace("  hello  "))
    fmt.Println(strings.HasPrefix(s, "Hello"))
    fmt.Println(strings.Count(s, "l"))
    var b strings.Builder
    for i := 0; i < 5; i++ {
        fmt.Fprintf(&b, "%d ", i)
    }
    fmt.Println(b.String())
}'''..language='go'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_019'..topicId='go'..title='Embedding (Composition)'..description='Go uses struct embedding for composition instead of inheritance. Embedded fields promote their methods.'..code='''package main
import "fmt"
type Logger struct{ Prefix string }
func (l Logger) Log(msg string) {
    fmt.Printf("[%s] %s\\n", l.Prefix, msg)
}
type DB struct {
    Logger
    Host string
}
func (db *DB) Query(sql string) string {
    db.Log("Executing: " + sql)
    return "results"
}
type App struct {
    Logger
    DB *DB
}
func main() {
    db := &DB{Logger: Logger{"DB"}, Host: "localhost"}
    app := App{Logger: Logger{"APP"}, DB: db}
    app.Log("Starting")
    result := app.DB.Query("SELECT 1")
    fmt.Println(result)
}'''..language='go'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_020'..topicId='go'..title='Testing'..description='Go has a built-in testing framework with go test, table-driven tests, and benchmarks.'..code='''package main
import (
    "fmt"
    "testing"
)
func Add(a, b int) int { return a + b }
func Fib(n int) int {
    if n <= 1 { return n }
    return Fib(n-1) + Fib(n-2)
}
// Table-driven test
func TestAdd(t *testing.T) {
    tests := []struct{ a, b, want int }{
        {1, 2, 3}, {0, 0, 0}, {-1, 1, 0},
    }
    for _, tt := range tests {
        got := Add(tt.a, tt.b)
        if got != tt.want {
            t.Errorf("Add(%d,%d)=%d, want %d", tt.a, tt.b, got, tt.want)
        }
    }
}
// Benchmark
func BenchmarkFib(b *testing.B) {
    for i := 0; i < b.N; i++ {
        Fib(20)
    }
}
func main() {
    fmt.Println("Add:", Add(2, 3))
    fmt.Println("Fib(10):", Fib(10))
}'''..language='go'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_021'..topicId='go'..title='Context Package'..description='context.Context carries deadlines, cancellation signals, and request-scoped values across API boundaries.'..code='''package main
import (
    "context"
    "fmt"
    "time"
)
func fetchData(ctx context.Context, id int) (string, error) {
    select {
    case <-time.After(200 * time.Millisecond):
        return fmt.Sprintf("Data-%d", id), nil
    case <-ctx.Done():
        return "", ctx.Err()
    }
}
func main() {
    ctx, cancel := context.WithTimeout(
        context.Background(), 150*time.Millisecond)
    defer cancel()
    result, err := fetchData(ctx, 1)
    if err != nil {
        fmt.Println("Error:", err)
    } else {
        fmt.Println(result)
    }
}'''..language='go'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_022'..topicId='go'..title='Worker Pool Pattern'..description='Worker pools distribute tasks across a fixed number of goroutines using channels for load balancing.'..code='''package main
import (
    "fmt"
    "sync"
)
func worker(id int, jobs <-chan int, results chan<- int, wg *sync.WaitGroup) {
    defer wg.Done()
    for j := range jobs {
        result := j * j
        fmt.Printf("Worker %d: %d^2 = %d\\n", id, j, result)
        results <- result
    }
}
func main() {
    jobs := make(chan int, 100)
    results := make(chan int, 100)
    var wg sync.WaitGroup
    for w := 1; w <= 3; w++ {
        wg.Add(1)
        go worker(w, jobs, results, &wg)
    }
    for j := 1; j <= 9; j++ {
        jobs <- j
    }
    close(jobs)
    go func() { wg.Wait(); close(results) }()
    for r := range results {
        _ = r
    }
}'''..language='go'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_023'..topicId='go'..title='Sync Package'..description='sync provides Mutex, RWMutex, Once, WaitGroup, and Map for concurrent programming primitives.'..code='''package main
import (
    "fmt"
    "sync"
)
func main() {
    var mu sync.RWMutex
    data := map[string]int{}
    var wg sync.WaitGroup
    for i := 0; i < 5; i++ {
        wg.Add(1)
        go func(n int) {
            defer wg.Done()
            mu.Lock()
            data[fmt.Sprintf("key%d", n)] = n * 10
            mu.Unlock()
        }(i)
    }
    wg.Wait()
    mu.RLock()
    for k, v := range data {
        fmt.Printf("%s: %d\\n", k, v)
    }
    mu.RUnlock()
    var once sync.Once
    init := func() { fmt.Println("Init once") }
    once.Do(init)
    once.Do(init) // not called again
}'''..language='go'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_024'..topicId='go'..title='Reflection'..description='reflect package enables runtime type inspection and dynamic value manipulation.'..code='''package main
import (
    "fmt"
    "reflect"
)
type User struct {
    Name  string `json:"name" validate:"required"`
    Age   int    `json:"age" validate:"min=0"`
    Email string `json:"email"`
}
func inspect(v interface{}) {
    t := reflect.TypeOf(v)
    val := reflect.ValueOf(v)
    fmt.Printf("Type: %s\\n", t.Name())
    for i := 0; i < t.NumField(); i++ {
        field := t.Field(i)
        value := val.Field(i)
        tag := field.Tag.Get("json")
        fmt.Printf("  %s (%s) = %v [json:%s]\\n",
            field.Name, field.Type, value, tag)
    }
}
func main() {
    u := User{"Alice", 30, "alice@test.com"}
    inspect(u)
}'''..language='go'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_025'..topicId='go'..title='Error Wrapping'..description='Go 1.13+ error wrapping with fmt.Errorf(%w) enables error chains and unwrapping with errors.Is/As.'..code='''package main
import (
    "errors"
    "fmt"
)
var ErrNotFound = errors.New("not found")
var ErrForbidden = errors.New("forbidden")
type QueryError struct {
    Query string
    Err   error
}
func (e *QueryError) Error() string {
    return fmt.Sprintf("query %q: %v", e.Query, e.Err)
}
func (e *QueryError) Unwrap() error { return e.Err }
func findUser(id int) error {
    if id <= 0 {
        return &QueryError{"SELECT user", ErrNotFound}
    }
    return nil
}
func main() {
    err := findUser(0)
    if errors.Is(err, ErrNotFound) {
        fmt.Println("User not found")
    }
    var qe *QueryError
    if errors.As(err, &qe) {
        fmt.Println("Failed query:", qe.Query)
    }
}'''..language='go'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_026'..topicId='go'..title='Middleware Pattern'..description='HTTP middleware wraps handlers to add cross-cutting concerns like logging, auth, and CORS.'..code='''package main
import (
    "fmt"
    "net/http"
    "time"
)
type Middleware func(http.Handler) http.Handler
func logging(next http.Handler) http.Handler {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        start := time.Now()
        next.ServeHTTP(w, r)
        fmt.Printf("%s %s %v\\n", r.Method, r.URL.Path, time.Since(start))
    })
}
func cors(next http.Handler) http.Handler {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        w.Header().Set("Access-Control-Allow-Origin", "*")
        next.ServeHTTP(w, r)
    })
}
func chain(h http.Handler, mws ...Middleware) http.Handler {
    for i := len(mws) - 1; i >= 0; i-- {
        h = mws[i](h)
    }
    return h
}
func main() {
    hello := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintln(w, "Hello!")
    })
    handler := chain(hello, logging, cors)
    _ = handler
    fmt.Println("Middleware chain ready")
}'''..language='go'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_027'..topicId='go'..title='Channels Pipeline'..description='Pipeline pattern chains multiple stages of goroutines connected by channels for data processing.'..code='''package main
import "fmt"
func generate(nums ...int) <-chan int {
    out := make(chan int)
    go func() {
        for _, n := range nums { out <- n }
        close(out)
    }()
    return out
}
func square(in <-chan int) <-chan int {
    out := make(chan int)
    go func() {
        for n := range in { out <- n * n }
        close(out)
    }()
    return out
}
func filter(in <-chan int, pred func(int) bool) <-chan int {
    out := make(chan int)
    go func() {
        for n := range in {
            if pred(n) { out <- n }
        }
        close(out)
    }()
    return out
}
func main() {
    nums := generate(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    squares := square(nums)
    evens := filter(squares, func(n int) bool { return n%2 == 0 })
    for n := range evens {
        fmt.Println(n)
    }
}'''..language='go'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_028'..topicId='go'..title='Rate Limiter'..description='Rate limiting with time.Ticker and buffered channels controls request throughput.'..code='''package main
import (
    "fmt"
    "time"
)
type RateLimiter struct {
    tokens chan struct{}
    stop   chan struct{}
}
func NewRateLimiter(rate int, burst int) *RateLimiter {
    rl := &RateLimiter{
        tokens: make(chan struct{}, burst),
        stop:   make(chan struct{}),
    }
    for i := 0; i < burst; i++ {
        rl.tokens <- struct{}{}
    }
    go func() {
        ticker := time.NewTicker(time.Second / time.Duration(rate))
        defer ticker.Stop()
        for {
            select {
            case <-ticker.C:
                select {
                case rl.tokens <- struct{}{}: default: }
            case <-rl.stop:
                return
            }
        }
    }()
    return rl
}
func (rl *RateLimiter) Allow() bool {
    select {
    case <-rl.tokens: return true
    default: return false
    }
}
func main() {
    rl := NewRateLimiter(5, 3)
    for i := 0; i < 10; i++ {
        fmt.Printf("Request %d: %t\\n", i, rl.Allow())
    }
}'''..language='go'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_029'..topicId='go'..title='Fan-Out Fan-In'..description='Fan-out distributes work to multiple goroutines; fan-in merges results back into a single channel.'..code='''package main
import (
    "fmt"
    "sync"
)
func fanOut(in <-chan int, workers int) []<-chan int {
    channels := make([]<-chan int, workers)
    for i := 0; i < workers; i++ {
        ch := make(chan int)
        channels[i] = ch
        go func() {
            for n := range in { ch <- n * n }
            close(ch)
        }()
    }
    return channels
}
func fanIn(channels ...<-chan int) <-chan int {
    out := make(chan int)
    var wg sync.WaitGroup
    for _, ch := range channels {
        wg.Add(1)
        go func(c <-chan int) {
            defer wg.Done()
            for n := range c { out <- n }
        }(ch)
    }
    go func() { wg.Wait(); close(out) }()
    return out
}
func main() {
    in := make(chan int, 10)
    go func() {
        for i := 1; i <= 10; i++ { in <- i }
        close(in)
    }()
    workers := fanOut(in, 3)
    results := fanIn(workers...)
    for r := range results {
        fmt.Print(r, " ")
    }
    fmt.Println()
}'''..language='go'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_030'..topicId='go'..title='Custom Sort Interface'..description='Implement sort.Interface (Len, Less, Swap) for custom sorting logic on any collection.'..code='''package main
import (
    "fmt"
    "sort"
)
type Employee struct {
    Name   string
    Age    int
    Salary float64
}
type BySalary []Employee
func (b BySalary) Len() int           { return len(b) }
func (b BySalary) Less(i, j int) bool { return b[i].Salary > b[j].Salary }
func (b BySalary) Swap(i, j int)      { b[i], b[j] = b[j], b[i] }
func main() {
    employees := []Employee{
        {"Alice", 30, 90000},
        {"Bob", 25, 75000},
        {"Charlie", 35, 120000},
    }
    sort.Sort(BySalary(employees))
    for _, e := range employees {
        fmt.Printf("%s: \$%.0f\\n", e.Name, e.Salary)
    }
    sort.Slice(employees, func(i, j int) bool {
        return employees[i].Age < employees[j].Age
    })
    fmt.Println("By age:", employees[0].Name)
}'''..language='go'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_031'..topicId='go'..title='Atomic Operations'..description='sync/atomic provides lock-free thread-safe operations on integers and pointers.'..code='''package main
import (
    "fmt"
    "sync"
    "sync/atomic"
)
func main() {
    var counter int64 = 0
    var wg sync.WaitGroup
    for i := 0; i < 1000; i++ {
        wg.Add(1)
        go func() {
            defer wg.Done()
            atomic.AddInt64(&counter, 1)
        }()
    }
    wg.Wait()
    fmt.Println("Counter:", atomic.LoadInt64(&counter))

    var flag atomic.Bool
    flag.Store(true)
    fmt.Println("Flag:", flag.Load())
    swapped := flag.CompareAndSwap(true, false)
    fmt.Println("Swapped:", swapped, "Value:", flag.Load())
}'''..language='go'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_032'..topicId='go'..title='Code Generation'..description='go generate runs commands to auto-generate code. Stringer generates String() methods for enums.'..code='''package main
import "fmt"
//go:generate stringer -type=Color
type Color int
const (
    Red Color = iota
    Green
    Blue
    Yellow
)
func (c Color) String() string {
    names := [...]string{"Red", "Green", "Blue", "Yellow"}
    if c < Red || c > Yellow { return "Unknown" }
    return names[c]
}
func main() {
    c := Blue
    fmt.Println(c)
    for _, color := range []Color{Red, Green, Blue, Yellow} {
        fmt.Printf("%d -> %s\\n", color, color)
    }
}'''..language='go'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_033'..topicId='go'..title='Functional Options Pattern'..description='Functional options provide a clean API for configuring structs with optional parameters.'..code='''package main
import (
    "fmt"
    "time"
)
type Server struct {
    Host    string
    Port    int
    Timeout time.Duration
    MaxConn int
}
type Option func(*Server)
func WithPort(p int) Option { return func(s *Server) { s.Port = p } }
func WithTimeout(d time.Duration) Option { return func(s *Server) { s.Timeout = d } }
func WithMaxConn(n int) Option { return func(s *Server) { s.MaxConn = n } }
func NewServer(host string, opts ...Option) *Server {
    s := &Server{
        Host: host, Port: 8080,
        Timeout: 30 * time.Second, MaxConn: 100,
    }
    for _, opt := range opts { opt(s) }
    return s
}
func main() {
    s := NewServer("localhost",
        WithPort(9090),
        WithTimeout(60*time.Second),
    )
    fmt.Printf("%+v\\n", s)
}'''..language='go'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_034'..topicId='go'..title='Plugin System with Interfaces'..description='Build extensible systems using interfaces as plugin contracts with a registry pattern.'..code='''package main
import "fmt"
type Plugin interface {
    Name() string
    Execute(data map[string]interface{}) error
}
type PluginRegistry struct {
    plugins map[string]Plugin
}
func NewRegistry() *PluginRegistry {
    return &PluginRegistry{plugins: map[string]Plugin{}}
}
func (r *PluginRegistry) Register(p Plugin) {
    r.plugins[p.Name()] = p
}
func (r *PluginRegistry) Run(name string, data map[string]interface{}) error {
    p, ok := r.plugins[name]
    if !ok { return fmt.Errorf("plugin %q not found", name) }
    return p.Execute(data)
}
type LogPlugin struct{}
func (l LogPlugin) Name() string { return "logger" }
func (l LogPlugin) Execute(data map[string]interface{}) error {
    fmt.Println("LOG:", data)
    return nil
}
func main() {
    reg := NewRegistry()
    reg.Register(LogPlugin{})
    reg.Run("logger", map[string]interface{}{"msg": "hello"})
}'''..language='go'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_035'..topicId='go'..title='Circuit Breaker'..description='Circuit breaker prevents cascading failures by tracking errors and temporarily blocking requests.'..code='''package main
import (
    "errors"
    "fmt"
    "sync"
    "time"
)
type State int
const (
    Closed State = iota
    Open
    HalfOpen
)
type CircuitBreaker struct {
    mu          sync.Mutex
    state       State
    failures    int
    threshold   int
    timeout     time.Duration
    lastFailure time.Time
}
func NewCB(threshold int, timeout time.Duration) *CircuitBreaker {
    return &CircuitBreaker{threshold: threshold, timeout: timeout}
}
func (cb *CircuitBreaker) Execute(fn func() error) error {
    cb.mu.Lock()
    if cb.state == Open {
        if time.Since(cb.lastFailure) > cb.timeout {
            cb.state = HalfOpen
        } else {
            cb.mu.Unlock()
            return errors.New("circuit open")
        }
    }
    cb.mu.Unlock()
    err := fn()
    cb.mu.Lock()
    defer cb.mu.Unlock()
    if err != nil {
        cb.failures++
        cb.lastFailure = time.Now()
        if cb.failures >= cb.threshold { cb.state = Open }
        return err
    }
    cb.failures = 0
    cb.state = Closed
    return nil
}
func main() {
    cb := NewCB(3, 5*time.Second)
    for i := 0; i < 5; i++ {
        err := cb.Execute(func() error { return errors.New("fail") })
        fmt.Printf("Call %d: %v\\n", i, err)
    }
}'''..language='go'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_036'..topicId='go'..title='Graceful Shutdown'..description='Handle OS signals to gracefully shut down HTTP servers, flushing buffers and closing connections.'..code='''package main
import (
    "context"
    "fmt"
    "net/http"
    "os"
    "os/signal"
    "syscall"
    "time"
)
func main() {
    mux := http.NewServeMux()
    mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintln(w, "Hello!")
    })
    srv := &http.Server{Addr: ":8080", Handler: mux}
    go func() {
        fmt.Println("Starting server on :8080")
        if err := srv.ListenAndServe(); err != http.ErrServerClosed {
            fmt.Println("Error:", err)
        }
    }()
    quit := make(chan os.Signal, 1)
    signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
    <-quit
    fmt.Println("Shutting down...")
    ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
    defer cancel()
    if err := srv.Shutdown(ctx); err != nil {
        fmt.Println("Shutdown error:", err)
    }
    fmt.Println("Server stopped")
}'''..language='go'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_037'..topicId='go'..title='Semaphore Pattern'..description='Use buffered channels as counting semaphores to limit concurrent access to resources.'..code='''package main
import (
    "fmt"
    "sync"
    "time"
)
type Semaphore struct {
    ch chan struct{}
}
func NewSemaphore(max int) *Semaphore {
    return &Semaphore{ch: make(chan struct{}, max)}
}
func (s *Semaphore) Acquire() { s.ch <- struct{}{} }
func (s *Semaphore) Release() { <-s.ch }
func main() {
    sem := NewSemaphore(3)
    var wg sync.WaitGroup
    for i := 0; i < 10; i++ {
        wg.Add(1)
        go func(id int) {
            defer wg.Done()
            sem.Acquire()
            defer sem.Release()
            fmt.Printf("Worker %d running\\n", id)
            time.Sleep(100 * time.Millisecond)
        }(i)
    }
    wg.Wait()
    fmt.Println("All done")
}'''..language='go'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_038'..topicId='go'..title='Table-Driven State Machine'..description='Implement state machines using maps of transitions for clean, maintainable control flow.'..code='''package main
import "fmt"
type State string
type Event string
const (
    Idle    State = "idle"
    Active  State = "active"
    Paused  State = "paused"
    Done    State = "done"
)
const (
    Start  Event = "start"
    Pause  Event = "pause"
    Resume Event = "resume"
    Finish Event = "finish"
)
type StateMachine struct {
    current     State
    transitions map[State]map[Event]State
}
func NewSM(initial State) *StateMachine {
    return &StateMachine{
        current: initial,
        transitions: map[State]map[Event]State{
            Idle:   {Start: Active},
            Active: {Pause: Paused, Finish: Done},
            Paused: {Resume: Active, Finish: Done},
        },
    }
}
func (sm *StateMachine) Send(e Event) error {
    events, ok := sm.transitions[sm.current]
    if !ok { return fmt.Errorf("no transitions from %s", sm.current) }
    next, ok := events[e]
    if !ok { return fmt.Errorf("invalid event %s in state %s", e, sm.current) }
    fmt.Printf("%s -[%s]-> %s\\n", sm.current, e, next)
    sm.current = next
    return nil
}
func main() {
    sm := NewSM(Idle)
    sm.Send(Start)
    sm.Send(Pause)
    sm.Send(Resume)
    sm.Send(Finish)
}'''..language='go'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_039'..topicId='go'..title='In-Memory Cache with TTL'..description='Thread-safe cache with time-to-live expiration and automatic cleanup using goroutines.'..code='''package main
import (
    "fmt"
    "sync"
    "time"
)
type entry struct {
    value     interface{}
    expiresAt time.Time
}
type Cache struct {
    mu    sync.RWMutex
    items map[string]entry
}
func NewCache() *Cache {
    c := &Cache{items: map[string]entry{}}
    go c.cleanup()
    return c
}
func (c *Cache) Set(key string, val interface{}, ttl time.Duration) {
    c.mu.Lock()
    defer c.mu.Unlock()
    c.items[key] = entry{val, time.Now().Add(ttl)}
}
func (c *Cache) Get(key string) (interface{}, bool) {
    c.mu.RLock()
    defer c.mu.RUnlock()
    e, ok := c.items[key]
    if !ok || time.Now().After(e.expiresAt) { return nil, false }
    return e.value, true
}
func (c *Cache) cleanup() {
    for range time.Tick(1 * time.Second) {
        c.mu.Lock()
        for k, e := range c.items {
            if time.Now().After(e.expiresAt) { delete(c.items, k) }
        }
        c.mu.Unlock()
    }
}
func main() {
    cache := NewCache()
    cache.Set("key1", "value1", 2*time.Second)
    v, ok := cache.Get("key1")
    fmt.Println(v, ok)
    time.Sleep(3 * time.Second)
    v, ok = cache.Get("key1")
    fmt.Println(v, ok) // expired
}'''..language='go'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='go_040'..topicId='go'..title='Retry with Exponential Backoff'..description='Retry failed operations with increasing delays, jitter, and maximum attempt limits.'..code='''package main
import (
    "errors"
    "fmt"
    "math"
    "math/rand"
    "time"
)
type RetryConfig struct {
    MaxAttempts int
    BaseDelay   time.Duration
    MaxDelay    time.Duration
}
func Retry(cfg RetryConfig, fn func() error) error {
    var lastErr error
    for i := 0; i < cfg.MaxAttempts; i++ {
        lastErr = fn()
        if lastErr == nil { return nil }
        if i == cfg.MaxAttempts-1 { break }
        delay := time.Duration(
            math.Min(
                float64(cfg.BaseDelay)*math.Pow(2, float64(i)),
                float64(cfg.MaxDelay),
            ))
        jitter := time.Duration(rand.Int63n(int64(delay / 2)))
        wait := delay + jitter
        fmt.Printf("Attempt %d failed, retrying in %v\\n", i+1, wait)
        time.Sleep(wait)
    }
    return fmt.Errorf("all %d attempts failed: %w", cfg.MaxAttempts, lastErr)
}
func main() {
    attempt := 0
    err := Retry(RetryConfig{5, 100*time.Millisecond, 2*time.Second}, func() error {
        attempt++
        if attempt < 3 { return errors.New("temporary error") }
        return nil
    })
    if err != nil {
        fmt.Println("Failed:", err)
    } else {
        fmt.Printf("Succeeded on attempt %d\\n", attempt)
    }
}'''..language='go'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
  ];
}
