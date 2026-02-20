#include "libasm_bonus.h"

void ft_atoi_base_tests() {

    printf("##############################################\n");
    printf("#                ft_atoi_base                #\n");
    printf("##############################################\n");

    printf("\nTesting whitespaces skip:\n");

    printf("Base 2, \"    	    1010\" in decimal: ");
    printf("Base 2, \"    	    -1010\" in decimal: ");
    printf("%d \t| Expected: -10\n", ft_atoi_base("   	  	-1010", "01")); // -10

    printf("\nInvalid base:\n");
    printf("Base '01.', 1010 in decimal: ");
    printf("%d \t\t| Expected: 0\n", ft_atoi_base("1010", "01."));
    printf("Base '0/1', -1010 in decimal: ");
    printf("%d \t| Expected: 0\n", ft_atoi_base("-1010", "0/1"));

    printf("\nWhitespaces in middle:\n");
    printf("Base 11, \"2AA\they\" in decimal: ");
    printf("%d \t| Expected: 362\n", ft_atoi_base("2AA\they", "0123456789A")); // 362
    printf("Base 14, \"6A9B\nyesyes\" in decimal: ");
    printf("%d \t\t| Expected: 18561\n", ft_atoi_base("6A9B\nyesyes", "0123456789ABCD")); // 18561
    printf("Base 2, \"-1010  1515\" in decimal: ");
    printf("%d \t| Expected: -10\n", ft_atoi_base("-1010  1515", "01")); // -10

    printf("\nInvalid str:\n");
	printf("%d \t| Expected: 0\n", ft_atoi_base("100.010", "01")); // 0
    printf("%d \t| Expected: 0\n", ft_atoi_base("1*00010", "01")); // 0

	printf("\nNormal tests:\n");

    printf("\n");

    printf("Base 2, 1010 in decimal: ");
    printf("%d \t| Expected: 10\n", ft_atoi_base("1010", "01")); // 10
    printf("Base 2, -1010 in decimal: ");
    printf("%d \t| Expected: -10\n", ft_atoi_base("-1010", "01")); // -10
    
    printf("\n");

    printf("Base 3, 102 in decimal: ");
    printf("%d \t| Expected: 11\n", ft_atoi_base("102", "012")); // 11
    printf("Base 3, -102 in decimal: ");
    printf("%d \t| Expected: 11\n", ft_atoi_base("-102", "012")); // -11

    printf("\n");

    printf("Base 4, 123 in decimal: ");
    printf("%d \t| Expected: 27\n", ft_atoi_base("123", "0123")); // 27
    printf("Base 4, -123 in decimal: ");
    printf("%d \t| Expected: -27\n", ft_atoi_base("-123", "0123")); // -27

    printf("\n");
    
    printf("Base 5, 432 in decimal: ");
    printf("%d \t| Expected: 117\n", ft_atoi_base("432", "01234")); // 117
    printf("Base 5, -432 in decimal: ");
    printf("%d \t| Expected: -117\n", ft_atoi_base("-432", "01234")); // -117

    printf("\n");

    printf("Base 6, 543 in decimal: ");
    printf("%d \t| Expected: 207\n", ft_atoi_base("543", "012345")); // 207
    printf("Base 6, -543 in decimal: ");
    printf("%d \t| Expected: -207\n", ft_atoi_base("-543", "012345")); // -207

    printf("\n");

    printf("Base 7, 654 in decimal: ");
    printf("%d \t| Expected: 333\n", ft_atoi_base("654", "0123456")); // 333
    printf("Base 7, -654 in decimal: ");
    printf("%d \t| Expected: -333\n", ft_atoi_base("-654", "0123456")); // -333

    printf("\n");

    printf("Base 8, 765 in decimal: ");
    printf("%d \t| Expected: 501\n", ft_atoi_base("765", "01234567")); // 501
    printf("Base 8, -765 in decimal: ");
    printf("%d \t| Expected: -501\n", ft_atoi_base("-765", "01234567")); // -501

    printf("\n");

    printf("Base 9, 876 in decimal: ");
    printf("%d \t| Expected: 717\n", ft_atoi_base("876", "012345678")); // 717
    printf("Base 9, -876 in decimal: ");
    printf("%d \t| Expected: -717\n", ft_atoi_base("-876", "012345678")); // -717

    printf("\n");

    printf("Base 10, 123 in decimal: ");
    printf("%d \t| Expected: 123\n", ft_atoi_base("123", "0123456789")); // 123
    printf("Base 10, -123 in decimal: ");
    printf("%d \t| Expected: -123\n", ft_atoi_base("-123", "0123456789")); // -123

    printf("\n");

    printf("Base 11, A1 in decimal: ");
    printf("%d \t| Expected: 111\n", ft_atoi_base("A1", "0123456789A")); // 111
    printf("Base 11, -A1 in decimal: ");
    printf("%d \t| Expected: -111\n", ft_atoi_base("-A1", "0123456789A")); // -111

    printf("\n");

    printf("Base 12, B3 in decimal: ");
    printf("%d \t| Expected: 135\n", ft_atoi_base("B3", "0123456789AB")); // 135
    printf("Base 12, -B3 in decimal: ");
    printf("%d \t| Expected: -135\n", ft_atoi_base("-B3", "0123456789AB")); // -135

    printf("\n");

    printf("Base 13, C4 in decimal: ");
    printf("%d \t| Expected: 160\n", ft_atoi_base("C4", "0123456789ABC")); // 160
    printf("Base 13, -C4 in decimal: ");
    printf("%d \t| Expected: -160\n", ft_atoi_base("-C4", "0123456789ABC")); // -160

    printf("\n");

    printf("Base 14, D5 in decimal: ");
    printf("%d \t| Expected: 187\n", ft_atoi_base("D5", "0123456789ABCD")); // 187
    printf("Base 14, -D5 in decimal: ");
    printf("%d \t| Expected: -187\n", ft_atoi_base("-D5", "0123456789ABCD")); // -187

    printf("\n");
    
    printf("Base 15, E6 in decimal: ");
    printf("%d \t| Expected: 216\n", ft_atoi_base("E6", "0123456789ABCDE")); // 216
    printf("Base 15, -E6 in decimal: ");
    printf("%d \t| Expected: -216\n", ft_atoi_base("-E6", "0123456789ABCDE")); // -216

    printf("\n");

    printf("Base 16, 1F in decimal: ");
    printf("%d \t| Expected: 31\n", ft_atoi_base("1F", "0123456789ABCDEF")); // 31
    printf("Base 16, -1F in decimal: ");
    printf("%d \t| Excepted: -31\n", ft_atoi_base("-1F", "0123456789ABCDEF")); // -31

    printf("\n");
}