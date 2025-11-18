ASM = nasm
ASM_FLAGS = -felf64
CC = gcc
CFLAGS = -g3
AR = ar
ARFLAGS = rcs

BUILD_DIR = build
SRC_S = $(wildcard *.s)
OBJ_S = $(patsubst %.s,$(BUILD_DIR)/%.o,$(SRC_S))

MAIN = main.c
TARGET = a.out
LIBASM = libasm.a

all: $(BUILD_DIR) $(LIBASM) $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: %.s | $(BUILD_DIR)
	$(ASM) $(ASM_FLAGS) $< -o $@

$(LIBASM): $(OBJ_S)
	$(AR) $(ARFLAGS) $(LIBASM) $(OBJ_S)

$(TARGET): $(MAIN) $(LIBASM)
	$(CC) $(CFLAGS) $(MAIN) -L. -lasm -o $(TARGET)

valgrind: $(TARGET)
	valgrind --leak-check=full --track-origins=yes ./$(TARGET)

clean:
	rm -rf $(BUILD_DIR) $(TARGET) $(LIBASM)