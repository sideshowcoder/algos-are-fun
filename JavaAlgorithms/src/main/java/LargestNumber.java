import java.util.Arrays;
import java.util.stream.Collectors;

public class LargestNumber {

  private static String largestNumber(int[] numbers) {
    final String largestNum = Arrays.stream(numbers)
        .mapToObj(Integer::toString)
        .sorted((a, b) -> (b + a).compareTo(a + b)) // 1 > 10, 9 < 10
        .collect(Collectors.joining());

    // remove leading zeros
    return Integer.valueOf(largestNum).toString();
  }

  public static void main(String... args) {
    System.out.println("Largest number:");
    System.out.println("input: [1] expected: 1 output: " + largestNumber(new int[] {1}));
    System.out.println("input: [10 1] expected: 110 output: " + largestNumber(new int[] {10, 1}));
    System.out.println("input: [0 0] expected: 0 output: " + largestNumber(new int[] {0, 0}));
    System.out.println("input: [10 1 9] expected: 9110 output: " + largestNumber(new int[] {10, 1, 9}));
  }
}
