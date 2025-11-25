#include "libasm.h"

void ft_strcmp_tests() {

    printf("##############################################\n");
    printf("#                   strcmp                   #\n");
    printf("##############################################\n");

    char *s1 = "Hello";
    char *s2 = "Yes";

    printf("\n1. Equals:\n");

    printf("_ft_strcmp: %d\n", _ft_strcmp("Hello", "Hello"));
    printf("strcmp: %d\n", strcmp("Hello", "Hello"));

    printf("\n2. s1 lesser than s2:\n");

    printf("_ft_strcmp: %d\n", _ft_strcmp(s1, s2));
    printf("strcmp: %d\n", strcmp(s1, s2));

    printf("\n3. s1 greater than s2:\n");

    printf("_ft_strcmp: %d\n", _ft_strcmp(s2, s1));
    printf("strcmp: %d\n", strcmp(s2, s1));

    printf("\n4. Empty:\n");

    printf("_ft_strcmp: %d\n", _ft_strcmp("", ""));
    printf("strcmp: %d\n", strcmp("", ""));

    printf("\n");
}