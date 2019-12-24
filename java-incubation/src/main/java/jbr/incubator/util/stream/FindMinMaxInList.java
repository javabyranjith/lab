package jbr.incubator.util.stream;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

public class FindMinMaxInList {

  public static void main(String[] args) {
    List<Integer> numbers = Arrays.asList(new Integer[] { 3, 2, 7, 1, 8 });
    int big = numbers.stream().max(Comparator.comparing(Integer::valueOf)).get();
    int small = numbers.stream().min(Comparator.comparing(Integer::valueOf)).get();
    System.out.println("Big: " + big + ", Small: " + small);
  }
}
