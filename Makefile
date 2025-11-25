ASM = nasm
ASM_FLAGS = -felf64
CC = gcc
CFLAGS = -Wall -Werror -Wextra
AR = ar
ARFLAGS = rcs

M_DIR = mandatory
B_DIR = bonus

M_BUILD_DIR = $(M_DIR)/build
B_BUILD_DIR = $(B_DIR)/build

M_SRC_S = $(wildcard $(M_DIR)/*.s)
B_SRC_S = $(wildcard $(B_DIR)/*.s)

M_OBJ_S = $(patsubst $(M_DIR)/%.s,$(M_BUILD_DIR)/%.o,$(M_SRC_S))
B_OBJ_S = $(patsubst $(B_DIR)/%.s,$(B_BUILD_DIR)/%.o,$(B_SRC_S))

M_TEST_SRC = $(wildcard $(M_DIR)/tests/*.c)
B_TEST_SRC = $(wildcard $(B_DIR)/tests/*.c)

M_TEST_OBJ = $(patsubst $(M_DIR)/tests/%.c,$(M_BUILD_DIR)/%.o,$(M_TEST_SRC))
B_TEST_OBJ = $(patsubst $(B_DIR)/tests/%.c,$(B_BUILD_DIR)/%.o,$(B_TEST_SRC))

M_HEADER_FLAG = -I$(M_DIR)/tests
B_HEADER_FLAG = -I$(B_DIR)/tests

M_LIBASM = $(M_DIR)/libasm.a
B_LIBASM = $(B_DIR)/libasm_bonus.a

M_TARGET = $(M_DIR)/a.out
B_TARGET = $(B_DIR)/a.out

all: mandatory bonus

##############
# BUILD DIRS
##############

$(M_BUILD_DIR):
	mkdir -p $(M_BUILD_DIR)

$(B_BUILD_DIR):
	mkdir -p $(B_BUILD_DIR)

##############
# OBJECTS
##############

$(M_BUILD_DIR)/%.o: $(M_DIR)/%.s | $(M_BUILD_DIR)
	$(ASM) $(ASM_FLAGS) $< -o $@

$(B_BUILD_DIR)/%.o: $(B_DIR)/%.s | $(B_BUILD_DIR)
	$(ASM) $(ASM_FLAGS) $< -o $@

$(M_BUILD_DIR)/%.o: $(M_DIR)/tests/%.c | $(M_BUILD_DIR)
	$(CC) $(CFLAGS) $(M_HEADER_FLAG) -c $< -o $@

$(B_BUILD_DIR)/%.o: $(B_DIR)/tests/%.c | $(B_BUILD_DIR)
	$(CC) $(CFLAGS) $(B_HEADER_FLAG) -c $< -o $@

##############
# LIBRARIES
##############

$(M_LIBASM): $(M_OBJ_S)
	$(AR) $(ARFLAGS) $(M_LIBASM) $(M_OBJ_S)

$(B_LIBASM): $(B_OBJ_S)
	$(AR) $(ARFLAGS) $(B_LIBASM) $(B_OBJ_S)

##############
# EXECUTABLES
##############

$(M_TARGET): $(M_LIBASM) $(M_TEST_OBJ)
	$(CC) $(CFLAGS) $(M_HEADER_FLAG) $(M_TEST_OBJ) $(M_LIBASM) -o $(M_TARGET)

$(B_TARGET): $(B_LIBASM) $(B_TEST_OBJ)
	$(CC) $(CFLAGS) $(B_HEADER_FLAG) $(B_TEST_OBJ) $(B_LIBASM) -o $(B_TARGET)

##############
# RULES
##############

build_exec: $(M_TARGET)
build_exec_bonus: $(B_TARGET)

mandatory: $(M_LIBASM)
bonus: $(B_LIBASM)

m: mandatory
b: bonus

exec: $(M_TARGET)
	./$(M_TARGET)

exec_bonus: $(B_TARGET)
	./$(B_TARGET)

valgrind: $(M_TARGET)
	valgrind --leak-check=full --track-origins=yes --show-leak-kinds=all --track-fds=all ./$(M_TARGET)

vm: valgrind

valgrind_bonus: $(B_TARGET)
	valgrind --leak-check=full --track-origins=yes --show-leak-kinds=all --track-fds=all ./$(B_TARGET)

vb: valgrind_bonus

clean:
	rm -rf $(M_BUILD_DIR) $(B_BUILD_DIR)

fclean: clean
	rm -f $(M_LIBASM) $(B_LIBASM) $(M_TARGET) $(B_TARGET)

re: fclean all

.PHONY: all clean fclean re mandatory bonus exec exec_bonus m b valgrind valgrind_bonus vm vb build_exec
