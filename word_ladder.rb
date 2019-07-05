# Word Ladder
# https://www.programcreek.com/2012/12/leetcode-word-ladder/

require "minitest/autorun"
require "set"

def valid_transformation?(from, to)
  return false unless from.size == to.size

  difference = from.chars.zip(to.chars)
                 .reject { |(x, y)| x == y }
  difference.size == 1
end

def word_ladder(from, to, dictionary)
  visted = Set[from]
  queue = [[from, [from]]]

  while word_path = queue.shift
    word, path = *word_path
    dictionary.each do |w|
      return path if word == to
      next if visted.include?(w)

      if valid_transformation?(word, w)
        queue << [w, path.dup << w]
        visted << w
      end
    end
  end

  []
end

class WordLadderTest < Minitest::Test

  def test_valid_transformation
    assert valid_transformation?("hot", "dot")
    refute valid_transformation?("hot", "ho")
    refute valid_transformation?("hot", "doo")
  end

  def test_word_ladder
    assert_equal [], word_ladder("lol", "dog", ["lol", "dog"])
    assert_equal ["hit", "hot"], word_ladder("hit", "hot", ["hit", "hot"])
    assert_equal ["hit", "hot", "dot"], word_ladder("hit", "dot", ["hit", "hot", "dot"])
    assert_equal ["hit", "hot", "dot", "dog"], word_ladder("hit", "dog", ["hit", "hot", "dot", "dog", "lot", "log"])
    assert_equal ["hit", "hot", "dot", "dog", "cog"], word_ladder("hit", "cog", ["hit", "hot", "dot", "dog", "lot", "log", "cog"])
  end
end
