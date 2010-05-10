#include <stdio.h>
#include <stdlib.h>

int error(int err) {
    printf("Please input the max integer.\n");
    return err;
}

int palindrome(int n) {
    int k = n;
    int i = 0;
    while (k > 0) {
        k /= 10;
        i += 1;
    }

    k = n;
    int digits[i];
    for (int j = 0; j < i; j++) {
        digits[j] = k % 10;
        k /= 10;
    }

    int l = i/2;
    for (int j = 0; j < l; j++) {
        if (digits[j] != digits[i-j-1])
            return 0;
    }
    return 1;
}

int lpalindrome(int n) {
    int p;
    int k = 0;
    for (int i = n; i > 0; i--) {
        for (int j = n; j > 0; j--) {
            p = i * j;
            if (p <= k)
                break;
            k = palindrome(p)? p: k;
        }
    }
    return k;
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        return error(1);
    }
    int n = atol(argv[1]);
    printf("Max: %d\n", lpalindrome(n));
    return 0;
}
