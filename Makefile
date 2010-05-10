all: e1 e2


e1: e1.c
	gcc -std=c99 e1.c -o e1

e2: e2.c
	gcc -std=c99 e2.c -o e2

