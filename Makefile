NAME = libasm.a

BUILD_DIR = build
MANDATORY_DIR = mandatory
BONUS_DIR = bonus

CC = gcc
CFLAGS = -g3 -Wall -Werror -Wextra

NASM = nasm
NASM_FLAGS = -f elf64

AR = ar
AR_FLAGS = rcs

VALGRIND_FLAGS = --leak-check=full --track-origins=yes --show-leak-kinds=all --track-fds=all

M_HEADER_FLAG = -I$(MANDATORY_DIR)/tests
B_HEADER_FLAG = -I$(BONUS_DIR)/tests $(M_HEADER_FLAG)

M_TARGET = $(MANDATORY_DIR)/a.out
B_TARGET = $(BONUS_DIR)/a.out

M_BUILD_DIR = $(MANDATORY_DIR)/build
B_BUILD_DIR = $(BONUS_DIR)/build

##############
# COLORS
##############

GREEN = \033[0;32m
BLUE = \033[0;34m
CYAN = \033[0;36m
YELLOW = \033[0;33m
RED = \033[0;31m
MAGENTA = \033[0;35m
RESET = \033[0m


##############
# ASM OBJECTS
##############

MANDATORY_SRCS = $(shell find $(MANDATORY_DIR) -name "*.s" 2>/dev/null)
MANDATORY_OBJS = $(patsubst $(MANDATORY_DIR)/%.s,$(BUILD_DIR)/%.o,$(MANDATORY_SRCS))

BONUS_SRCS = $(shell find $(BONUS_DIR) -name "*.s" 2>/dev/null)
BONUS_OBJS = $(patsubst $(BONUS_DIR)/%.s,$(BUILD_DIR)/%.o,$(BONUS_SRCS))

##############
# TEST OBJECTS
##############

M_TEST_SRC = $(shell find $(MANDATORY_DIR) -name "*.c" 2>/dev/null)
B_TEST_SRC = $(shell find $(BONUS_DIR) -name "*.c" 2>/dev/null)

M_TEST_OBJ = $(patsubst $(MANDATORY_DIR)/tests/%.c,$(M_BUILD_DIR)/%.o,$(M_TEST_SRC))
B_TEST_OBJ = $(patsubst $(BONUS_DIR)/tests/%.c,$(B_BUILD_DIR)/%.o,$(B_TEST_SRC))

##############
# BUILD
##############

$(NAME): $(BUILD_DIR) $(MANDATORY_OBJS)
	@$(AR) $(AR_FLAGS) $(NAME) $(MANDATORY_OBJS)
	@echo "$(GREEN)[✓] Library built: $(NAME)$(RESET)"

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: $(MANDATORY_DIR)/%.s | $(BUILD_DIR)
	@$(NASM) $(NASM_FLAGS) -o $@ $<
	@echo "$(CYAN)[⚙] Compiled: $@$(RESET)"

$(BUILD_DIR)/%.o: $(BONUS_DIR)/%.s | $(BUILD_DIR)
	@$(NASM) $(NASM_FLAGS) -o $@ $<
	@echo "$(CYAN)[⚙] Compiled: $@$(RESET)"

$(M_BUILD_DIR):
	@mkdir -p $(M_BUILD_DIR)

$(M_BUILD_DIR)/%.o: $(MANDATORY_DIR)/tests/%.c | $(M_BUILD_DIR)
	@$(CC) $(CFLAGS) $(M_HEADER_FLAG) -c $< -o $@
	@echo "$(CYAN)[⚙] Compiled: $@$(RESET)"

$(B_BUILD_DIR):
	@mkdir -p $(B_BUILD_DIR)

$(B_BUILD_DIR)/%.o: $(BONUS_DIR)/tests/%.c | $(B_BUILD_DIR)
	@$(CC) $(CFLAGS) $(B_HEADER_FLAG) -c $< -o $@
	@echo "$(CYAN)[⚙] Compiled: $@$(RESET)"

##############
# EXECUTABLES
##############

$(M_TARGET): $(NAME) $(M_TEST_OBJ)
	@$(CC) $(CFLAGS) $(M_HEADER_FLAG) $(M_TEST_OBJ) $(NAME) -o $(M_TARGET)
	@echo "$(GREEN)[✓] Mandatory executable built: $(M_TARGET)$(RESET)"

$(B_TARGET): .bonus $(B_TEST_OBJ)
	@$(CC) $(CFLAGS) $(B_HEADER_FLAG) $(B_TEST_OBJ) $(NAME) -o $(B_TARGET)
	@echo "$(GREEN)[✓] Bonus executable built: $(B_TARGET)$(RESET)"

##############
# RULES
##############

all: $(NAME)

mandatory: all

bonus: .bonus

.bonus: $(MANDATORY_OBJS) $(BONUS_OBJS)
	@$(AR) $(AR_FLAGS) $(NAME) $(MANDATORY_OBJS) $(BONUS_OBJS)
	@touch .bonus
	@echo "$(GREEN)[✓] Library built with bonus: $(NAME)$(RESET)"

m: mandatory
b: bonus

exec: build_exec
	./$(M_TARGET)

exec_bonus: build_exec_bonus
	./$(B_TARGET)

em: exec
eb: exec_bonus
ea: exec exec_bonus

build_exec: $(M_TARGET)
build_exec_bonus: $(B_TARGET)

bem: build_exec
beb: build_exec_bonus
bea: bem beb

valgrind: $(M_TARGET)
	valgrind $(VALGRIND_FLAGS) ./$(M_TARGET)

valgrind_bonus: $(B_TARGET)
	valgrind $(VALGRIND_FLAGS) ./$(B_TARGET)

vm: valgrind
vb: valgrind_bonus

clean:
	@rm -rf $(BUILD_DIR) $(M_BUILD_DIR) $(B_BUILD_DIR)
	@echo "$(YELLOW)[🗑] Objects cleaned$(RESET)"

fclean: clean
	@rm -f $(NAME) $(M_TARGET) $(B_TARGET) .bonus write_tests
	@echo "$(RED)[🗑] Full clean done$(RESET)"

re: fclean all

.PHONY: all mandatory bonus m b exec exec_bonus em eb ea build_exec build_exec_bonus bem beb bea valgrind valgrind_bonus vm vb clean fclean re