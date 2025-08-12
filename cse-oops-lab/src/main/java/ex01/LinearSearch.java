package ex01;

public class LinearSearch {
    static int search(int[] arr, int n, int s) {
        for (int i = 0; i < n; i++) {
            if (arr[i] == s)
                return i;
        }
        return -1;
    }

    public static void main(String[] args) {
        int[] arr = {3, 4, 1, 7, 5};
        int n = arr.length;
        int s = 4;
        int index = search(arr, n, s);
        if (index == -1) {
            System.out.println("Element is not present in the array");
        } else {
            System.out.println("Element found at index " + index);
        }
    }
}