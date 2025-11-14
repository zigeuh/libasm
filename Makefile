all:
	mkdir -p build
	nasm -felf64 ft_strcpy.s -o ./build/ft_strcpy.o
	nasm -felf64 ft_strlen.s -o ./build/ft_strlen.o
	gcc -g3 main.c ./build/ft_strcpy.o ./build/ft_strlen.o
	make valgrind

valgrind:
	valgrind --leak-check=full --track-origins=yes ./a.out

clean:
	rm -rf build

