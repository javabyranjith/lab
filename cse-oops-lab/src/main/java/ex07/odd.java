package ex07;

class odd implements Runnable {
    public int x;

    public odd(int x) {
        this.x = x;
    }

    public void run() {
        System.out.println("New Thread " + x + " is ODD and Cube of " + x + " is: " +
                x * x * x);
    }
}
