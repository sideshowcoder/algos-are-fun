def eval_factor expr
  value = expr.shift
  raise ArgumentError, "#{value} not a number" unless value.is_a? Numeric
  value
end

def eval_mul expr
  factor = eval_factor expr

  while expr.first == :mul
    expr.shift
    factor *= eval_factor expr
  end

  factor
end

def eval_sum expr
  sum = eval_mul expr

  while expr.first == :add
    expr.shift
    sum += eval_mul expr
  end

  sum
end

def eval_expr expr
  eval_sum expr
end

def max_number_rec(expr, nums)
  if nums.empty?
    return eval_expr expr
  end

  numbers = nums.dup
  current = numbers.shift
  prev = expr.last

  if prev.zero? || current.zero?
    max_number_rec(expr + [:add, current], numbers)
  else
    [
      max_number_rec(expr + [:add, current], numbers),
      max_number_rec(expr + [:mul, current], numbers)
    ].max
  end
end

def max_number(s)
  max_number_rec [0], s.split("").map(&:to_i)
end

p max_number("20")
p max_number("02")
p max_number("2")
p max_number("21")
p max_number("214")
p max_number("21114")
p max_number("21012")