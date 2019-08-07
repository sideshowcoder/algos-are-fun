# Find the maximum sum continuous subarray
# known as Kadene's algorithm
# https://leetcode.com/problems/maximum-subarray/

require "minitest/autorun"

def max_sum(array)
  current_max = global_max = array.shift

  while n = array.shift
    current_max = [current_max + n, n].max
    if current_max > global_max
      global_max = current_max
    end
  end

  global_max
end

class MaxSumTest < Minitest::Test
  def test_max_sum
    assert_equal 4, max_sum([1, -1, 3, 1, -2])
    assert_equal 6, max_sum([-2, 1, -3, 4, -1, 2, 1, -5, 4])
  end
end
