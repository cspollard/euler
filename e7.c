#include <stdio.h>
#include <stdlib.h>

int error(int err) {
    printf("Please input the max integer.\n");
    return err;
}

long int prime(int i) {
    long int j = 2;
    long int m = i/2;
    while (j < m) {
        if (!(i % j))
            return 0;
        j++;
    }
    return i;
}

long int nthprime(int n) {
    long int p = 2;
    for (int i = 0; i < n; i++) {
        while (!prime(++p));
    }
    return p;
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        return error(1);
    }
    int n = atoi(argv[1]);
    printf("Prime #%d: %ld\n", n, nthprime(n));
    return 0;
}
