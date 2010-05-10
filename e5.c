#include <stdio.h>
#include <stdlib.h>

int error(int err) {
    printf("Please input the max integer.\n");
    return err;
}

long int lcm(int n) {
    long int m = 0;
    while (1) {
        m += n*(n-1);
        for (int i = n-1; i > 0; i--) {
            if (m % i)
                break;
            if (i == 1)
                return m;
        }
    }
}


int main(int argc, char *argv[]) {
    if (argc < 2) {
        return error(1);
    }
    int n = atol(argv[1]);
    printf("%ld\n", lcm(n));
    return 0;
}
