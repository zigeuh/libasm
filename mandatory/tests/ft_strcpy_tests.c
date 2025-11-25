#include "libasm.h"

void ft_strcpy_tests() {

    printf("##############################################\n");
    printf("#                   strcpy                   #\n");
    printf("##############################################\n");

    char *src = "Hello";
    char dest1[500] = {0};
    char dest2[500] = {0};

    printf("\n1. Normal string:\n");

    printf("_ft_strcpy: %s\n", _ft_strcpy(dest1, src));
    printf("dest1: %s\n\n", dest1);
    printf("strcpy: %s\n", strcpy(dest2, src));
    printf("dest2: %s\n", dest2);

    printf("\n2. Long string:\n");

    src = "Quibus ita sceleste patratis Paulus cruore perfusus reversusque ad principis castra multos coopertos paene catenis adduxit in squalorem deiectos atque maestitiam, quorum adventu intendebantur eculei uncosque parabat carnifex et tormenta. et ex is proscripti sunt plures actique in exilium alii, non nullos gladii consumpsere poenales. nec enim quisquam facile meminit sub Constantio, ubi susurro tenus haec movebantur, quemquam absolutum.";
    printf("_ft_strcpy: %s\n", _ft_strcpy(dest1, src));
    printf("dest1: %s\n\n", dest1);
    printf("strcpy: %s\n", strcpy(dest2, src));
    printf("dest2: %s\n", dest2);

    printf("\n3. Empty string:\n");

    printf("_ft_strcpy: %s\n", _ft_strcpy(dest1, ""));
    printf("dest1: %s\n\n", dest1);
    printf("strcpy: %s\n", strcpy(dest2, ""));
    printf("dest2: %s\n", dest2);

    printf("\n");
}