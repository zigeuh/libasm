# 📘 libasm

This project aims to implement several standard C library functions, entirely written in **x86-64 NASM assembly (Intel syntax 🛠️)**. \
It is designed to teach **low-level programming** 🧠, **calling conventions** 🔁, **memory manipulation** 🧩, and **interaction between C and assembly** ⚙️.

## ✅ Mandatory Part
| Function  | Status |
| --------- | :----: |
| ft_strlen | ✅ |
| ft_strcpy | ✅ |
| ft_strcmp | ✅ |
| ft_write  | ✅ |
| ft_read   | ✅ |
| ft_strdup | ✅ |

## ⭐ Bonus Part
|      Function      | Status |
| ------------------ | :----: |
| ft_atoi_base       | ✅ |
| ft_list_push_front | ✅ |
| ft_list_size       | ✅ |
| ft_list_sort       | ✅ |
| ft_list_remove_if  | ❌ |

## 🛠 Compilation

### 📚 Compiling libraries
To compile **libasm.a**, use:
```bash
make
```
or with bonus:
```bash
make bonus
```

### ⚙️ Compiling executable
<ins>To build the mandatory executable:</ins>
```bash
make build_exec
```
or shortcut:
```bash
make bem
```

<ins>For the bonus executable:</ins>
```bash
make build_exec_bonus
```
or shortcut:
```bash
make beb
```

## ▶️ Executing
There are several commands depending on what you need

### 🚀 Basic exec
<ins>For mandatory:</ins>
```bash
make exec
```
or shortcut:
```bash
make em
```

<ins>For bonus:</ins>
```base
make exec_bonus
```
or shortcut:
```bash
make eb
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

## List of all Makefile commands
|      Command      | Description                                                               | Aliases |
| ----------------- | ------------------------------------------------------------------------- | :-----: |  
| all               | Compile the mandatory part of the libasm.a                                | -       | 
| mandatory         | Same as all                                                               | m       |
| bonus             | Compile the bonus and mandatory part of the libasm.a                      | b       | 
| exec              | Execute the mandatory part test program                                   | em      |
| exec_bonus        | Execute the bonus part test program                                       | eb      |
| exec_all          | Execute the mandatory and bonus part test programs                        | ea      |
| build_exec        | Build the mandatory part test program                                     | bem     |
| build_exec_bonus  | Build the bonus part test program                                         | beb     |
| build_exec_all    | Build the mandatory and bonus part test programs                          | bea     |
| valgrind          | Execute the mandatory part test program with valgrind                     | vm      |
| valgrind_bonus    | Execute the bonus part test program with valgrind                         | vb      |
| clean             | Clean all the .o of the project                                           | -       |
| fclean            | Run clean command + clean libasm.a, executables and others files created  | -       |
| valgrind_bonus    | Execute the bonus part test program with valgrind                         | -       |
