all: e1 e2 e3 e4


e1: e1.c
	gcc -std=c99 e1.c -o e1

e2: e2.c
	gcc -std=c99 e2.c -o e2

e3: e3.c
	gcc -std=c99 e3.c -o e3

e4: e4.c
	gcc -std=c99 e4.c -o e4
