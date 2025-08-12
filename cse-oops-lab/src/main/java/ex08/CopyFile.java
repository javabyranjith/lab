package ex08;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

class CopyFile {
    public static void main(String args[]) throws IOException {
        int i;
        FileInputStream fin = null;
        FileOutputStream fout = null;
        if (args.length != 2) {
            System.out.println("Usage: CopyFile from to");
            return;
        }
        System.out.println("Displaying contents of " + args[0] + "\n");
        try {
            fin = new FileInputStream(args[0]);
            do {
                i = fin.read();
                if (i != -1)
                    System.out.print((char) i);
            } while (i != -1);
        } catch (IOException e) {
            System.out.println("Error Reading File");
        } finally {
            try {
                fin.close();
            } catch (IOException e) {
                System.out.println("Error Closing File");
            }
        }
        System.out.println("\nCopying contents of " + args[0] + "to " + args[1] + "\n");
        try {
            fin = new FileInputStream(args[0]);
            fout = new FileOutputStream(args[1]);
            do {
                i = fin.read();
                if (i != -1) fout.write(i);
            } while (i != -1);
        } catch (IOException e) {
            System.out.println("I/O Error: " + e);
        } finally {
            try {
                if (fin != null)
                    fin.close();
            } catch (IOException e2) {
                System.out.println("Error Closing Input File");
            }
            try {
                if (fout != null)
                    fout.close();
            } catch (IOException e2) {
                System.out.println("Error Closing Output File");
            }
        }
        System.out.println("\nFile Copied\n");
        System.out.println("\nDisplaying contents of " + args[1] + "\n");
        try {
            fin = new FileInputStream(args[1]);
            do {
                i = fin.read();
                if (i != -1)
                    System.out.print((char) i);
            } while (i != -1);
        } catch (IOException e) {
            System.out.println("Error Reading File");
        } finally {
            try {
                fin.close();
            } catch (IOException e) {
                System.out.println("Error Closing File");
            }
        }
    }
}
