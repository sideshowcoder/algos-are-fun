# Notes:
# - Numbers can not be negative since we use the digits of a string and a negative number is > 1 symbol
# - 0 is special as it multiplying by 0 will always make the result <= to what it was so 0 needs to always be surronded by `+`
# - 1 is special as multiplying by 1 will always keep the result = to the before, while adding would increase
# - 1 means it is undecidable if the result should be mul or add, therefor we need to backtrack potentially


def max_number_rec(prefix_result, nums)
  if nums.empty?
    return eval prefix_result
  end

  numbers = nums.dup
  current = numbers.shift
  current_value = eval prefix_result

  if current_value.zero? || current.zero?
    max_number_rec("#{prefix_result} + #{current}", numbers)
  elsif prefix_result == 1
    max_number_rec("#{prefix_result} + #{current}", numbers)
  else
    [
      max_number_rec("#{prefix_result} + #{current}", numbers),
      max_number_rec("#{prefix_result} * #{current}", numbers)
    ].max
  end
end

def max_number(s)
  max_number_rec "0", s.split("").map(&:to_i)
end

puts max_number("20")
puts max_number("02")
puts max_number("2")
puts max_number("21")
puts max_number("214")
puts max_number("21114")
