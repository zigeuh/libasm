#include "libasm.h"

void ft_read_tests() {

    char s1[500] = {0};
    char s2[500] = {0};

    printf("##############################################\n");
    printf("#                    read                    #\n");
    printf("##############################################\n");

    // stdout
    printf("\n1. Read in stdin:\n");

    printf("_ft_read: %ld\n", _ft_read(0, s1, 500));
    printf("s1: %s\n", s1);
    printf("read: %ld\n", read(0, s2, 500));
    printf("s2: %s\n", s2);

    printf("\n2. Read in file:\n");

    memset(s1, 0, strlen(s1));
    memset(s2, 0, strlen(s2));
    int fd = open("Makefile", O_RDONLY, 0644);
    if (fd < 0) {
        perror("Error while opening Makefile: ");
    } else {
        printf("_ft_read: %ld\n", _ft_read(fd, s1, 10));
        printf("s1: %s\n", s1);
        lseek(fd, 0, SEEK_SET);
        printf("read: %ld\n", read(fd, s2, 10));
        printf("s2: %s\n", s2);

        close(fd);  
    }

    printf("\n3. Read in invalid fd:\n");

    memset(s1, 0, strlen(s1));
    memset(s2, 0, strlen(s2));
    printf("_ft_read: %ld\n", _ft_read(-1, s1, 50));
    printf("s1: %s\n", s1);
    printf("read: %ld\n", read(-1, s2, 50));
    printf("s2: %s\n", s2);

    printf("\n");
}