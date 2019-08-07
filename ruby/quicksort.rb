require "minitest/autorun"

def quicksort(a)
  return [] if a.empty?
  pivot = a.pop
  smaller, larger = a.partition { |e| e < pivot }
  quicksort(smaller) + [pivot] + quicksort(larger)
end

class QuickSortTest < Minitest::Test

  def test_qs
    arrays = [
      [1,2,3],
      [3,2,1]
    ]

    arrays.each do |a|
      assert_equal a.sort, quicksort(a)
    end
  end
end
