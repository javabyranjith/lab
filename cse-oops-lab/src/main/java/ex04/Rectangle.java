package ex04;

import java.util.Scanner;

class Rectangle extends Shape {
    void printArea() {
        System.out.println("\t\tCalculating Area of Rectangle");
        Scanner input = new Scanner(System.in);
        System.out.print("Enter length: ");
        a = input.nextInt();
        System.out.print("\nEnter breadth: ");
        b = input.nextInt();
        int area = a * b;
        System.out.println("Area of Rectangle: " + area);
    }
}
