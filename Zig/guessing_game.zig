const std = @import("std");
const endian = @import("builtin").target.cpu.arch.endian();

pub fn main() !void {
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.posix.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });

    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();

    const n = prng.random().intRangeAtMost(i32, 1, 100);
    var step: i32 = 1;

    try stdout.writeAll("You should guess the number in range 1 .. 100\n");

    var buffer: [20]u8 = undefined;
    while (true) {
        try stdout.writeAll("Enter your guess: ");
        const result = try stdin.readUntilDelimiterOrEof(&buffer, '\n') orelse return error.ReadError;
        const guess = std.fmt.parseInt(i32, result, 10) catch {
            try stdout.writeAll("You entered bullshit\n");
            continue;
        };

        if (guess < n) {
            try stdout.writeAll("Your guess is too low :(\n");
        } else if (guess > n) {
            try stdout.writeAll("Your guess is too high :(\n");
        } else {
            break;
        }

        step += 1;
    }

    try stdout.print("You won in {} steps!\n", .{step});
}
