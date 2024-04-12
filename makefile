# Compiler and flags
CXX := g++
CXXFLAGS := -std=c++11 -Wall -Wextra

# Directories
SRC_DIR := src
BIN_DIR := bin

# Source files
SRCS := $(wildcard $(SRC_DIR)/*.cpp)

# Object files (without extension)
OBJS := $(patsubst $(SRC_DIR)/%.cpp,$(BIN_DIR)/%,$(SRCS))

# Main target
all: $(OBJS)

# Rule to create object files
$(BIN_DIR)/%: $(SRC_DIR)/%.cpp | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) $< -o $@

# Create bin directory if it doesn't exist
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Clean rule
clean:
	rm -rf $(BIN_DIR)

.PHONY: all clean
