#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <string.h>
#include <sys/stat.h>
#include <fcntl.h>


size_t ft_strlen(const char*);
char *ft_strcpy(char*, const char*);
int ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);

int main() {

	char dest[100] = "";

	// ----------------------- ft_strlen -----------------------
	printf("\n-- ft_strlen --\n\n");

	printf("%ld\n", ft_strlen("Hello World"));
	printf("%ld\n", strlen("Hello World"));

	// Crashes

	// printf("%ld\n", ft_strlen(NULL));
	// printf("%ld\n", strlen(NULL));

	// ----------------------- ft_strcpy -----------------------
	printf("\n-- ft_strcpy --\n\n");


	printf("Return of strcpy: %s\n", strcpy(dest, "Hello Zorld"));
	printf("%s\n", dest);
	printf("Return of ft_strcpy: %s\n", ft_strcpy(dest, "Hello Zorld"));
	printf("%s\n", dest);

	// Crashes

	// printf("Return of strcpy: %s\n", strcpy(dest, NULL));
	// printf("%s\n", dest);
	// printf("Return of ft_strcpy: %s\n", ft_strcpy(dest, NULL));
	// printf("%s\n", dest);

	// printf("Return of strcpy: %s\n", strcpy(NULL, "Hello Zorld"));
	// printf("%s\n", dest);
	// printf("Return of ft_strcpy: %s\n", ft_strcpy(NULL, "Hello Zorld"));
	// printf("%s\n", dest);

	// ----------------------- ft_strcmp -----------------------
	printf("\n-- ft_strcmp --\n\n");

	printf("Salut | Salut: %d\n", strcmp("Salut", "Salut"));
	printf("Salut | Salut: %d\n", ft_strcmp("Salut", "Salut"));

	printf("Coucou | Couco: %d\n", strcmp("Coucou", "Couco"));
	printf("Coucou | Couco: %d\n", ft_strcmp("Coucou", "Couco"));

	printf("A | a: %d\n", strcmp("A", "a"));
	printf("A | a: %d\n", ft_strcmp("A", "a"));
	
	printf("a | A: %d\n", strcmp("a", "A"));
	printf("a | A: %d\n", ft_strcmp("a", "A"));

	// Crashes

	// printf("NULL | a: %d\n", strcmp(NULL, "a"));
	// printf("NULL | a: %d\n", ft_strcmp(NULL, "a"));

	// printf("a | NULL: %d\n", strcmp("a", NULL));
	// printf("a | NULL: %d\n", ft_strcmp("a", NULL));

	// ----------------------- ft_write -----------------------0
	printf("\n-- ft_write --\n\n");

	printf("write bytes: %ld\n", write(1, "Yes\n", 4));
	printf("ft_write bytes: %ld\n", ft_write(1, "Yes\n", 4));

	// printf("write bytes: %ld\n", write(1, NULL, 4)); Not compiling with flags
	printf("ft_write bytes: %ld\n", ft_write(1, NULL, 4));

	// printf("write bytes: %ld\n", write(1, "No\n", 5)); Not compiling with flags
	printf("ft_write bytes: %ld\n", ft_write(1, "No\n", 5));


	// ----------------------- ft_write -----------------------
	int fd = open("Makefile", O_RDONLY);
	char *bytes_read = malloc(sizeof(char) * 5);

	read(fd, bytes_read, 4);
	bytes_read[4] = 0;
	printf("read: %s\n", bytes_read);

	close(fd);
	fd = open("Makefile", O_RDONLY);

	ft_read(fd, bytes_read, 4);
	printf("read: %s\n", bytes_read);
	close(fd);
	free(bytes_read);

	fd = open("Makefile", O_RDONLY);
	bytes_read = malloc(sizeof(char) * 15);	
	read(fd, bytes_read, 14);
	bytes_read[14] = 0;
	printf("read: %s\n", bytes_read);

	close(fd);
	fd = open("Makefile", O_RDONLY);

	ft_read(fd, bytes_read, 14);
	printf("read: %s\n", bytes_read);
	close(fd);
	free(bytes_read);
}
