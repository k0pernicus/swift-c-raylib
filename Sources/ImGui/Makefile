CXX = clang++
AR = ar

RAYLIB_INCLUDE = ../CRaylib

BUILD_DIR = macOS

CXXFLAGS = -std=c++11 -O2 -I. -I$(RAYLIB_INCLUDE)

SRCS = imgui.cpp imgui_draw.cpp imgui_tables.cpp imgui_widgets.cpp imgui_demo.cpp rlImGui.cpp

OBJS = $(SRCS:%.cpp=$(BUILD_DIR)/%.o)

TARGET = $(BUILD_DIR)/libimgui.a

.PHONY: all clean

all: $(TARGET)

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: %.cpp | $(BUILD_DIR)
	@echo "Compiling $<..."
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	@echo "Archiving into $(TARGET)..."
	$(AR) rcs $@ $^
	@echo "Cleaning the objects in ${BUILD_DIR}"
	rm ${BUILD_DIR}/*.o
	@echo "Build complete: $(TARGET)"

clean:
	@echo "Cleaning up build directory..."
	rm -rf $(BUILD_DIR)
