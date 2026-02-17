const std = @import("std");

const ArgsError = error{InvalidArguments};

pub fn main() !void {
    const args = try std.process.argsAlloc(std.heap.page_allocator);

    if (args.len < 2) {
        return ArgsError.InvalidArguments;
    }

    for (args, 0..) |arg, i| {
        if (i == 0) continue;
        std.debug.print("Arg {d}: {s}, Type is : {s}\n", .{ i, arg, @typeName(@TypeOf(arg)) });
    }

    defer std.process.argsFree(std.heap.page_allocator, args);
}
