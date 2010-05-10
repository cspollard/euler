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
    int i = 0;
    int j = 0;
    int sum = 0;
    while (i <= n) {
        switch (j) {
            case 1:
                sum += i+i+2;
                break;
            case 3:
                sum += i+i+1;
                break;
            default:
                sum += i;
        }
        i += 3;
        j = (j+1) % 5;
    }
    printf("Sum: %d\n", sum);
    return 0;
}
