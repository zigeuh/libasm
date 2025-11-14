# Makefile optimisé pour NASM + GCC

ASM = nasm
ASM_FLAGS = -felf64
CC = gcc
CFLAGS = -g3

BUILD_DIR = build
SRC_S = $(wildcard *.s)
OBJ_S = $(patsubst %.s,$(BUILD_DIR)/%.o,$(SRC_S))
MAIN = main.c
TARGET = a.out

all: $(BUILD_DIR) $(TARGET) valgrind

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: %.s | $(BUILD_DIR)
	$(ASM) $(ASM_FLAGS) $< -o $@

$(TARGET): $(OBJ_S) $(MAIN)
	$(CC) $(CFLAGS) $(MAIN) $(OBJ_S) -o $(TARGET)

valgrind: $(TARGET)
	valgrind --leak-check=full --track-origins=yes ./$(TARGET)

clean:
	rm -rf $(BUILD_DIR) $(TARGET)
