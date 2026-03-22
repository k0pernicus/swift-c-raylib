// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "MyGame",
    targets: [
        .target(
            name: "craylib",
            path: "Sources/CRaylib",
            publicHeadersPath: ".",
            linkerSettings: [
                .unsafeFlags(["-L", "Sources/CRaylib/macOS"], .when(platforms: [.macOS])),
                // Link required macOS graphics frameworks
                .linkedFramework("OpenGL", .when(platforms: [.macOS])),
                .linkedFramework("Cocoa", .when(platforms: [.macOS])),
                .linkedFramework("IOKit", .when(platforms: [.macOS])),
                .linkedFramework("CoreVideo", .when(platforms: [.macOS])),

                // WASM only
                .unsafeFlags(["-L", "Sources/CRaylib/WASM"], .when(platforms: [.wasi])),
            ]
        ),
        .executableTarget(
            name: "MyGame",
            dependencies: ["craylib"]
        ),
    ]
)
