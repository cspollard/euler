#include <stdio.h>
#include <stdlib.h>

int error(int err) {
    printf("Please input the max integer.\n");
    return err;
}

long int sqsum(int n) {
    long int sum = 0;
    for (int i = n; i > 0; i --)
        sum += i;
    return sum*sum;
}

long int sumsq(int n) {
    long int sum = 0;
    for (int i = n; i > 0; i--)
        sum += i*i;

    return sum;
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        return error(1);
    }
    int n = atol(argv[1]);
    printf("%ld\n", sqsum(n)-sumsq(n));
    return 0;
}
