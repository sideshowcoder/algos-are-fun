import com.google.common.base.MoreObjects;
import java.util.HashSet;

public class LinkedListCycleDetect {

  private static boolean detectCycle(Node list) {
    Node slowPointer = list;
    Node fastPointer = list.next;
    while (fastPointer != null) {
      if (fastPointer.equals(slowPointer)) {
        return true;
      } else {
        slowPointer = slowPointer.next;
        try {
          fastPointer = fastPointer.next.next;
        } catch (NullPointerException e) {
          // the list is terminated, so no way there is a cycle
          return false;
        }
      }
    }
    return false;
  }

  public static void main(String... args) {
    final Node listNoCycle = new Node(1, new Node(2, new Node(3, null)));
    System.out.println("List: " + listNoCycle.toString() + " cycle: " + detectCycle(listNoCycle));

    final Node listOneNode = new Node(1, null);
    System.out.println("List: " + listOneNode.toString() + " cycle: " + detectCycle(listOneNode));

    final Node tail = new Node(3, null);
    final Node listWithCycle = new Node(1, new Node(2, tail));
    tail.next = listWithCycle;
    System.out.println("List: " + listWithCycle.toString() + " cycle: " + detectCycle(listWithCycle));
  }

  private static class Node {
    private final int value;
    private Node next;

    private Node(int value, Node next) {
      this.value = value;
      this.next = next;
    }

    @Override
    public String toString() {
      final StringBuilder builder = new StringBuilder();
      final HashSet<Node> visited = new HashSet<>();
      builder.append("Node{" + value);
      Node current = next;
      while (current != null && !visited.contains(current)) {
        visited.add(current);
        builder.append("," + current.value);
        current = current.next;
      }
      builder.append("}");
      return builder.toString();

    }
  }

}
