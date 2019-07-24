# Split a long message into multiple indexed submessages
#
# Target size 15
# foo bar baz buzz
# => foo bar (1/2)
# => baz buzz (2/2)


require "minitest/autorun"


class IndexedSplit

  INDEX_ELEMENT_SIZE = " (n/m)".size

  attr_reader :target_size, :full_message

  def initialize(target_size, full_message)
    @target_size = target_size
    @full_message = full_message
  end

  def to_a
    @messages ||= split
  end

  private

  def split
    words = full_message.split(" ")
  end
end


def indexed_split(target_size, full_message)
  IndexedSplit.new(target_size, full_message).to_a
end


class MessageSplitTest < Minitest::Test

  def test_simple_split
    target_size = 15
    full_message = "foo bar baz buzz"
    assert_equal ["foo bar (1/2)", "bar buzz (2/2)"], indexed_split(target_size, full_message)
  end

end
