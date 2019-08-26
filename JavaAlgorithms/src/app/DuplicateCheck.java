package app;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

public class DuplicateCheck {
  private static <T> boolean containsDuplicate(Collection<T> collection) {
    Set<T> seen = new HashSet<>();

    for(T o : collection) {
      if (seen.contains(o)) {
        return true;
      }
      seen.add(o);
    }
    return false;
  }

  public static void main(String[] args) throws Exception {
    assertEqual(false, containsDuplicate(Arrays.asList(1,2,3)));
    assertEqual(true, containsDuplicate(Arrays.asList(1,2,2)));
  }

  private static void assertEqual(Object expected, Object actual) {
    if (!expected.equals(actual)) {
      System.out.println("Expected: " + expected + " got: " + actual);
    } else {
      System.out.println(".");
    }
  }
}
