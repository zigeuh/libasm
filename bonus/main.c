#include <stdio.h>

int ft_atoi_base(char *arg1, char *arg2);

int main(void) {
    printf("%d\n", ft_atoi_base("-9", "0123456789ABCDEF"));
}