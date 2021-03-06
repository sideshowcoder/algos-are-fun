# Reverse the words in a string
# "foo bar baz" becomes "baz bar foo"
# https://www.programcreek.com/2014/05/leetcode-reverse-words-in-a-string-ii-java/

def my_reverse_sub(array, head, tail)
  while head < tail
    tmp = array[head]
    array[head] = array[tail]
    array[tail] = tmp
    head += 1
    tail -= 1
  end

  array
end

def my_reverse(array)
  head = 0
  tail = array.size - 1
  my_reverse_sub(array, head, tail)
end

class ReverseTest < Minitest::Test
  def test_reverse_inline
    a = "foobar"
    my_reverse_sub(a, 3, 5)
    assert_equal a, "foorab"
  end
end

# Allocating an extra array to do the reversal
def reverse_word_by_word_naive(s)
  words = s.split(" ")
  my_reverse(words).join(" ")
end

# Space optimized, reversal only requires 1 additional variable (tmp) everything
# else is done inline meaning this operates in O(1) space every word needs to be
# reversed twice meaning 2n with n number of chars in string, giving O(n) time
# complexity
def reverse_word_by_word_optimized(s)
  last_word_bound = 0
  current_word_bound = 0
  while current_word_bound < s.size
    if s[current_word_bound] == " "
      # reverse the current word
      my_reverse_sub(s, last_word_bound, current_word_bound - 1)
      last_word_bound = current_word_bound + 1
    end
    current_word_bound += 1
  end
  # reverse the last word in the string
  my_reverse_sub(s, last_word_bound, s.size - 1)
  # reverse the whole string
  my_reverse(s)
end


class ReverseByWordTest < Minitest::Test
  def test_reverse_by_word
    assert_equal "baz bar foo", reverse_word_by_word_naive("foo bar baz")
  end

  def test_reverse_by_word_optimized
    assert_equal "baz bar foo", reverse_word_by_word_optimized("foo bar baz")
    assert_equal "", reverse_word_by_word_optimized("")
    assert_equal " ", reverse_word_by_word_optimized(" ")
    assert_equal " baz bar foo ", reverse_word_by_word_optimized(" foo bar baz ")
  end
end
