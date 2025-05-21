const std = @import("std");

pub fn main() !void {
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.posix.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });
    const rand = prng.random();

    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();

    const n = rand.intRangeAtMost(i32, 1, 100);
    var step: i32 = 1;

    try stdout.writeAll("You should guess the number in range 1 .. 100\n");

    var buffer: [20]u8 = undefined;
    while (true) {
        try stdout.writeAll("Enter your guess: ");
        const result = stdin.readUntilDelimiterOrEof(&buffer, '\n') catch |err| switch (err) {
            error.StreamTooLong => {
                try stdin.skipUntilDelimiterOrEof('\n');
                try stdout.writeAll("You entered bullshit\n");
                continue;
            },
            else => return err,
        } orelse {
            try stdout.writeAll("\nGame cancelled\n");
            return;
        };
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
