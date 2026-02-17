# Mini Projects In Zig

I've am learning Zig language. To master it, I've asked ChatGPT to give me 20 mini projects that will take me from beginner to advanced level. Below are the projects, I've organized from what it gave me.

## LEVEL 1 — Core CLI & Data Handling

---

## 1️. CLI Calculator

### Use Case

A lightweight terminal calculator for quick arithmetic inside scripts.

### Functional Requirements

- Accept exactly 3 CLI arguments: `<number> <operator> <number>`
- Supported operators: `+ - * /`
- Detect:
    - Invalid numbers
    - Invalid operator
    - Divide-by-zero
    - Integer overflow
- Print result to stdout
- Print errors to stderr
- Exit with non-zero status on failure

### Example

```
$ calc 10 + 20
30

$ calc 5 / 0
Error: DivisionByZero
```

### Non-Goals

- No floating-point support
- No interactive mode

---

## 2️. Word Count Tool (`zwc`)

### Use Case

Analyze logs or large text files efficiently.

### Functional Requirements

- Accept filename as argument
- Output:
    - Line count
    - Word count
    - Byte count
- Must read file in chunks (not load fully)
- Handle files > 500MB
- Handle UTF-8 correctly

### Example

```
$ zwc file.txt
Lines: 120
Words: 890
Bytes: 5600
```

### Non-Goals

- No colored output
- No recursive directory support

---

## 3️. Growable String Builder

### Use Case

Efficiently build large strings (e.g., JSON, HTML).

### Functional Requirements

- Struct:
    - buffer pointer
    - capacity
    - length
- Operations:
    - append(string)
    - insert(index, string)
    - delete(start, end)
    - toSlice()
    - free()
- Automatic resizing
- No memory leaks

### Example

```
builder.append("Hello");
builder.append(" World");
=> "Hello World"
```

### Non-Goals

- No Unicode validation

---

## 4️. Config File Loader

### Use Case

Load application configuration from file.

### Functional Requirements

- Input format:
```
  key=value
```
- Ignore blank lines
- Ignore lines starting with `#`
- Trim whitespace
- Validate known keys
- Return structured config

### Example

```
port=8080
debug=true
```

Produces:

```
Config { port = 8080, debug = true }
```

### Non-Goals

- No nested config
- No arrays

---

## 5️. CSV Parser

### Use Case

Process CSV exports from spreadsheets.

### Functional Requirements

- Parse comma-separated values
- Handle quoted fields
- Handle escaped quotes
- Stream file (don’t load full file)
- Return rows iteratively

### Example

```
name,age
zig,7
```

---

# LEVEL 2 — Data Structures & Memory

---

## 6️. Generic Dynamic Array

### Use Case

Reusable resizable container for any type.

### Requirements

- Generic over type
- push
- pop
- get(index)
- resize
- free
- Double capacity strategy

### Example

```
var list = Array(i32);
list.push(10);
```

---

## 7️. Linked List Library

### Use Case

Alternative to dynamic arrays for unknown sizes.

### Requirements

- Generic
- pushFront
- pushBack
- remove(value)
- iterate
- free all nodes

---

## 8️. RPN Calculator

### Use Case

Evaluate postfix math expressions.

### Requirements

- Read expression string
- Tokenize by space
- Use stack
- Support + - * /
- Detect malformed expressions

### Example

```
3 4 + 2 * 7 /
Result: 2
```

---

## 9️. Arena Allocator

### Use Case

Fast allocation for short-lived objects.

### Requirements

- Preallocate block
- Serve aligned allocations
- Reset function
- Track used bytes

---

## 10. Logger Library

### Use Case

Structured logging for CLI apps.

### Requirements

- Levels: DEBUG, INFO, WARN, ERROR
- Compile-time disable DEBUG
- Timestamp
- Output to stdout or file

---

# LEVEL 3 — Systems Programming

---

## 1️1. Mini Grep

### Use Case

Search logs for patterns.

### Requirements

- Pattern string argument
- Filename argument
- Print matching lines
- Print line numbers
- Efficient scanning

---

## 1️2. Minimal JSON Parser

### Use Case

Parse small JSON config.

### Requirements

- Parse objects only
- Support:
    - strings
    - numbers
    - booleans
- Reject invalid JSON
- No external library

---

## 1️3. TCP Echo Server

### Use Case

Learn networking fundamentals.

### Requirements

- Listen on port
- Accept multiple clients
- Echo messages
- Close cleanly on disconnect

---

## 1️4. Thread Pool

### Use Case

Parallel job execution.

### Requirements

- Fixed worker count
- Job queue
- Submit jobs
- Graceful shutdown
- No race conditions

---

## 1️5. Parallel File Hasher

### Use Case

Speed up large file hashing.

### Requirements

- Split file into chunks
- Multiple threads
- Combine SHA-256 hashes
- Print final hash

---

# LEVEL 4 — Advanced Systems Design

---

## 1️6. Plugin System

### Use Case

Extend program without recompiling.

### Requirements

- Load shared library (.so)
- Known interface function
- Call function dynamically
- Handle load errors safely

---

## 1️7. Mini Shell

### Use Case

Understand process control.

### Requirements

- Read user input
- Execute commands
- Support simple pipe (`|`)
- Exit command

---

## 1️8. Text Buffer Engine

### Use Case

Core of a text editor.

### Requirements

- Load file
- Insert at index
- Delete range
- Save file
- Efficient resizing

---

## 1️9. Undo/Redo System

### Use Case

Extend text editor safely.

### Requirements

- Stack-based undo
- Stack-based redo
- Memory safe
- No leaks

---

## 2️0. Persistent Key-Value Store

### Use Case

Lightweight embedded database.

### Requirements

- CLI:
```
   set key value
   get key
   delete key
```
- Persist to disk
- Load on startup
- Handle corrupted file safely

---

# If You Finish All 20 Properly

You will have built:

- Custom data structures
- Allocators
- Parsers
- Network servers
- Thread systems
- Plugin systems
- Storage engine
- Editor core