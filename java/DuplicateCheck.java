import java.util.Set;
import java.util.Collection;
import java.util.Arrays;
import java.util.HashSet;

public class DuplicateCheck {

  private static <T> boolean containsDuplicate(Collection<T> coll) {
    Set<T> seen = new HashSet<>();

    for(T o : coll) {
      if(seen.contains(o)) return true;
      seen.add(o);
    }

    return false;
  }

  public static void main(String... args) {
    assert !containsDuplicate(Arrays.asList(1,2,3)) : "Detected duplicate in error";
    assert containsDuplicate(Arrays.asList(1,2,2)) : "Didn't detect duplicate";
    assert !containsDuplicate(Arrays.asList("foo","bar","baz")) : "Detected duplicate in error";
    assert containsDuplicate(Arrays.asList("foo","bar","foo")) : "Didn't detect duplicate";
  }

}
