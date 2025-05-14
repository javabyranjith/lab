#include <graphics.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct tree_element {
    char name[20];
    int x, y, ftype, lx, rx, nc, level;
    struct tree_element *link[5];
};

typedef struct tree_element node;

void create(node **root, int lev, char *dname, int lx, int rx, int x);
void display(node *root);

void main() {
    int gd = DETECT, gm;
    node *root = NULL;

    // Initialize graphics
    initgraph(&gd, &gm, "c:\\tc\\BGI");

    // Create the root of the tree and other nodes
    create(&root, 0, "root", 0, 639, 320);

    // Clear screen and display the tree
    cleardevice();
    display(root);

    // Wait for the user to close the graphics window
    getch();

    // Close graphics mode
    closegraph();
}

void create(node **root, int lev, char *dname, int lx, int rx, int x) {
    int i, gap;

    if (*root == NULL) {
        (*root) = (node *)malloc(sizeof(node));

        // Ask for directory/file name
        printf("Enter name of dir/file (under %s): ", dname);
        fgets((*root)->name, sizeof((*root)->name), stdin);
        (*root)->name[strcspn((*root)->name, "\n")] = 0;  // Remove newline character

        printf("Enter 1 for Dir/2 for file: ");
        scanf("%d", &(*root)->ftype);

        (*root)->level = lev;
        (*root)->y = 50 + lev * 50;
        (*root)->x = x;
        (*root)->lx = lx;
        (*root)->rx = rx;

        // Initialize the link array
        for (i = 0; i < 5; i++) {
            (*root)->link[i] = NULL;
        }

        if ((*root)->ftype == 1) {
            // Directory: Ask how many subdirectories/files
            printf("No of sub directories/files (for %s): ", (*root)->name);
            scanf("%d", &(*root)->nc);

            if ((*root)->nc == 0) {
                gap = rx - lx;
            } else {
                gap = (rx - lx) / (*root)->nc;
            }

            for (i = 0; i < (*root)->nc; i++) {
                create(&((*root)->link[i]), lev + 1, (*root)->name, lx + gap * i, lx + gap * (i + 1), lx + gap * (i + 1) / 2);
            }
        } else {
            (*root)->nc = 0; // No subdirectories for files
        }
    }
}

void display(node *root) {
    int i;

    // Set graphical properties
    settextstyle(2, 0, 4);
    settextjustify(1, 1);
    setfillstyle(1, BLUE);
    setcolor(14);

    if (root != NULL) {
        // Draw lines connecting the current node to its children
        for (i = 0; i < root->nc; i++) {
            line(root->x, root->y, root->link[i]->x, root->link[i]->y);
        }

        // Draw the current node (rectangle for directories, ellipse for files)
        if (root->ftype == 1) {
            bar3d(root->x - 20, root->y - 10, root->x + 20, root->y + 10, 0, 0);
        } else {
            fillellipse(root->x, root->y, 20, 20);
        }

        // Display the name of the directory/file
        outtextxy(root->x, root->y, root->name);

        // Recursively display the child nodes
        for (i = 0; i < root->nc; i++) {
            display(root->link[i]);
        }
    }
}
