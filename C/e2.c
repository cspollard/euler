#include <stdio.h>
#include <stdlib.h>

int error(int err) {
    printf("Please input the max integer.\n");
    return err;
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        return error(1);
    }
    int n = atoi(argv[1]);
    int i = 1;
    int j = 0;
    int k = 0;
    int sum = 0;
    while (i < n) {
        k = i;
        if (!(i & 1))
            sum += i;
        i += j;
        j = k;
    }
    printf("Sum: %d\n", sum);
    return 0;
}
