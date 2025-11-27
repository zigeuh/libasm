#include "libasm_bonus.h"

void ft_atoi_base_tests() {

    printf("##############################################\n");
    printf("#                ft_atoi_base                #\n");
    printf("##############################################\n");

    printf("\n");

    printf("Base 2, 1010 in decimal: ");
    printf("%d\n", ft_atoi_base("1010", "01")); // 10
    printf("Base 2, -1010 in decimal: ");
    printf("%d\n", ft_atoi_base("-1010", "01")); // -10
    
    printf("\n");

    printf("Base 3, 102 in decimal: ");
    printf("%d\n", ft_atoi_base("102", "012")); // 11
    printf("Base 3, -102 in decimal: ");
    printf("%d\n", ft_atoi_base("-102", "012")); // -11

    printf("\n");

    printf("Base 4, 123 in decimal: ");
    printf("%d\n", ft_atoi_base("123", "0123")); // 27
    printf("Base 4, -123 in decimal: ");
    printf("%d\n", ft_atoi_base("-123", "0123")); // -27

    printf("\n");
    
    printf("Base 5, 432 in decimal: ");
    printf("%d\n", ft_atoi_base("432", "01234")); // 102
    printf("Base 5, -432 in decimal: ");
    printf("%d\n", ft_atoi_base("-432", "01234")); // -102

    printf("\n");

    printf("Base 6, 543 in decimal: ");
    printf("%d\n", ft_atoi_base("543", "012345")); // 203
    printf("Base 6, -543 in decimal: ");
    printf("%d\n", ft_atoi_base("-543", "012345")); // -203

    printf("\n");

    printf("Base 7, 654 in decimal: ");
    printf("%d\n", ft_atoi_base("654", "0123456")); // 333
    printf("Base 7, -654 in decimal: ");
    printf("%d\n", ft_atoi_base("-654", "0123456")); // -333

    printf("\n");

    printf("Base 8, 765 in decimal: ");
    printf("%d\n", ft_atoi_base("765", "01234567")); // 501
    printf("Base 8, -765 in decimal: ");
    printf("%d\n", ft_atoi_base("-765", "01234567")); // -501

    printf("\n");

    printf("Base 9, 876 in decimal: ");
    printf("%d\n", ft_atoi_base("876", "012345678")); // 717
    printf("Base 9, -876 in decimal: ");
    printf("%d\n", ft_atoi_base("-876", "012345678")); // -717

    printf("\n");

    printf("Base 10, 123 in decimal: ");
    printf("%d\n", ft_atoi_base("123", "0123456789")); // 123
    printf("Base 10, -123 in decimal: ");
    printf("%d\n", ft_atoi_base("-123", "0123456789")); // -123

    printf("\n");

    printf("Base 11, A1 in decimal: ");
    printf("%d\n", ft_atoi_base("A1", "0123456789A")); // 111
    printf("Base 11, -A1 in decimal: ");
    printf("%d\n", ft_atoi_base("-A1", "0123456789A")); // -111

    printf("\n");

    printf("Base 12, B3 in decimal: ");
    printf("%d\n", ft_atoi_base("B3", "0123456789AB")); // 135
    printf("Base 12, -B3 in decimal: ");
    printf("%d\n", ft_atoi_base("-B3", "0123456789AB")); // -135

    printf("\n");

    printf("Base 13, C4 in decimal: ");
    printf("%d\n", ft_atoi_base("C4", "0123456789ABC")); // 156
    printf("Base 13, -C4 in decimal: ");
    printf("%d\n", ft_atoi_base("-C4", "0123456789ABC")); // -156

    printf("\n");

    printf("Base 14, D5 in decimal: ");
    printf("%d\n", ft_atoi_base("D5", "0123456789ABCD")); // 181
    printf("Base 14, -D5 in decimal: ");
    printf("%d\n", ft_atoi_base("-D5", "0123456789ABCD")); // -181

    printf("\n");
    
    printf("Base 15, E6 in decimal: ");
    printf("%d\n", ft_atoi_base("E6", "0123456789ABCDE")); // 210
    printf("Base 15, -E6 in decimal: ");
    printf("%d\n", ft_atoi_base("-E6", "0123456789ABCDE")); // -210

    printf("\n");

    printf("Base 16, 1F in decimal: ");
    printf("%d\n", ft_atoi_base("1F", "0123456789ABCDEF")); // 31
    printf("Base 16, -1F in decimal: ");
    printf("%d\n", ft_atoi_base("-1F", "0123456789ABCDEF")); // -31

    printf("\n");
}