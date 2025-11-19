ASM = nasm
ASM_FLAGS = -felf64
CC = gcc
CFLAGS = -g3
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

M_MAIN = $(M_DIR)/main.c
M_TARGET = $(M_DIR)/a.out
M_LIBASM = $(M_DIR)/libasm.a

B_MAIN = $(B_DIR)/main.c
B_TARGET = $(B_DIR)/a.out
B_LIBASM = $(B_DIR)/libasm_bonus.a

all: mandatory bonus

##############
# MANDATORY
##############

$(M_BUILD_DIR):
	mkdir -p $(M_BUILD_DIR)

$(M_BUILD_DIR)/%.o: $(M_DIR)/%.s | $(M_BUILD_DIR)
	$(ASM) $(ASM_FLAGS) $< -o $@

$(M_LIBASM): $(M_OBJ_S)
	$(AR) $(ARFLAGS) $(M_LIBASM) $(M_OBJ_S)

$(M_TARGET): $(M_MAIN) $(M_LIBASM)
	$(CC) $(CFLAGS) $(M_MAIN) $(M_LIBASM) -o $(M_TARGET)

mandatory: $(M_TARGET)
m: mandatory

##############
# BONUS
##############

$(B_BUILD_DIR):
	mkdir -p $(B_BUILD_DIR)

$(B_BUILD_DIR)/%.o: $(B_DIR)/%.s | $(B_BUILD_DIR)
	$(ASM) $(ASM_FLAGS) $< -o $@

$(B_LIBASM): $(B_OBJ_S)
	$(AR) $(ARFLAGS) $(B_LIBASM) $(B_OBJ_S)

$(B_TARGET): $(B_MAIN) $(B_LIBASM)
	$(CC) $(CFLAGS) $(B_MAIN) $(B_LIBASM) -o $(B_TARGET)

bonus: $(B_TARGET)
b: bonus

##############
# COMMANDS
##############

exec: $(M_TARGET)
	./$(M_TARGET)

exec_bonus: $(B_TARGET)
	./$(B_TARGET)

valgrind: $(M_TARGET)
	valgrind --leak-check=full --track-origins=yes ./$(M_TARGET)

v: valgrind

valgrind_bonus: $(B_TARGET)
	valgrind --leak-check=full --track-origins=yes ./$(B_TARGET)

vb: valgrind_bonus

clean:
	rm -rf $(M_BUILD_DIR) $(B_BUILD_DIR)

fclean: clean
	rm -f $(M_LIBASM) $(B_LIBASM) $(M_TARGET) $(B_TARGET)

re: fclean all

.PHONY: all clean fclean re mandatory bonus exec exec_bonus m b valgrind valgrind_bonus v vb
