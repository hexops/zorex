const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const lib = b.addStaticLibrary("template", "src/zorex.zig");
    lib.setBuildMode(mode);
    lib.install();

    var main_tests = b.addTest("src/zorex.zig");
    main_tests.test_evented_io = true;
    main_tests.setBuildMode(mode);
    main_tests.setMainPkgPath("src/");

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
