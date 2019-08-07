# Determine if a string is isomorphic
#
# A string is isomorphic if replacing the charactors yields the other string meaning:
#
# add -> egg: replacing a -> e and d -> g
# foo -> bar: there is no such replacement
#
# https://www.programcreek.com/2014/05/leetcode-isomorphic-strings-java/

require "minitest/autorun"

def isomorphic?(s, t)
  return false unless s.size == t.size

  replacements = {}
  mapped = Set[]

  s.chars.each_with_index do |s_char, index|
    t_char = t[index]
    replacement = replacements[s_char]
    t_mapped = mapped.include?(t_char)

    if replacement.nil? && !t_mapped
      replacements[s_char] = t_char
      mapped << t_char
    elsif replacement != t_char
      return false
    end
  end

  true
end

# Analysis:

# Need to walk s with length n -> O(n)
# Assuming size is stored with the string O(1) for size calculation
# Replacement memory size is each replacement store meaning 2n -> O(n) memory
# mapped stores all chars seen meaning n -> O(n) memory

class IsomorphicStringTest < Minitest::Test
  def test_isomorphic
    assert isomorphic?("egg", "add")
  end

  def test_non_isomorphic
    refute isomorphic?("abc", "ab")
    refute isomorphic?("foo", "bar")
    refute isomorphic?("egd", "add")
    refute isomorphic?("add", "egd")
  end
end
