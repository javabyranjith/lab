package ex05;

import java.util.Scanner;

class Triangle implements Shape
{
	public void printArea()
	{
		System.out.println("\t\tCalculating Area of Triangle");
		Scanner input=new Scanner(System.in);
		System.out.print("Enter height: ");
		int a=input.nextInt();
		System.out.print("\nEnter breadth: ");
		int b=input.nextInt();
		double area=0.5*a*b;
		System.out.println("Area of Triangle: "+area);
	}
}
