# Swift, C, and Raylib

A test project for [my blog post "Testing the Swift C compatibility with Raylib"](https://carette.xyz/posts/swift_c_compatibility_with_raylib/).

## Build

Make sure you installed:

* Swift 6.2.4
* [WASM SDK for Swift](https://www.swift.org/documentation/articles/wasm-getting-started.html)
* make

To run on macOS: `make run-mac`

To run using WASI: `make run-wasm`

## Update (26th of March)

Based on some cricisms over my blog post I included Dear ImGui as a dependency of this project to demonstrate how easy it is to use a C++ codebase in a Swift project.

The ImGui integration is currently **not** in the WASM build.
