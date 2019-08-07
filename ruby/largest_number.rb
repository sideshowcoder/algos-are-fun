# https://www.programcreek.com/2014/02/leetcode-largest-number-java/ Find the
# largest number that can be composed of an array of strings

require "minitest/autorun"

def largest_number(a)
  a.map(&:to_s).sort { |a,b|
    (a + b) <=> (b + a)
  }.reverse.join
end

class LargestNumberTest < Minitest::Test
  def test_basic
    assert_equal "1", largest_number(["1"])
    assert_equal "21", largest_number(["1", "2"])
    assert_equal "321", largest_number(["1", "3", "2"])
  end

  def test_multi_char_strings
    assert_equal "454", largest_number(["4", "45"])
    assert_equal "996095", largest_number(["960", "95", "9"])
  end

  def test_no_string_intermix
    assert_equal "996095", largest_number(["960", 95, "9"])
  end
end
