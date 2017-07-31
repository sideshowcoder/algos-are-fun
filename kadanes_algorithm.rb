# Find the maximum sum subarray

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


p max_sum [1, -1, 3, 1, -2]
p max_sum [-2, 1, -3, 4, -1, 2, 1, -5, 4]
