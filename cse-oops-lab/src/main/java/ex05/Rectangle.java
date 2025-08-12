package ex05;

import java.util.Scanner;

class Rectangle implements Shape {
    public void printArea() {
        System.out.println("\t\tCalculating Area of Rectangle");
        Scanner input = new Scanner(System.in);
        System.out.print("Enter length: ");
        int a = input.nextInt();
        System.out.print("\nEnter breadth: ");
        int b = input.nextInt();
        int area = a * b;
        System.out.println("Area of Rectangle: " + area);
    }
}
