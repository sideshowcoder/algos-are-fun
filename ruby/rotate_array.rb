# Rotate an array by k steps
# [1,2,3,4,5,6,7] with k = 3 would become [5,6,7,1,2,3,4]
# https://www.programcreek.com/2015/03/rotate-array-in-java/

require "minitest/autorun"

# optimized:
# don't rotate one at a time but slice of the end k items and prepend
def rotate_array(array, steps)
  steps = steps % array.size
  return array if steps.zero?

  tail_start = array.size - steps
  tail = array.slice!(tail_start, array.size)

  array.insert(0, *tail)
end

# naive:
# for the number of steps pop element of the end and prepend it to the front
#
# optimized so we don't overrotate meaning array [1,2,3] with k = 10 would do
# k % 3 = 1 steps not 10
def rotate_array_naive(array, steps)
  steps = steps % array.size
  return array if steps.zero?

  steps.times { array.unshift array.pop }
  array
end

class TestRotate < Minitest::Test
  def test_optimized_rotate
    assert_equal [5,6,7,1,2,3,4], rotate_array([1,2,3,4,5,6,7], 3)
    assert_equal [1,2,3], rotate_array([1,2,3], 3)
  end

  def test_rotate
    assert_equal [5,6,7,1,2,3,4], rotate_array_naive([1,2,3,4,5,6,7], 3)
    assert_equal [1,2,3], rotate_array_naive([1,2,3], 3)
  end
end

# require "benchmark"

# array = (1..1000).to_a
# steps = 100

# Benchmark.bm(10) do |x|
#   x.report("naive:")   { 100000.times { rotate_array_naive(array, steps) } }
#   x.report("optimized:") { 100000.times { rotate_array(array, steps) } }
# end
