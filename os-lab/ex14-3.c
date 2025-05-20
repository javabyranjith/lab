#include <stdio.h>
#include <stdlib.h>

void main()
{
    int f[50], i, st, len, j, c, k, count = 0;

    // Initialize all disk blocks as free (0 means free, 1 means allocated)
    for(i = 0; i < 50; i++)
        f[i] = 0;

    printf("Files Allocated are: \n");

    while(1)
    {
        count = 0;
        printf("Enter starting block and length of file: ");
        scanf("%d %d", &st, &len);

        // Check if enough free blocks are available
        for(k = st; k < (st + len); k++)
        {
            if(f[k] == 0)
                count++;
        }

        if(len == count)
        {
            // Allocate the file
            for(j = st; j < (st + len); j++)
            {
                if(f[j] == 0)
                {
                    f[j] = 1;
                    printf("Block %d allocated\n", j);
                }
            }
            printf("The file is successfully allocated to disk.\n");
        }
        else
        {
            printf("The file cannot be allocated (insufficient space).\n");
        }

        printf("Do you want to enter another file? (Yes - 1 / No - 0): ");
        scanf("%d", &c);

        if(c == 0)
        {
            // Exit the program
            printf("Exiting program...\n");
            break;
        }
    }
}
