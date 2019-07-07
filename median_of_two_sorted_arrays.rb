# Compute the median of 2 sorted arrays
# https://www.programcreek.com/2012/12/leetcode-median-of-two-sorted-arrays-java/

# Median: Number where half the numbers are bigger, and half the numbers are
# smaller

# Find the nth element where n is (array1.size + array2.size)/2 in the sorted
# case

require "minitest/autorun"

def median_two_arrays_naive(a1, a2)
  raise "no elements" if a1.size.zero? && a2.size.zero?

  total_size = a1.size + a2.size
  median = nil

  if total_size == 1 # only one array has an element
    if a1.first.nil?
      median = a2.first
    else
      median = a1.first
    end
  else
    k = total_size/2 + 1
    a1_index = 0
    a2_index = 0
    a1_val = a1[a1_index]
    a2_val = a2[a2_index]
    last_median = nil
    current_median = if a1_val.nil?
                       a2_val
                     elsif a2_val.nil?
                       a1_val
                     else
                       [a1_val, a2_val].min
                     end

    k.times do
      a1_val = a1[a1_index]
      a2_val = a2[a2_index]

      if a1_val.nil?
        last_median = current_median
        current_median = a2[a2_index]
        a2_index += 1
      elsif a2_val.nil?
        last_median = current_median
        current_median = a1[a1_index]
        a1_index += 1
      elsif a2_val < a1_val
        last_median = current_median
        current_median = a2[a2_index]
        a2_index += 1
      elsif a1_val <= a2_val
        last_median = current_median
        current_median = a1[a1_index]
        a1_index += 1
      else
        raise "This should never happen."
      end
    end

    if total_size.even?
      median = (last_median + current_median).to_f/2.0
    else
      median = current_median
    end
  end

  median
end

def median_two_arrays_optimized(a1, a2)
  # runtime should be O(log(m+n)) meaning instead of stepping through the arrays
  # one by one we jump in a kind of binary search.
end

class Median2ArrayTest < Minitest::Test
  def test_1_empty_array
    assert_equal 2, median_two_arrays_naive([1,2,3], [])
    assert_equal 2, median_two_arrays_naive([], [1,2,3])
    assert_equal 1, median_two_arrays_naive([1], [])
  end

  def test_k_not_even
    assert_equal 2, median_two_arrays_naive([1,2,3], [1,2])
    assert_equal 3, median_two_arrays_naive([1,2,3], [4,5])
    assert_equal 3, median_two_arrays_naive([4,5], [1,2,3])
    assert_equal 3, median_two_arrays_naive([2,5], [1,3,5])
  end

  def test_k_even
    assert_equal 2, median_two_arrays_naive([1,3], [1,3])
    assert_equal 1.5, median_two_arrays_naive([1,2], [1,2])
  end
end
