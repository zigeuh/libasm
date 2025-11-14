#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>

int64_t ft_strlen(char*);
char *ft_strcpy(char*, const char*);
int64_t ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);

int main() {

	char dest[100] = "";

	printf("Return of strcpy: %s\n", ft_strcpy(dest, "Hello Zorld"));

	printf("%ld\n", ft_strlen("Hello World"));
	printf("%s\n", dest);

	printf("Salut | Salut: %ld\n", ft_strcmp("Salut", "Salut"));
	printf("Coucou | Couco: %ld\n", ft_strcmp("Coucou", "Couco"));
	printf("A | a: %ld\n", ft_strcmp("A", "a"));
	printf("a | A: %ld\n", ft_strcmp("a", "A"));
	
	ft_write(1, "I write\n", 8);
}
