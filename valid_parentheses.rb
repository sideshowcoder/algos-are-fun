# https://www.programcreek.com/2012/12/leetcode-valid-parentheses-java/
# Valid Parentheses

require "minitest/autorun"

MATCHING = {
  ")" => "(",
  "}" => "{",
  "]" => "[",
  ">" => "<"
}

def valid_parens?(s)
  stack = []

  s.chars.each do |c|
    case c
    when *MATCHING.values
      stack << c
    when *MATCHING.keys
      return false unless stack.pop == MATCHING[c]
    end
  end

  stack.empty?
end

class ValidParensTest < Minitest::Test

  def test_basic_match
    assert valid_parens?("")
    assert valid_parens?("()")
    refute valid_parens?("(()")
    refute valid_parens?(")")
    refute valid_parens?("())")
  end

  def test_different_paren_types
    assert valid_parens?("({[<>]})")
    refute valid_parens?("({[<>])")
    refute valid_parens?("({[<>})")
    refute valid_parens?("({[<]})")
  end

  def test_in_context
    assert valid_parens?("hello world")
    assert valid_parens?("Hello( World) { foo bar [] baz} thing")
    refute valid_parens?("Hello( World) { foo bar [] baz} thing)")
    refute valid_parens?("Hello( World) { foo bar [ baz} thing")
  end
end
