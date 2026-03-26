import CRaylib
import ImGui

let screenWidth: Int32 = 1200
let screenHeight: Int32 = 800

InitWindow(screenWidth, screenHeight, "Swift + Raylib + ImGui")
SetTargetFPS(60)

let rayWhite = Color(r: 245, g: 245, b: 245, a: 255)
let darkGray = Color(r: 80, g: 80, b: 80, a: 255)

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
