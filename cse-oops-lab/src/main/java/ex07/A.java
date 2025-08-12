package ex07;

import java.util.Random;

class A extends Thread {
    public void run() {
        int num = 0;
        Random r = new Random();
        try {
            for (int i = 0; i < 5; i++) {
                num = r.nextInt(100);
                System.out.println("Main Thread and Generated Number is " + num);
                if (num % 2 == 0) {
                    Thread t1 = new Thread(new even(num));
                    t1.start();
                } else {
                    Thread t2 = new Thread(new odd(num));
                    t2.start();
                }
                Thread.sleep(1000);
                System.out.println("--------------------------------------");
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
}
