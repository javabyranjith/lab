package ex07;

import java.util.*;

class even implements Runnable {
    public int x;

    public even(int x) {
        this.x = x;
    }

    public void run() {
        System.out.println("New Thread " + x + " is EVEN and Square of " + x + " is: " + x * x);
    }
}
