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
	ft_strdup_tests();
}
