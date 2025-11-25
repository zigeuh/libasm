#ifndef LIBASM_H
    # define LIBASM_H

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

size_t _ft_strlen(const char*);
char *_ft_strcpy(char*, const char*);
int _ft_strcmp(const char *s1, const char *s2);
ssize_t _ft_write(int fd, const void *buf, size_t count);
ssize_t _ft_read(int fd, void *buf, size_t count);
char *_ft_strdup(const char *s);

void ft_strlen_tests();

#endif