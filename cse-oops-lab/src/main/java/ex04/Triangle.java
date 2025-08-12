package ex04;

import java.util.Scanner;

class Triangle extends Shape {
    void printArea() {
        System.out.println("\t\tCalculating Area of Triangle");
        Scanner input = new Scanner(System.in);
        System.out.print("Enter height: ");
        a = input.nextInt();
        System.out.println("\nEnter breadth: ");
        b = input.nextInt();
        double area = 0.5 * a * b;
        System.out.println("Area of Triangle: " + area);
    }
}
