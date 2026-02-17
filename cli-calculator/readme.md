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

