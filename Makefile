AS = nasm  # NOTE: yasm тоже подойдёт

all: asm-prog c-prog

asm-prog: main.o
	$(CC) -no-pie $^ -o $@

main.o: main.asm
	$(AS) -felf64 $^

c-prog: main.c 
	$(CC) $^ -o $@ -Wall -Wextra -Wpedantic -std=c11

clean:
	rm -f asm-prog c-prog *.o core

.PHONY: clean

