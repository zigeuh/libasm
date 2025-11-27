#ifndef LIBASM_H
    # define LIBASM_H

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>

size_t ft_strlen(const char*);
char *ft_strcpy(char*, const char*);
int ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char *ft_strdup(const char *s);

void ft_strlen_tests();
void ft_strcpy_tests();
void ft_strcmp_tests();
void ft_write_tests();
void ft_read_tests();
void ft_strdup_tests();

#endif