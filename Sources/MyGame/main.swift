import CRaylib

#if os(macOS)
    import ImGui
#endif

let screenWidth: Int32 = 1200
let screenHeight: Int32 = 800

#if os(macOS)
    InitWindow(screenWidth, screenHeight, "Swift + Raylib + ImGui")
#else
    InitWindow(screenWidth, screenHeight, "Swift + Raylib + WASM")
#endif
SetTargetFPS(60)

let rayWhite = Color(r: 245, g: 245, b: 245, a: 255)
let darkGray = Color(r: 80, g: 80, b: 80, a: 255)

#if os(WASI)

    while !WindowShouldClose() {
        BeginDrawing()
        ClearBackground(rayWhite)
        DrawText("It's alive... ALIVE!", 300, 300, 20, darkGray)
        EndDrawing()
    }
    CloseWindow()

#else

    rlImGuiSetup(true)
    var showDemoWindow = true
    while !WindowShouldClose() {
        BeginDrawing()

        ClearBackground(rayWhite)
        DrawText("It's alive... ALIVE!", 300, 300, 20, darkGray)

        rlImGuiBegin()

        if showDemoWindow {
            ImGui.ShowDemoWindow(&showDemoWindow)
        }

        rlImGuiEnd()

        EndDrawing()
    }

    rlImGuiShutdown()
    CloseWindow()

#endif
