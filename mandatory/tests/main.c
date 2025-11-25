#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <string.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>

#include "libasm.h"

int main() {

	ft_strlen_tests();
	ft_strcpy_tests();
	ft_strcmp_tests();
	ft_write_tests();
	ft_read_tests();

	// ----------------------- ft_strdup -----------------------
	printf("\n----------------------- ft_strdup -----------------------\n\n");

	char *base = strdup("c");

	printf("base: %s\n", base);

	char *og_dup = strdup(base);
	char *ft_dup = _ft_strdup(base);

	printf("og_dup: %s\n", og_dup);
	printf("ft_dup: %s\n", ft_dup);

	free(base);
	free(og_dup);
	free(ft_dup);

	//--
	printf("--\n");

	base = strdup("Salut c'est moi");

	printf("base: %s\n", base);

	og_dup = strdup(base);
	ft_dup = _ft_strdup(base);

	printf("og_dup: %s\n", og_dup);
	printf("ft_dup: %s\n", ft_dup);

	free(base);
	free(og_dup);
	free(ft_dup);



	// Start with    bash -c "ulimit -v 10970 ; ./a.out"
	// errno = 0;
	// char *p = malloc(8 * 1024 * 1024);
	// strdup(p);
	// printf("Error: %s\n", strerror(errno));
	// errno = 0;

	// Crashes

	////--
	// printf("--\n");

	// printf("base: %s\n", NULL);

	// og_dup = strdup(NULL);
	// ft_dup = ft_strdup(NULL);

	// printf("og_dup: %s\n", base);
	// printf("ft_dup: %s\n", base);
}
