#include <stdio.h>
#include <stdlib.h>

int error(int err) {
    printf("Please input the max integer.\n");
    return err;
}

long int max(long int i, long int j) {
    return (i>j)? i: j;
}

long int lprimefac(long int i) {
    long int j = 2;
    long int m = i/2;
    while (j < m) {
        if (!(i % j)) {
            return max(lprimefac(i/j), j);
        }
        j++;
    }
    return i;
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        return error(1);
    }
    long int n = atol(argv[1]);
    printf("Max: %ld\n", lprimefac(n));
    return 0;
}
