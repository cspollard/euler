#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int error(int err) {
    printf("Please input the max integer.\n");
    return err;
}

int max(int i, int j) {
    return (i>j)? i: j;
}

int lproduct(int *k) {
    int *s = k;
    int m = 0;
    while (*(s+4) != -1) {
        m = max(m, s[0]*s[1]*s[2]*s[3]*s[4]);
        s += 1;
    }
    return m;
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        return error(1);
    }
    int n = strlen(argv[1]);
    if (n < 5) {
        return error(1);
    }
    int k[n];
    char c;
    for (int i = 0; i < n; i++) {
        c = argv[1][i];
        k[i] = atoi(&c);
    }
    k[n] = -1;

    printf("Largest Product: %d\n", lproduct(k));
    return 0;
}
