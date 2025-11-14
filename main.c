#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>

int64_t ft_strlen(char*);
char *ft_strcpy(char*, const char*);

int main() {

	char dest[100] = "";

	printf("Return of strcpy: %s\n", ft_strcpy(dest, "Hello Zorld"));

	printf("%ld\n", ft_strlen("Hello World"));
	printf("%s\n", dest);
}
