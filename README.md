# 📘 libasm

This project aims to implement several standard C library functions, entirely written in **x86-64 NASM assembly (Intel syntax 🛠️)**. \
It is designed to teach **low-level programming** 🧠, **calling conventions** 🔁, **memory manipulation** 🧩, and **interaction between C and assembly** ⚙️.

## Mandatory Part
| Function | Status |
| -------- | :---: |
| ft_strlen | ✅ |
| ft_strcpy | ✅ |
| ft_strcmp | ✅ |
| ft_write | ✅ |
| ft_read | ✅ |
| ft_strdup | ✅ |

## ⭐ Bonus Part
| Function | Status |
| -------- | :---: |
| ft_atoi_base | ✅ |
| ft_list_push_front | ❌ |
| ft_list_size | ❌ |
| ft_list_sort | ❌ |
| ft_list_remove_if | ❌ |

## 🛠 Compilation

### 📚 Compiling libraries
To compile both libraries (**libasm.a** and **libasm_bonus.a**), use:
```bash
make
```
or
```bash
make all
```

🔹To compile only one (mandatory or bonus):
```bash
make mandatory
```
or
```bash
make bonus
```

### ⚙️ Compiling executable
To build the executables:
```bash
make build_exec
```
or bonus:
```bash
make build_exec_bonus
```

## ▶️ Executing
There are several commands depending on what you need

### 🚀 Basic exec
For mandatory:
```bash
make exec
```

For bonus:
```base
make exec_bonus
```

### 🧪 Valgrind exec
<ins>For mandatory:</ins>
```bash
make valgrind
```
or shortcut:
```bash
make vm
```

<ins>For bonus:</ins>
```bash
make valgrind_bonus
```
or shortcut:
```bash
make vb
```
