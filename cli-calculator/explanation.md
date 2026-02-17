## Explanation

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
 
We can import standard library using :

```zig
const std = @import("std");
```

### Errors

An error set is like an `enum`, where each error in the set is a value.

```zig
const FileOpenError = error {
	AccessDenied,
	OutOfMemory,
	FileNotFound
};
```

We can use the error using :

```zig
const err = FileOpenError.OutOfMemory;
```

We can define the error union type using `!i32`. Here `i32` is the type, and by adding `!` infront of the type means, saying that function may fail and return error. That means, it can properly run and return `i32` value or it can fail and return error.

For example :

```zig
fn divide(a: i32, b: i32) !i32 {
	if(b == 0) {
		return error.DivideByZero;
	}
	
	return a / b;
}
```

Here, the function `divide` returns either `i32` number or return error.

We can use `try` to fail the program when it returns an error.

```zig
const result = try divide(10, 2);
```

By using `try`, it can unwrap the value if success, or it will return error if fails.

```zig
pub fn main() !void {
	const result = try divide(10, 2);
	std.debug.print("Result: {d}\n", .{result});
}
```

By using `!void` on main means, if `divide` fails, program exits with an error.

We can use `catch` to handle errors manually, without exiting the program.

```zig
const result = divide(10, 0) catch |err| {
	std.debug.print("Error occured: {s}\n", .{@errorName(err)});
	return;
};
```

So, if `divide` succeeds, it returns the value. If it fails, it will execute the `catch` block.

We can also return default value using `catch`.

```zig
const result = divide(10, 0) catch 0;
```

It means if `divide` returns error, it will use `0` as default value.

We can get the name of the error by using :

```zig
print("{s}\n", .{@errorName(error.DivideByZero)});
```

In Zig, we can't ignore errors silently, or it will show compile error.

We can use `if .. else` statements to handle errors too.

```zig
if(divide(10, 2)) |value| {
	print("Value: {d}\n", .{value});
} else |err| {
	print("Error: {s}\n", .{@errorName(err)});
}
```

From the above syntax, it will return `value` if divide success, and it will return `err` if it fails.

#### Error unions vs Optionals

Zig has two similar but different types :

| Type | Meaning                  |
| ---- | ------------------------ |
| `?T` | Optional (null or value) |
| `!T` | Error or value           |
