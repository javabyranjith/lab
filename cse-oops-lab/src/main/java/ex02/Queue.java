package ex02;

import java.util.Scanner;

public class Queue {

    private int items[];
    private int maxsize, front, rear;

    Queue(int size) {
        maxsize = size;
        items = new int[size];
        front = -1;
        rear = -1;
    }

    boolean isFull() {
        if (front == 0 && rear == maxsize - 1) {
            return true;
        }
        return false;
    }

    boolean isEmpty() {
        if (front == -1)
            return true;
        else
            return false;
    }

    void enQueue(int element) {
        if (isFull()) {
            System.out.println("Queue is full");
        } else {
            if (front == -1)
                front = 0;
            rear++;
            items[rear] = element;
            System.out.println("Inserted " + element);
        }
    }

    int deQueue() {
        int element;
        if (isEmpty()) {
            System.out.println("Queue is empty");
            return (-1);
        } else {
            element = items[front];
            if (front >= rear) {
                front = -1;
                rear = -1;
            } else {
                front++;
            }
            return (element);
        }
    }

    void display() {
        int i;
        if (isEmpty()) {
            System.out.println("Empty Queue");
        } else {
            System.out.println("\nFront index-> " + front);
            System.out.println("Items -> ");
            for (i = front; i <= rear; i++)
                System.out.print(items[i] + "  ");
            System.out.println("\nRear index-> " + rear);
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter queue size");
        int size = sc.nextInt();
        Queue obj = new Queue(size);
        while (true) {
            System.out.println("\nQUEUE\n*****\n1.ENQUEUE\n2.DEQUEUE\n3.DISPLAY\n4.EXIT\nEnter your choice");
            int ch = sc.nextInt();
            switch (ch) {
                case 1:
                    System.out.println("Enter Element");
                    int n = sc.nextInt();
                    obj.enQueue(n);
                    break;
                case 2:
                    System.out.printf("Dequeued element is %d", obj.deQueue());
                    break;
                case 3:
                    obj.display();
                    break;
                case 4:
                    System.exit(0);
                default:
                    System.out.println("Wrong option");
            }
        }
    }
}
