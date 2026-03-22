import CRaylib

let screenWidth: Int32 = 800
let screenHeight: Int32 = 600

#if os(WASI)
    InitWindow(screenWidth, screenHeight, "WASM C Raylib from Swift!")
#else
    InitWindow(screenWidth, screenHeight, "Raw C Raylib from Swift!")
#endif
SetTargetFPS(60)

let rayWhite = Color(r: 245, g: 245, b: 245, a: 255)
let darkGray = Color(r: 80, g: 80, b: 80, a: 255)

while !WindowShouldClose() {

    BeginDrawing()

    ClearBackground(rayWhite)
    DrawText("It's alive... ALIVE!", 300, 300, 20, darkGray)

    EndDrawing()
}

CloseWindow()
