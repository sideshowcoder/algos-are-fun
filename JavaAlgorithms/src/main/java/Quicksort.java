import java.util.Arrays;

public class Quicksort {

  private static void swap(int[] nums, int posOne, int posTwo) {
    int temp = nums[posOne];
    nums[posOne] = nums[posTwo];
    nums[posTwo] = temp;
  }

  private static int partition(int[] nums, int startPos, int endPos) {
    int pivot = nums[endPos];

    for (int i = startPos; i < endPos; i++) {
      if (nums[i] < pivot) {
        swap(nums, startPos, i);
        startPos++;
      }
    }

    return startPos;
  }

  private static void quicksort(int[] nums, int startPos, int endPos) {
    int pivotPos = partition(nums, startPos, endPos);

    if(pivotPos - 1 > startPos) {
      quicksort(nums, startPos, pivotPos - 1);
    }

    if(pivotPos + 1 < endPos) {
      quicksort(nums, pivotPos + 1, endPos);
    }
  }

  private static void quicksort(int[] nums) {
    if (nums.length == 0) {
      return;
    }
    quicksort(nums, 0, nums.length - 1);
  }

	public static void main(String... args) {
    int[] in1 = new int[]{3,1,2};
    quicksort(in1);
    System.out.println("Input: [3,1,2] Expected: [1,2,3] Output: " + Arrays.toString(in1));


    int[] in2 = new int[]{};
    quicksort(in2);
    System.out.println("Input: [] Expected: [] Output: " + Arrays.toString(in2));

    int[] in3 = new int[]{1,2,3};
    quicksort(in3);
    System.out.println("Input: [1,2,3] Expected: [1,2,3] Output: " + Arrays.toString(in3));

    int[] in4 = new int[]{10,4,10,11};
    quicksort(in4);
    System.out.println("Input: [10,4,10,11] Expected: [4,10,10,11] Output: " + Arrays.toString(in4));
  }


}
