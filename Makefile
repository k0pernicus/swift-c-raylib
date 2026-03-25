SWIFT_SDK = swift-6.3-RELEASE_wasm
WASM_BUILD_DIR = .build/wasm32-unknown-wasip1/debug/MyGame.build
SWIFT_OBJ = $(WASM_BUILD_DIR)/main.swift.o
RAYLIB_WASM = Sources/CRaylib/WASM/libraylib.a
WASI_STUBS = wasi_extra/wasi_stubs.o

SWIFT_WASI_LIB_PATH = $(HOME)/Library/org.swift.swiftpm/swift-sdks/$(SWIFT_SDK).artifactbundle/$(SWIFT_SDK)/wasm32-unknown-wasip1/swift.xctoolchain/usr/lib/swift_static/wasi

.PHONY: all run-mac build-wasm run-wasm clean

# Default target
all: run-mac

# macOS
run-mac:
	@echo "Building and running natively for macOS..."
	swift run

# WebAssembly
$(WASI_STUBS): wasi_extra/wasi_stubs.cpp
	@echo "Compiling WASI stubs..."
	em++ -c wasi_extra/wasi_stubs.cpp -o $(WASI_STUBS)

build-wasm: $(WASI_STUBS)
	@echo "[1/2] Compiling Swift to WebAssembly object file..."
	# swift build --swift-sdk $(SWIFT_SDK)
	@echo "[2/2] Linking with Emscripten..."
	em++ $(SWIFT_OBJ) $(RAYLIB_WASM) $(WASI_STUBS) \
		-L$(SWIFT_WASI_LIB_PATH) \
		-lswiftCore \
		-s USE_GLFW=3 \
		-s ASYNCIFY \
		-o index.html
	@echo "Web build complete! (index.html generated)"

run-wasm: build-wasm
	@echo "Starting local web server..."
	@echo "Open your browser to: http://localhost:8080/index.html"
	python3 -m http.server 8080

# Cleanup
clean:
	@echo "Cleaning up build artifacts..."
	swift package clean
	rm -f index.html index.js index.wasm $(WASI_STUBS)
