#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void)
{
    int n;
    int step = 0;
    int guess;
    char ch;

    srand(time(NULL));

    n = (rand() % 100) + 1;

    puts("You should guess the number in range 1 .. 100");

    do
    {
        printf("Enter your guess: ");
        if (scanf("%d", &guess) != 1)
        {
            puts("You entered bullshit :(");
            while (ch = getchar(), ch != '\n' && ch != EOF)
                ;
            continue;
        }

        if (guess < n)
        {
            puts("Your guess is too low :(");
        }
        else if (guess > n)
        {
            puts("Your guess is too high :(");
        }

        step++;
    } while (guess != n);

    printf("You won in %d steps!\n", step);

    return EXIT_SUCCESS;
}
