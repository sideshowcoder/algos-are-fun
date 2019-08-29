import java.util.Arrays;
import java.util.List;

public class LengthOfLastWord {

  private static final List<String> sentences = Arrays.asList(
    "",                          // Empty
    "one two three",             // No dot
    "one two three.",            // dot
    "One Two Three"             // Capitals
                                                 );

  private static final String NON_ALPHANUMERIC = "[^a-zA-Z0-9]";


  public static void main(String... args) {
    sentences.stream().forEach(sentence -> {
        System.out.println("Length of last word for sentence: " + sentence + " is " + lengthOfLastWord(sentence));
      });
  }

  private static int lengthOfLastWord(String sentence) {
    final String[] words = sentence.split("\\s");
    final String lastWord = words[words.length - 1];
    final String lastWordNonSpecialChars = lastWord.replaceAll(NON_ALPHANUMERIC, "");
    return lastWordNonSpecialChars.length();
  }
}
