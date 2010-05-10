#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int error(int err) {
    printf("Error.\n");
    return err;
}

long int prime(long int i) {
    long int m = (int) sqrt(i) + 1;
    for (long int j = 5; j < m; j += 6) {
        if (!(i % j) || !(i % (j+2)))
            return 0;
    }
    return 1;
}

long int sumprimes(long int n) {
    long int sum = 2+3;
    for (long int i = 5; i < n; i += 6) {
        if (prime(i))
            sum += i;
        if (prime(i+2))
            sum += i+2;
    }
    return sum;
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        return error(1);
    }

    int n = atoi(argv[1]);
    printf("Sum of Primes: %ld\n", sumprimes(n));
    return 0;
}
