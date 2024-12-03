#include <stdio.h>

extern void fibonacci(int n);
extern unsigned int fibonacci_sequence[];

int main() {
    int n;
    n = 100;
    fibonacci(n);

    for (int i = 0; i < n; i++) {
        printf("%u\n", fibonacci_sequence[i]);
    }

    return 0;
}