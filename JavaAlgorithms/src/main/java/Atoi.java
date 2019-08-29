public class Atoi {

  private static int atoi(final String rawString) {
    final String s = rawString.trim();

    if(s.isEmpty() || s.equals("null")) {
      return 0;
    }

    int position = 0;
    int flag = 1;
    if (s.charAt(0) == '+') {
      position = 1;
    } else if (s.charAt(0) == '-') {
      flag = -1;
      position = 1;
    }

    int number = 0;
    while (position < s.length()) {
      int currentValue = s.charAt(position) - '0';
      position++;

      try {
        number = Math.multiplyExact(number, 10);
        number = Math.addExact(number, currentValue);
      } catch (ArithmeticException e) {
        if (flag == -1) {
          return Integer.MIN_VALUE;
        } else {
          return Integer.MAX_VALUE;
        }
      }
    }

    return number * flag;
  }

  public static void main(String... args) {
    System.out.println("input: \"\"" + " " + atoi(""));
    System.out.println("input: \"null\"" + " " + atoi("null"));
    System.out.println("input: \"1\"" + " " + atoi("1"));
    System.out.println("input: \"10\"" + " " + atoi("10"));
    System.out.println("input: \"122\"" + " " + atoi("122"));
    System.out.println("input: \"  1\"" + " " + atoi("  1"));
    System.out.println("input: \"1  \"" + " " + atoi("1  "));
    System.out.println("input: \"+1\"" + " " + atoi("+1"));
    System.out.println("input: \"-1\"" + " " + atoi("-1"));
    System.out.println("input: \"-10\"" + " " + atoi("-10"));
    System.out.println("input: \"-122\"" + " " + atoi("-122"));
    System.out.println("input: \"30000000000\" expect (MAX_VALUE): \"2147483647\"" + " " + atoi("30000000000"));
    System.out.println("input: \"-30000000000\" expect (MIN_VALUE): \"-2147483648\"" + " " + atoi("-30000000000"));
  }
}
