all: e1 e2 e3 e4 e5 e6 e7 e8 e9 e10

e1: e1.c
	gcc -std=c99 e1.c -o e1

e2: e2.c
	gcc -std=c99 e2.c -o e2

e3: e3.c
	gcc -std=c99 e3.c -o e3

e4: e4.c
	gcc -std=c99 e4.c -o e4

e5: e5.c
	gcc -std=c99 e5.c -o e5

e6: e6.c
	gcc -std=c99 e6.c -o e6

e7: e7.c
	gcc -std=c99 e7.c -o e7

e8: e8.c
	gcc -std=c99 e8.c -o e8

e9: e9.c
	gcc -std=c99 e9.c -o e9

e10: e10.c
	gcc -std=c99 e10.c -o e10 -lm
