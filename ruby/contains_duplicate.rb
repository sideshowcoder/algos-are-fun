# https://www.programcreek.com/2014/05/leetcode-contains-duplicate-java/
# Given an array of integers find if the array contains duplicates

require "minitest/autorun"
require "set"

def contains_duplicate?(array)
  array.each_with_object(Set.new) do |i, seen|
    return true if seen.include?(i)
    seen << i
  end
  false
end

class ContainsDuplicateTest < Minitest::Test

  def test_contains_duplicate
    refute contains_duplicate?([])
    assert contains_duplicate?([1,1])
    assert contains_duplicate?([1,2,1])
    refute contains_duplicate?([1,2,3])
  end

end
