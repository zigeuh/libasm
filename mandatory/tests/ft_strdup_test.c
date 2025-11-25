#include "libasm.h"

void ft_strdup_tests() {

    char *base = "Hello world";

    char *dup1;
    char *dup2;
    
    printf("##############################################\n");
    printf("#                   strdup                   #\n");
    printf("##############################################\n");

    printf("\n1. Normal string:\n");

    dup1 = _ft_strdup(base);
    dup2 = strdup(base);
    printf("_ft_strdup: %s\n", dup1);
    printf("strdup: %s\n", dup2);
    free(dup1);
    free(dup2);

    printf("\n2. Long string:\n");

    base = "Quibus ita sceleste patratis Paulus cruore perfusus reversusque ad principis castra multos coopertos paene catenis adduxit in squalorem deiectos atque maestitiam, quorum adventu intendebantur eculei uncosque parabat carnifex et tormenta. et ex is proscripti sunt plures actique in exilium alii, non nullos gladii consumpsere poenales. nec enim quisquam facile meminit sub Constantio, ubi susurro tenus haec movebantur, quemquam absolutum.";
    dup1 = _ft_strdup(base);
    dup2 = strdup(base);
    printf("_ft_strdup: %s\n", dup1);
    printf("strdup: %s\n", dup2);
    free(dup1);
    free(dup2);

    printf("\n3. Empty string:\n");

    base = "";
    dup1 = _ft_strdup(base);
    dup2 = strdup(base);
    printf("_ft_strdup: %s\n", dup1);
    printf("strdup: %s\n", dup2);
    free(dup1);
    free(dup2);

    printf("\n");
}