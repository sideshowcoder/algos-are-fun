# Mergesort
require "minitest/autorun"

def merge(xs, ys)
  res = []
  while !xs.empty?
    break if ys.first.nil?

    if xs.first < ys.first
      res << xs.shift
    else
      res << ys.shift
    end
  end

  # return result with added remaining elements
  res + ys + xs
end


def mergesort(a)
  return a if a.size <= 1

  middle = (a.size / 2.0).ceil

  lower, higher = *a.each_slice(middle).to_a

  merge(mergesort(lower), mergesort(higher))
end

class MergeSortTest < Minitest::Test

  def test_mergesort
    arrays = [
      [1],
      [2,1],
      [1,2,3],
      [3,2,1],
      [38,27,43,3,9,82,10]
    ]

    arrays.each do |a|
      assert_equal a.sort, mergesort(a)
    end
  end
end
