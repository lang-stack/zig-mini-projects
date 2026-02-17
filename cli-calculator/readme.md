# 1. CLI Calculator

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
# Solution

### Standard library

Zig's standard library is a collection of resusable modules written in Zig itself.

You can literally open the path `/usr/lib/zig/std` and read everything.

Standard library contains below modules :

| Module        | Usage               |
| ------------- | ------------------- |
| `std.io`      | Input/Output        |
| `std.mem`     | Memory utilities    |
| `std.heap`    | Allocators          |
| `std.fs`      | File system         |
| `std.process` | Process + arguments |
| `std.net`     | Networking          |
| `std.math`    | Math                |
| `std.fmt`     | Formatting          |
| `std.crypto`  | Cryptography        |
| `std.json`    | JSON Parsing        |
| `std.testing` | Unit Testing        |
| `std.debug`   | Debug Printing      |
 
