#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int error(int err) {
    printf("Error.\n");
    return err;
}

int *ptriplet(int n) {
    int *p = malloc(3*sizeof(*p));
    for (int k = 1; k < n; k++) {
        int k2 = k*k;
        for (int j = 1; j < k; j++) {
            int j2 = j*j;
            for (int i = 1; i < j; i++) {
                int i2 = i*i;
                if (i2 + j2 == k2 && i + j + k == n) {
                    p[0] = i;
                    p[1] = j;
                    p[2] = k;
                    return p;
                }
            }
        }
    }
    free(p);
    return NULL;
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        return error(1);
    }
    int n = atoi(argv[1]);
    int *t = ptriplet(n);
    if (t) {
        printf("Pythagorean Triplet: %d, %d, %d\n", t[0], t[1], t[2]);
        free(t);
    }
    else
        printf("No triplet found adding to %d.\n", n);
    return 0;
}
