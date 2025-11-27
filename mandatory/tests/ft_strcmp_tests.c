#include "libasm.h"

void ft_strcmp_tests() {

    char *s1 = "Hello";
    char *s2 = "Yes";

    printf("##############################################\n");
    printf("#                   strcmp                   #\n");
    printf("##############################################\n");

    printf("\n1. Equals:\n");

    printf("ft_strcmp: %d\n", ft_strcmp("Hello", "Hello"));
    printf("strcmp: %d\n", strcmp("Hello", "Hello"));

    printf("\n2. s1 lesser than s2:\n");

    printf("ft_strcmp: %d\n", ft_strcmp(s1, s2));
    printf("strcmp: %d\n", strcmp(s1, s2));

    printf("\n3. s1 greater than s2:\n");

    printf("ft_strcmp: %d\n", ft_strcmp(s2, s1));
    printf("strcmp: %d\n", strcmp(s2, s1));

    printf("\n4. Empty:\n");

    printf("ft_strcmp: %d\n", ft_strcmp("", ""));
    printf("strcmp: %d\n", strcmp("", ""));

    printf("\n");
}