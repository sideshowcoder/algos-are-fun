def rotate_array(array, steps)
  steps = steps % array.size
  return array if steps.zero?

  tail_end = array.size - 1
  tail_start = array.size - steps
  tail = array.slice!(tail_start, array.size)

  array.insert(0, *tail)
end


def rotate_array_naive(array, steps)
  steps = steps % array.size
  return array if steps.zero?

  steps.times { array.unshift array.pop }
  array
end

p rotate_array [1,2,3,4,5,6,7], 3 # => [5,6,7,1,2,3,4]
p rotate_array [1,2,3], 3 # => [5,6,7,1,2,3,4]

p rotate_array_naive [1,2,3,4,5,6,7], 3 # => [5,6,7,1,2,3,4]
p rotate_array_naive [1,2,3], 3 # => [5,6,7,1,2,3,4]


require "benchmark"

array = (1..1000).to_a
steps = 100

Benchmark.bm(10) do |x|
  x.report("naive:")   { 100000.times { rotate_array_naive(array, steps) } }
  x.report("optimized:") { 100000.times { rotate_array(array, steps) } }
end
