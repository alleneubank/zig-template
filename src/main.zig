const std = @import("std");
const lib = @import("zig_template");

pub fn main(init: std.process.Init) std.Io.Writer.Error!void {
    const file = std.Io.File.stdout();
    var buf: [4096]u8 = undefined;
    var writer: std.Io.File.Writer = .initStreaming(file, init.io, &buf);
    const w = &writer.interface;

    try w.print("zig-template v{s}\n", .{lib.version});
    try w.print("2 + 3 = {d}\n", .{lib.add(2, 3)});
    try w.flush();
}

test "library import" {
    try std.testing.expectEqual(@as(i32, 2), lib.add(1, 1));
}
