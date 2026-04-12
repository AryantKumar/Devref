import '../models/snippet.dart';

List<Snippet> getTypeScriptSnippets() {
  return [
    Snippet()..snippetId='ts_001'..topicId='typescript'..title='Hello World with Types'..description='TypeScript adds static types to JavaScript. Type annotations catch errors at compile time.'..code='''const greeting: string = "Hello, World!";
const age: number = 25;
const active: boolean = true;
console.log(greeting, age, active);'''..language='typescript'..difficulty='very_easy'..section='Introduction to TypeScript'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_002'..topicId='typescript'..title='Interfaces'..description='Interfaces define object shapes. They support optional properties, readonly, and extension.'..code='''interface User {
  readonly id: number;
  name: string;
  email: string;
  age?: number;
}

function greet(user: User): string {
  return \x60Hello, \${user.name}!\x60;
}

const user: User = { id: 1, name: "Alice", email: "a@b.com" };
console.log(greet(user));'''..language='typescript'..difficulty='very_easy'..section='Data Types and Variables'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_003'..topicId='typescript'..title='Type Aliases and Unions'..description='Type aliases name any type. Union types allow a value to be one of several types.'..code='''type ID = string | number;
type Status = "active" | "inactive" | "banned";
type Result<T> = { success: true; data: T } | { success: false; error: string };

function processId(id: ID): string {
  return typeof id === "string" ? id.toUpperCase() : id.toString();
}

function handleResult(r: Result<string>) {
  if (r.success) {
    console.log("Data:", r.data);
  } else {
    console.log("Error:", r.error);
  }
}

console.log(processId("abc"));
console.log(processId(123));'''..language='typescript'..difficulty='very_easy'..section='Data Types and Variables'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_004'..topicId='typescript'..title='Arrays and Tuples'..description='TypeScript arrays are typed collections. Tuples are fixed-length arrays with specific types per position.'..code='''const nums: number[] = [1, 2, 3, 4, 5];
const names: Array<string> = ["Alice", "Bob"];

// Tuple
const pair: [string, number] = ["age", 25];
const [key, value] = pair;

// Readonly
const frozen: readonly number[] = [1, 2, 3];
// frozen.push(4); // Error!

// Array methods with types
const doubled = nums.map((n): number => n * 2);
const evens = nums.filter((n): boolean => n % 2 === 0);
const sum = nums.reduce((acc, n) => acc + n, 0);

console.log(doubled, evens, sum);'''..language='typescript'..difficulty='very_easy'..section='Conditional Expressions'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_005'..topicId='typescript'..title='Functions with Types'..description='TypeScript functions have typed parameters, return types, optional params, and overloads.'..code='''function add(a: number, b: number): number {
  return a + b;
}

const multiply = (a: number, b: number): number => a * b;

function greet(name: string, greeting?: string): string {
  return \x60\${greeting ?? "Hello"}, \${name}!\x60;
}

// Rest parameters
function sum(...nums: number[]): number {
  return nums.reduce((a, b) => a + b, 0);
}

// Function type
type MathFn = (a: number, b: number) => number;
const divide: MathFn = (a, b) => a / b;

console.log(add(2, 3));
console.log(greet("Alice"));
console.log(sum(1, 2, 3, 4, 5));'''..language='typescript'..difficulty='very_easy'..section='Conditional Expressions'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_006'..topicId='typescript'..title='Classes'..description='TypeScript classes support access modifiers (public, private, protected), abstract classes, and implements.'..code='''abstract class Shape {
  abstract area(): number;
  describe(): string {
    return \x60Area: \${this.area().toFixed(2)}\x60;
  }
}

class Circle extends Shape {
  constructor(private radius: number) { super(); }
  area(): number { return Math.PI * this.radius ** 2; }
}

class Rectangle extends Shape {
  constructor(
    private width: number,
    private height: number
  ) { super(); }
  area(): number { return this.width * this.height; }
}

const shapes: Shape[] = [new Circle(5), new Rectangle(4, 6)];
shapes.forEach(s => console.log(s.describe()));'''..language='typescript'..difficulty='very_easy'..section='Functions'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_007'..topicId='typescript'..title='Enums'..description='TypeScript enums define named constants. Supports numeric, string, and const enums.'..code='''enum Direction {
  Up = "UP",
  Down = "DOWN",
  Left = "LEFT",
  Right = "RIGHT",
}

enum HttpStatus {
  OK = 200,
  NotFound = 404,
  ServerError = 500,
}

function move(dir: Direction): string {
  switch (dir) {
    case Direction.Up: return "Moving up";
    case Direction.Down: return "Moving down";
    default: return "Moving sideways";
  }
}

console.log(move(Direction.Up));
console.log(HttpStatus.OK);'''..language='typescript'..difficulty='very_easy'..section='Classes and Objects'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_008'..topicId='typescript'..title='Generics Basics'..description='Generics create reusable components that work with multiple types while maintaining type safety.'..code='''function identity<T>(arg: T): T { return arg; }
function first<T>(arr: T[]): T | undefined { return arr[0]; }

class Stack<T> {
  private items: T[] = [];
  push(item: T): void { this.items.push(item); }
  pop(): T | undefined { return this.items.pop(); }
  peek(): T | undefined { return this.items[this.items.length - 1]; }
  get size(): number { return this.items.length; }
}

const numStack = new Stack<number>();
numStack.push(1); numStack.push(2); numStack.push(3);
console.log(numStack.pop()); // 3

console.log(identity<string>("hello"));
console.log(first([10, 20, 30]));'''..language='typescript'..difficulty='very_easy'..section='Collections'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_009'..topicId='typescript'..title='Type Guards'..description='Type guards narrow types at runtime using typeof, instanceof, in operator, and custom predicates.'..code='''interface Dog { bark(): void; breed: string; }
interface Cat { meow(): void; color: string; }

function isDog(animal: Dog | Cat): animal is Dog {
  return "bark" in animal;
}

function handleAnimal(animal: Dog | Cat) {
  if (isDog(animal)) {
    animal.bark();
    console.log("Breed:", animal.breed);
  } else {
    animal.meow();
    console.log("Color:", animal.color);
  }
}

// typeof guard
function padLeft(value: string, padding: string | number): string {
  if (typeof padding === "number") {
    return " ".repeat(padding) + value;
  }
  return padding + value;
}

console.log(padLeft("hello", 4));
console.log(padLeft("hello", ">>> "));'''..language='typescript'..difficulty='very_easy'..section='Data Types and Variables'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_010'..topicId='typescript'..title='Nullish Handling'..description='Optional chaining (?.), nullish coalescing (??), and non-null assertion (!) for null safety.'..code='''interface Config {
  db?: { host?: string; port?: number };
  cache?: { ttl?: number };
}

function getDbHost(config: Config): string {
  return config.db?.host ?? "localhost";
}

function getPort(config: Config): number {
  return config.db?.port ?? 5432;
}

const config: Config = { db: { host: "prod-db" } };
console.log(getDbHost(config));     // prod-db
console.log(getPort(config));       // 5432
console.log(getDbHost({}));         // localhost

// Nullish assignment
let value: string | null = null;
value ??= "default";
console.log(value);'''..language='typescript'..difficulty='very_easy'..section='Error Handling'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_011'..topicId='typescript'..title='Mapped Types'..description='Mapped types transform existing types by iterating over keys. Built-in: Partial, Required, Readonly, Pick.'..code='''interface User {
  id: number;
  name: string;
  email: string;
  age: number;
}

type Partial<T> = { [K in keyof T]?: T[K] };
type Readonly<T> = { readonly [K in keyof T]: T[K] };
type Nullable<T> = { [K in keyof T]: T[K] | null };

type UserUpdate = Partial<User>;
type UserView = Readonly<User>;
type UserInput = Nullable<Omit<User, "id">>;

const update: UserUpdate = { name: "Bob" };
const input: UserInput = { name: "Alice", email: null, age: null };

// Record type
type Scores = Record<string, number>;
const scores: Scores = { Alice: 95, Bob: 87 };

console.log(update, input, scores);'''..language='typescript'..difficulty='medium'..section='Type System'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_012'..topicId='typescript'..title='Conditional Types'..description='Conditional types select from two types based on a condition, enabling advanced type-level programming.'..code='''type IsString<T> = T extends string ? "yes" : "no";
type A = IsString<string>;   // "yes"
type B = IsString<number>;   // "no"

type Flatten<T> = T extends Array<infer U> ? U : T;
type Str = Flatten<string[]>;   // string
type Num = Flatten<number>;     // number

type ReturnType<T> = T extends (...args: any[]) => infer R ? R : never;
type FnReturn = ReturnType<() => string>;  // string

// Distributive conditional
type NonNullable<T> = T extends null | undefined ? never : T;
type Clean = NonNullable<string | null | undefined>;  // string

// Practical example
type ApiResponse<T> = T extends "user"
  ? { id: number; name: string }
  : T extends "post"
  ? { id: number; title: string }
  : never;

type UserResp = ApiResponse<"user">;'''..language='typescript'..difficulty='medium'..section='Type System'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_013'..topicId='typescript'..title='Template Literal Types'..description='Template literal types construct string types by interpolating other types in template strings.'..code='''type Color = "red" | "green" | "blue";
type Size = "sm" | "md" | "lg";
type CssClass = \x60\${Color}-\${Size}\x60;  // "red-sm" | "red-md" | ...

type EventName = \x60on\${Capitalize<string>}\x60;

// Getter/setter types
type Getters<T> = {
  [K in keyof T as \x60get\${Capitalize<string & K>}\x60]: () => T[K];
};

interface Person { name: string; age: number; }
type PersonGetters = Getters<Person>;
// { getName: () => string; getAge: () => number }

// HTTP method types
type Method = "GET" | "POST" | "PUT" | "DELETE";
type Endpoint = "/users" | "/posts";
type Route = \x60\${Method} \${Endpoint}\x60;

const route: Route = "GET /users";
console.log(route);'''..language='typescript'..difficulty='medium'..section='Functions'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_014'..topicId='typescript'..title='Decorators'..description='Decorators modify classes and methods at definition time. Used extensively in NestJS and Angular.'..code='''function Log(target: any, key: string, desc: PropertyDescriptor) {
  const original = desc.value;
  desc.value = function (...args: any[]) {
    console.log(\x60Calling \${key} with\x60, args);
    const result = original.apply(this, args);
    console.log(\x60\${key} returned\x60, result);
    return result;
  };
}

function Sealed(constructor: Function) {
  Object.seal(constructor);
  Object.seal(constructor.prototype);
}

@Sealed
class Calculator {
  @Log
  add(a: number, b: number): number {
    return a + b;
  }
  @Log
  multiply(a: number, b: number): number {
    return a * b;
  }
}

const calc = new Calculator();
calc.add(2, 3);
calc.multiply(4, 5);'''..language='typescript'..difficulty='medium'..section='Classes and Objects'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_015'..topicId='typescript'..title='Promise and Async/Await'..description='Async functions return Promises with full type safety on resolved and rejected values.'..code='''interface ApiData {
  id: number;
  title: string;
}

async function fetchData(url: string): Promise<ApiData> {
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(\x60HTTP \${response.status}\x60);
  }
  return response.json();
}

async function fetchAll(urls: string[]): Promise<ApiData[]> {
  return Promise.all(urls.map(fetchData));
}

// Type-safe error handling
type Result<T, E = Error> =
  | { ok: true; value: T }
  | { ok: false; error: E };

async function safeFetch(url: string): Promise<Result<ApiData>> {
  try {
    const data = await fetchData(url);
    return { ok: true, value: data };
  } catch (e) {
    return { ok: false, error: e as Error };
  }
}'''..language='typescript'..difficulty='medium'..section='Collections'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_016'..topicId='typescript'..title='Utility Types Deep Dive'..description='Advanced utility types: Extract, Exclude, Parameters, ConstructorParameters, InstanceType.'..code='''type EventMap = {
  click: { x: number; y: number };
  keydown: { key: string; code: number };
  scroll: { top: number };
};

type EventNames = keyof EventMap;  // "click" | "keydown" | "scroll"

// Extract/Exclude
type MouseEvents = Extract<EventNames, "click" | "scroll">;
type KeyEvents = Exclude<EventNames, "click" | "scroll">;

// Parameters and ReturnType
function createUser(name: string, age: number): { id: number } {
  return { id: 1 };
}
type Params = Parameters<typeof createUser>;  // [string, number]
type Return = ReturnType<typeof createUser>;  // { id: number }

// Awaited
type PromiseValue = Awaited<Promise<Promise<string>>>;  // string

// Practical: event emitter
function on<K extends EventNames>(
  event: K,
  handler: (data: EventMap[K]) => void
): void {
  console.log(\x60Registered handler for \${event}\x60);
}

on("click", (data) => console.log(data.x, data.y));'''..language='typescript'..difficulty='medium'..section='Functions'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_017'..topicId='typescript'..title='Generic Constraints'..description='Constrain generics with extends keyword to require specific properties or interfaces.'..code='''interface HasId { id: number; }
interface HasName { name: string; }

function getById<T extends HasId>(items: T[], id: number): T | undefined {
  return items.find(item => item.id === id);
}

function sortByName<T extends HasName>(items: T[]): T[] {
  return [...items].sort((a, b) => a.name.localeCompare(b.name));
}

// Multiple constraints
function merge<T extends HasId & HasName>(a: T, b: Partial<T>): T {
  return { ...a, ...b };
}

// keyof constraint
function getProperty<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}

const users = [
  { id: 1, name: "Charlie" },
  { id: 2, name: "Alice" },
  { id: 3, name: "Bob" },
];

console.log(getById(users, 2));
console.log(sortByName(users));'''..language='typescript'..difficulty='medium'..section='Type System'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_018'..topicId='typescript'..title='Discriminated Unions'..description='Tagged unions use a common literal property to discriminate between variants for type-safe handling.'..code='''interface Circle { kind: "circle"; radius: number; }
interface Rectangle { kind: "rectangle"; width: number; height: number; }
interface Triangle { kind: "triangle"; base: number; height: number; }

type Shape = Circle | Rectangle | Triangle;

function area(shape: Shape): number {
  switch (shape.kind) {
    case "circle": return Math.PI * shape.radius ** 2;
    case "rectangle": return shape.width * shape.height;
    case "triangle": return 0.5 * shape.base * shape.height;
  }
}

// Exhaustiveness checking
function assertNever(x: never): never {
  throw new Error("Unexpected: " + x);
}

const shapes: Shape[] = [
  { kind: "circle", radius: 5 },
  { kind: "rectangle", width: 4, height: 6 },
];
shapes.forEach(s => console.log(\x60\${s.kind}: \${area(s).toFixed(2)}\x60));'''..language='typescript'..difficulty='medium'..section='Classes and Objects'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_019'..topicId='typescript'..title='Module Patterns'..description='TypeScript modules with named exports, default exports, re-exports, and namespace patterns.'..code='''// math.ts
export const PI = 3.14159;
export function add(a: number, b: number): number { return a + b; }
export function multiply(a: number, b: number): number { return a * b; }

// types.ts
export interface Config {
  host: string;
  port: number;
  debug?: boolean;
}

export type Logger = {
  info(msg: string): void;
  error(msg: string): void;
};

// Namespace for grouping
namespace Validators {
  export function isEmail(s: string): boolean {
    return /^[^@]+@[^@]+\\.[^@]+/.test(s);
  }
  export function isPhone(s: string): boolean {
    return /^\\+?\\d{10,15}/.test(s);
  }
}

console.log(Validators.isEmail("test@example.com"));'''..language='typescript'..difficulty='medium'..section='Type System'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_020'..topicId='typescript'..title='Error Handling Patterns'..description='Type-safe error handling with Result types, custom error classes, and exhaustive error checking.'..code='''class AppError extends Error {
  constructor(
    message: string,
    public code: string,
    public statusCode: number = 500
  ) {
    super(message);
    this.name = "AppError";
  }
}

class NotFoundError extends AppError {
  constructor(resource: string, id: string | number) {
    super(\x60\${resource} #\${id} not found\x60, "NOT_FOUND", 404);
  }
}

class ValidationError extends AppError {
  constructor(public fields: Record<string, string>) {
    super("Validation failed", "VALIDATION", 400);
  }
}

function handleError(error: AppError): void {
  switch (error.code) {
    case "NOT_FOUND":
      console.log("404:", error.message);
      break;
    case "VALIDATION":
      const ve = error as ValidationError;
      console.log("Validation:", ve.fields);
      break;
    default:
      console.log("Error:", error.message);
  }
}

handleError(new NotFoundError("User", 42));'''..language='typescript'..difficulty='medium'..section='Classes and Objects'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_021'..topicId='typescript'..title='Advanced Generics - Recursive Types'..description='Recursive types model tree structures, nested objects, and JSON-like data with full type safety.'..code='''// JSON type
type Json = string | number | boolean | null | Json[] | { [key: string]: Json };

// Deep readonly
type DeepReadonly<T> = {
  readonly [K in keyof T]: T[K] extends object ? DeepReadonly<T[K]> : T[K];
};

// Deep partial
type DeepPartial<T> = {
  [K in keyof T]?: T[K] extends object ? DeepPartial<T[K]> : T[K];
};

// Tree structure
interface TreeNode<T> {
  value: T;
  children: TreeNode<T>[];
}

function findInTree<T>(node: TreeNode<T>, pred: (v: T) => boolean): T | undefined {
  if (pred(node.value)) return node.value;
  for (const child of node.children) {
    const found = findInTree(child, pred);
    if (found !== undefined) return found;
  }
  return undefined;
}

const tree: TreeNode<number> = {
  value: 1,
  children: [
    { value: 2, children: [{ value: 4, children: [] }] },
    { value: 3, children: [] },
  ],
};
console.log(findInTree(tree, v => v === 4));'''..language='typescript'..difficulty='hard'..section='Generics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_022'..topicId='typescript'..title='Branded Types'..description='Branded types prevent mixing semantically different values that share the same primitive type.'..code='''type Brand<T, B> = T & { __brand: B };
type USD = Brand<number, "USD">;
type EUR = Brand<number, "EUR">;
type UserId = Brand<string, "UserId">;
type OrderId = Brand<string, "OrderId">;

function usd(amount: number): USD { return amount as USD; }
function eur(amount: number): EUR { return amount as EUR; }

function addUSD(a: USD, b: USD): USD {
  return (a + b) as USD;
}

// addUSD(usd(10), eur(5)); // Type error!
const total = addUSD(usd(10), usd(20));

function getUser(id: UserId): void {
  console.log("Getting user:", id);
}

const userId = "user-123" as UserId;
// const orderId = "order-456" as OrderId;
// getUser(orderId); // Type error!
getUser(userId);'''..language='typescript'..difficulty='hard'..section='Type System'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_023'..topicId='typescript'..title='Type-Level Programming'..description='Compute types at compile time using recursive conditional types for string manipulation and math.'..code='''// String manipulation at type level
type Split<S extends string, D extends string> =
  S extends \x60\${infer L}\${D}\${infer R}\x60
    ? [L, ...Split<R, D>]
    : [S];

type Parts = Split<"a.b.c", ".">;  // ["a", "b", "c"]

// Type-safe path access
type Path<T, P extends string> =
  P extends \x60\${infer K}.\${infer Rest}\x60
    ? K extends keyof T ? Path<T[K], Rest> : never
    : P extends keyof T ? T[P] : never;

interface Config {
  db: { host: string; port: number };
  cache: { ttl: number };
}

type DbHost = Path<Config, "db.host">;  // string

// Tuple manipulation
type Head<T extends any[]> = T extends [infer H, ...any[]] ? H : never;
type Tail<T extends any[]> = T extends [any, ...infer R] ? R : never;
type Last<T extends any[]> = T extends [...any[], infer L] ? L : never;

type H = Head<[1, 2, 3]>;  // 1
type L = Last<[1, 2, 3]>;  // 3'''..language='typescript'..difficulty='hard'..section='Generics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_024'..topicId='typescript'..title='Pattern: Dependency Injection'..description='Type-safe DI container using interfaces and generics for testable, loosely coupled code.'..code='''interface Logger { log(msg: string): void; }
interface Database { query(sql: string): Promise<any[]>; }

class ConsoleLogger implements Logger {
  log(msg: string): void { console.log(\x60[LOG] \${msg}\x60); }
}

class Container {
  private services = new Map<string, any>();

  register<T>(key: string, instance: T): void {
    this.services.set(key, instance);
  }

  resolve<T>(key: string): T {
    const service = this.services.get(key);
    if (!service) throw new Error(\x60Service \${key} not found\x60);
    return service as T;
  }
}

class UserService {
  constructor(
    private logger: Logger,
  ) {}
  getUser(id: number) {
    this.logger.log(\x60Getting user \${id}\x60);
    return { id, name: "Alice" };
  }
}

const container = new Container();
container.register<Logger>("logger", new ConsoleLogger());
const logger = container.resolve<Logger>("logger");
const userService = new UserService(logger);
console.log(userService.getUser(1));'''..language='typescript'..difficulty='hard'..section='Classes and Objects'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_025'..topicId='typescript'..title='Builder Pattern with Types'..description='Type-safe builder that tracks which properties have been set using mapped types.'..code='''type Builder<T, Set extends keyof T = never> = {
  [K in keyof T]-?: (value: T[K]) => Builder<T, Set | K>;
} & {
  build: Set extends keyof T ? () => T : never;
};

interface ServerConfig {
  host: string;
  port: number;
  ssl: boolean;
}

function createBuilder<T>(): Builder<T> {
  const config: any = {};
  const builder: any = new Proxy({}, {
    get(_, prop: string) {
      if (prop === "build") return () => ({ ...config });
      return (value: any) => {
        config[prop] = value;
        return builder;
      };
    },
  });
  return builder;
}

const config = createBuilder<ServerConfig>()
  .host("localhost")
  .port(8080)
  .ssl(true)
  .build();
console.log(config);'''..language='typescript'..difficulty='hard'..section='Generics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_026'..topicId='typescript'..title='Variadic Tuple Types'..description='Variadic tuple types enable typed spread operations and function composition at the type level.'..code='''// Typed concat
type Concat<A extends any[], B extends any[]> = [...A, ...B];
type AB = Concat<[1, 2], [3, 4]>;  // [1, 2, 3, 4]

// Typed curry
type Curry<F> = F extends (...args: infer A) => infer R
  ? A extends [infer First, ...infer Rest]
    ? (arg: First) => Curry<(...args: Rest) => R>
    : R
  : never;

function curry<A extends any[], R>(
  fn: (...args: A) => R
): Curry<(...args: A) => R> {
  return function curried(...args: any[]): any {
    if (args.length >= fn.length) return fn(...args as any);
    return (...more: any[]) => curried(...args, ...more);
  } as any;
}

function add(a: number, b: number, c: number): number {
  return a + b + c;
}

const curriedAdd = curry(add);
console.log(curriedAdd(1)(2)(3));  // 6'''..language='typescript'..difficulty='hard'..section='Type System'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_027'..topicId='typescript'..title='Infer in Conditional Types'..description='The infer keyword extracts types from complex structures in conditional type expressions.'..code='''// Extract promise value
type UnwrapPromise<T> = T extends Promise<infer U> ? U : T;
type A = UnwrapPromise<Promise<string>>;  // string

// Extract function args and return
type FirstArg<F> = F extends (first: infer A, ...rest: any[]) => any ? A : never;
type FnReturn<F> = F extends (...args: any[]) => infer R ? R : never;

// Extract array element
type ElementOf<T> = T extends (infer E)[] ? E : never;
type Num = ElementOf<number[]>;  // number

// Extract object values
type ValueOf<T> = T[keyof T];

// Practical: extract event handler types
interface EventMap {
  click: (e: MouseEvent) => void;
  input: (e: InputEvent) => void;
}

type EventHandler<K extends keyof EventMap> =
  EventMap[K] extends (e: infer E) => void ? E : never;

type ClickEvent = EventHandler<"click">;  // MouseEvent'''..language='typescript'..difficulty='hard'..section='Advanced Types'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_028'..topicId='typescript'..title='Readonly Deep and Mutable'..description='Create deeply readonly types and convert back to mutable with mapped type manipulation.'..code='''type DeepReadonly<T> = T extends Function
  ? T
  : T extends object
  ? { readonly [K in keyof T]: DeepReadonly<T[K]> }
  : T;

type Mutable<T> = {
  -readonly [K in keyof T]: T[K];
};

type DeepMutable<T> = T extends Function
  ? T
  : T extends object
  ? { -readonly [K in keyof T]: DeepMutable<T[K]> }
  : T;

interface Config {
  readonly db: {
    readonly host: string;
    readonly port: number;
  };
  readonly cache: {
    readonly ttl: number;
  };
}

type MutableConfig = DeepMutable<Config>;

function updateConfig(config: MutableConfig): void {
  config.db.host = "new-host";
  config.cache.ttl = 300;
}

const config: MutableConfig = {
  db: { host: "localhost", port: 5432 },
  cache: { ttl: 60 },
};
updateConfig(config);
console.log(config);'''..language='typescript'..difficulty='hard'..section='Collections'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_029'..topicId='typescript'..title='Type-Safe Event Emitter'..description='Generic event emitter with strongly typed event names and payload types.'..code='''type EventMap = Record<string, any>;

class TypedEmitter<Events extends EventMap> {
  private handlers = new Map<keyof Events, Function[]>();

  on<K extends keyof Events>(
    event: K,
    handler: (data: Events[K]) => void
  ): void {
    const list = this.handlers.get(event) ?? [];
    list.push(handler);
    this.handlers.set(event, list);
  }

  emit<K extends keyof Events>(event: K, data: Events[K]): void {
    const list = this.handlers.get(event) ?? [];
    list.forEach(fn => fn(data));
  }
}

interface AppEvents {
  login: { userId: string; timestamp: Date };
  logout: { userId: string };
  error: { code: number; message: string };
}

const emitter = new TypedEmitter<AppEvents>();
emitter.on("login", (data) => {
  console.log(\x60User \${data.userId} logged in\x60);
});
emitter.emit("login", { userId: "123", timestamp: new Date() });'''..language='typescript'..difficulty='hard'..section='Generics'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_030'..topicId='typescript'..title='Satisfies Operator'..description='The satisfies operator validates that an expression matches a type without widening it.'..code='''type Colors = Record<string, [number, number, number] | string>;

const palette = {
  red: [255, 0, 0],
  green: "#00ff00",
  blue: [0, 0, 255],
} satisfies Colors;

// Type is preserved - not widened
const r = palette.red;     // [number, number, number]
const g = palette.green;   // string
// palette.red.toUpperCase();  // Error! It is an array

type Route = {
  path: string;
  children?: Route[];
};

const routes = [
  {
    path: "/",
    children: [
      { path: "/about" },
      { path: "/contact" },
    ],
  },
] satisfies Route[];

console.log(palette.red[0]);  // 255
console.log(palette.green.toUpperCase());'''..language='typescript'..difficulty='very_hard'..section='Advanced Types'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_031'..topicId='typescript'..title='Phantom Types'..description='Phantom types carry type information without runtime representation for compile-time safety.'..code='''declare const __brand: unique symbol;
type Phantom<T, Brand extends string> = T & { [__brand]: Brand };

type Validated = Phantom<string, "Validated">;
type Raw = Phantom<string, "Raw">;

function validateEmail(input: string): Validated | null {
  if (/^[^@]+@[^@]+\\.[^@]+\$/.test(input)) {
    return input as Validated;
  }
  return null;
}

function sendEmail(to: Validated, body: string): void {
  console.log(\x60Sending to \${to}: \${body}\x60);
}

const raw = "test@example.com";
// sendEmail(raw, "Hi");  // Type error!

const validated = validateEmail(raw);
if (validated) {
  sendEmail(validated, "Hi there!");  // OK
}'''..language='typescript'..difficulty='very_hard'..section='Advanced Types'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_032'..topicId='typescript'..title='Type-Safe State Machine'..description='Model state machines in the type system so invalid transitions are compile-time errors.'..code='''type States = "idle" | "loading" | "success" | "error";

type Transitions = {
  idle: "loading";
  loading: "success" | "error";
  success: "idle";
  error: "idle" | "loading";
};

class StateMachine<S extends States> {
  constructor(private state: S) {}

  transition<Next extends Transitions[S]>(
    next: Next
  ): StateMachine<Next & States> {
    console.log(\x60\${this.state} -> \${next}\x60);
    return new StateMachine(next as Next & States);
  }

  getState(): S { return this.state; }
}

const sm = new StateMachine("idle" as const);
const loading = sm.transition("loading");
const success = loading.transition("success");
const back = success.transition("idle");
// loading.transition("idle"); // Type error!

console.log(back.getState());'''..language='typescript'..difficulty='very_hard'..section='Advanced Types'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_033'..topicId='typescript'..title='HKT Encoding'..description='Simulate Higher-Kinded Types in TypeScript for functors, monads, and other abstract patterns.'..code='''// HKT encoding using interface merging
interface URItoKind<A> {
  Array: A[];
  Option: A | null;
  Promise: Promise<A>;
}

type URIS = keyof URItoKind<any>;
type Kind<F extends URIS, A> = URItoKind<A>[F];

// Functor interface
interface Functor<F extends URIS> {
  map: <A, B>(fa: Kind<F, A>, f: (a: A) => B) => Kind<F, B>;
}

const arrayFunctor: Functor<"Array"> = {
  map: (fa, f) => fa.map(f),
};

const optionFunctor: Functor<"Option"> = {
  map: (fa, f) => fa === null ? null : f(fa),
};

// Usage
const doubled = arrayFunctor.map([1, 2, 3], x => x * 2);
const upper = optionFunctor.map("hello" as string | null, s => s.toUpperCase());

console.log(doubled);  // [2, 4, 6]
console.log(upper);    // "HELLO"'''..language='typescript'..difficulty='very_hard'..section='Advanced Types'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_034'..topicId='typescript'..title='Type-Safe SQL Query Builder'..description='Build SQL queries with compile-time checking of table names, column names, and types.'..code='''interface Schema {
  users: { id: number; name: string; email: string; age: number };
  posts: { id: number; title: string; userId: number };
}

type TableName = keyof Schema;
type Columns<T extends TableName> = keyof Schema[T];

class QueryBuilder<T extends TableName> {
  private _where: string[] = [];
  private _select: string[] = [];
  private _limit?: number;

  constructor(private table: T) {}

  select(...cols: Columns<T>[]): this {
    this._select = cols as string[];
    return this;
  }

  where(col: Columns<T>, op: string, val: any): this {
    this._where.push(\x60\${String(col)} \${op} '\${val}'\x60);
    return this;
  }

  limit(n: number): this {
    this._limit = n;
    return this;
  }

  toSQL(): string {
    const cols = this._select.length ? this._select.join(", ") : "*";
    let sql = \x60SELECT \${cols} FROM \${this.table}\x60;
    if (this._where.length) sql += \x60 WHERE \${this._where.join(" AND ")}\x60;
    if (this._limit) sql += \x60 LIMIT \${this._limit}\x60;
    return sql;
  }
}

function from<T extends TableName>(table: T) {
  return new QueryBuilder(table);
}

const query = from("users")
  .select("name", "email")
  .where("age", ">", 18)
  .limit(10)
  .toSQL();
console.log(query);'''..language='typescript'..difficulty='very_hard'..section='Advanced Types'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_035'..topicId='typescript'..title='Opaque Types with Symbols'..description='Use unique symbols to create truly opaque types that prevent any implicit type conversion.'..code='''declare const UserIdSymbol: unique symbol;
declare const PostIdSymbol: unique symbol;

type UserId = number & { readonly [UserIdSymbol]: typeof UserIdSymbol };
type PostId = number & { readonly [PostIdSymbol]: typeof PostIdSymbol };

function createUserId(id: number): UserId { return id as UserId; }
function createPostId(id: number): PostId { return id as PostId; }

function getUser(id: UserId): void { console.log("User:", id); }
function getPost(id: PostId): void { console.log("Post:", id); }

const userId = createUserId(1);
const postId = createPostId(1);

getUser(userId);  // OK
getPost(postId);  // OK
// getUser(postId);  // Type error!
// getUser(1);       // Type error!'''..language='typescript'..difficulty='very_hard'..section='Advanced Types'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_036'..topicId='typescript'..title='Module Augmentation'..description='Extend existing modules and interfaces with declaration merging for adding custom properties.'..code='''// Augment Express Request
declare global {
  namespace Express {
    interface Request {
      userId?: string;
      role?: "admin" | "user";
    }
  }
}

// Augment Window
declare global {
  interface Window {
    __APP_CONFIG__: {
      apiUrl: string;
      version: string;
    };
  }
}

// Augment Array
declare global {
  interface Array<T> {
    unique(): T[];
    groupBy(fn: (item: T) => string): Record<string, T[]>;
  }
}

Array.prototype.unique = function<T>(this: T[]): T[] {
  return [...new Set(this)];
};

Array.prototype.groupBy = function<T>(
  this: T[], fn: (item: T) => string
): Record<string, T[]> {
  return this.reduce((acc, item) => {
    const key = fn(item);
    (acc[key] ??= []).push(item);
    return acc;
  }, {} as Record<string, T[]>);
};

console.log([1, 2, 2, 3, 3].unique());'''..language='typescript'..difficulty='very_hard'..section='Advanced Types'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_037'..topicId='typescript'..title='Readonly Tuple Inference'..description='Use const assertions and readonly tuples for precise literal type inference.'..code='''// as const for literal types
const routes = [
  { path: "/", component: "Home" },
  { path: "/about", component: "About" },
  { path: "/contact", component: "Contact" },
] as const;

type Route = typeof routes[number];
type Path = Route["path"];  // "/" | "/about" | "/contact"

// Typed configuration
function defineConfig<const T extends readonly {
  name: string;
  value: string | number | boolean;
}[]>(config: T): T { return config; }

const config = defineConfig([
  { name: "debug", value: true },
  { name: "port", value: 8080 },
  { name: "host", value: "localhost" },
] as const);

type ConfigName = typeof config[number]["name"];
// "debug" | "port" | "host"

console.log(config[0].name);  // type is "debug"'''..language='typescript'..difficulty='very_hard'..section='Advanced Types'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_038'..topicId='typescript'..title='Covariance and Contravariance'..description='Understanding type variance for safe assignment of generic types with inheritance.'..code='''class Animal { name = "animal"; }
class Dog extends Animal { breed = "lab"; }
class Cat extends Animal { color = "black"; }

// Covariant: Producer<Dog> assignable to Producer<Animal>
type Producer<T> = () => T;
const dogProducer: Producer<Dog> = () => new Dog();
const animalProducer: Producer<Animal> = dogProducer; // OK

// Contravariant: Consumer<Animal> assignable to Consumer<Dog>
type Consumer<T> = (item: T) => void;
const animalConsumer: Consumer<Animal> = (a) => console.log(a.name);
const dogConsumer: Consumer<Dog> = animalConsumer; // OK

// Invariant: both in and out position
type Transform<T> = (item: T) => T;
// Transform<Dog> NOT assignable to Transform<Animal>

// in/out keywords (TS 4.7+)
type ReadonlyBox<out T> = { readonly value: T };
type WriteBox<in T> = { set(value: T): void };

const dogBox: ReadonlyBox<Dog> = { value: new Dog() };
const animalBox: ReadonlyBox<Animal> = dogBox; // OK covariant'''..language='typescript'..difficulty='very_hard'..section='Advanced Types'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_039'..topicId='typescript'..title='Type-Safe Middleware Chain'..description='Build composable middleware with accumulating context types for request processing pipelines.'..code='''type Context = Record<string, any>;
type Next = () => Promise<void>;
type Middleware<In extends Context, Out extends Context> =
  (ctx: In, next: () => Promise<void>) => Promise<void>;

class Pipeline<Ctx extends Context = {}> {
  private middlewares: Function[] = [];

  use<Added extends Context>(
    mw: Middleware<Ctx, Ctx & Added>
  ): Pipeline<Ctx & Added> {
    this.middlewares.push(mw);
    return this as any;
  }

  async run(initialCtx: Ctx = {} as Ctx): Promise<Ctx> {
    const ctx = { ...initialCtx } as any;
    let idx = 0;
    const next = async (): Promise<void> => {
      if (idx < this.middlewares.length) {
        const mw = this.middlewares[idx++];
        await mw(ctx, next);
      }
    };
    await next();
    return ctx;
  }
}

const result = new Pipeline()
  .use(async (ctx, next) => {
    (ctx as any).startTime = Date.now();
    await next();
  })
  .use(async (ctx, next) => {
    (ctx as any).user = { id: 1, name: "Alice" };
    await next();
  })
  .run();

result.then(ctx => console.log(ctx));'''..language='typescript'..difficulty='very_hard'..section='Advanced Types'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='ts_040'..topicId='typescript'..title='Nominal Types via Classes'..description='Use private class fields to create nominal types that prevent accidental structural compatibility.'..code='''class Email {
  private readonly __brand = "Email" as const;
  private constructor(public readonly value: string) {}

  static create(input: string): Email {
    if (!/^[^@]+@[^@]+\\.[^@]+\$/.test(input)) {
      throw new Error("Invalid email");
    }
    return new Email(input);
  }
}

class URL {
  private readonly __brand = "URL" as const;
  private constructor(public readonly value: string) {}

  static create(input: string): URL {
    if (!input.startsWith("http")) {
      throw new Error("Invalid URL");
    }
    return new URL(input);
  }
}

function sendEmail(to: Email, link: URL): void {
  console.log(\x60Sending to \${to.value}: \${link.value}\x60);
}

const email = Email.create("alice@test.com");
const url = URL.create("https://example.com");
sendEmail(email, url);
// sendEmail(url, email);  // Type error!'''..language='typescript'..difficulty='very_hard'..section='Advanced Types'..isSaved=false..lastViewedAt=null,
  ];
}
