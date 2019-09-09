import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Currency;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

public class FindClickPath {

  private static List<String> findPathToDest(String start, List<List<String>> path) {
    if (path.isEmpty()) {
      return Collections.emptyList();
    }

    final Map<String, String> fromTo = path.stream()
        .collect(Collectors.toMap((a) -> a.get(0), (a) -> a.get(1)));

    List<String> resultPath = new ArrayList<>();
    Set<String> visited = new HashSet<>();
    String current = fromTo.get(start);

    do {
      resultPath.add(current);
      current = fromTo.get(current);

      if (visited.contains(current)) {
        throw new RuntimeException("Loop detected");
      } else {
        visited.add(current);
      }
    } while (current != null);

    return resultPath;
  }

  public static void main(String... args) {
    final List<List<String>> validPath = Arrays.asList(
      Arrays.asList("D", "E"),
      Arrays.asList("A", "B"),
      Arrays.asList("C", "D"),
      Arrays.asList("B", "C"));
    System.out.println("Starting at: \"A\" Path: " + Arrays.toString(findPathToDest("A", validPath).toArray()));
    System.out.println("Starting at: \"C\" Path: " + Arrays.toString(findPathToDest("C", validPath).toArray()));

    final List<List<String>> loopingPath = Arrays.asList(
      Arrays.asList("D", "A"),
      Arrays.asList("A", "B"),
      Arrays.asList("C", "D"),
      Arrays.asList("B", "C"));
    try {
      System.out.println("Starting at: \"A\" Path: " + Arrays.toString(findPathToDest("A", loopingPath).toArray()));
    } catch(RuntimeException e) {
      System.out.println("Starting at: \"A\" Path: " + e.getMessage());
    }

    final List<List<String>> emptyPath = Arrays.asList();
    System.out.println("Starting at: \"A\" Path: " + Arrays.toString(findPathToDest("A", emptyPath).toArray()));
  }

}
