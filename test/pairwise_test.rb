# Tests for the Test::Pairwise module.
#
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.

require 'test/unit'
require 'test/pairwise'

# Tests for the Test::Pairwise module.
class PairwiseTests < Test::Unit::TestCase
  include Test::Pairwise

  # Performs per-test setup.
  def setup
    @left = @right = [:a, :b, :c]
  end
  
  # Ensures that all pairs are generated from the two lists.
  def test_generate_all_pairs
    pairs = generate_all_pairs(@left, @right)
    
    assert_equal 9, pairs.count, 'The wrong number of elements are in the list of pairs'
    assert_equal true, pairs.include?(TestPair.new(:a, :a)), 'The a-a pair is not included in the list'
    assert_equal true, pairs.include?(TestPair.new(:a, :b)), 'The a-b pair is not included in the list'
    assert_equal true, pairs.include?(TestPair.new(:a, :c)), 'The a-c pair is not included in the list'
    assert_equal true, pairs.include?(TestPair.new(:b, :a)), 'The b-a pair is not included in the list'
    assert_equal true, pairs.include?(TestPair.new(:b, :b)), 'The b-b pair is not included in the list'
    assert_equal true, pairs.include?(TestPair.new(:b, :c)), 'The b-c pair is not included in the list'
    assert_equal true, pairs.include?(TestPair.new(:c, :a)), 'The c-a pair is not included in the list'
    assert_equal true, pairs.include?(TestPair.new(:c, :b)), 'The c-b pair is not included in the list'
    assert_equal true, pairs.include?(TestPair.new(:c, :c)), 'The c-c pair is not included in the list'
  end
  
  # Ensures that the all pairs method raises an error when supplied with an empty left list.
  def test_generate_all_pairs_raises_when_supplied_with_an_empty_left_list
    assert_raise ArgumentError do
      generate_all_pairs([], @right)
    end
  end
  
  # Ensures that the all pairs method raises an error when supplied with an empty right list.
  def test_generate_all_pairs_raises_when_supplied_with_an_empty_right_list
    assert_raise ArgumentError do
      generate_all_pairs(@left, [])
    end
  end
  
  # Ensures that the all pairs method raises an error when supplied nil as the left parameter.
  def test_generate_all_pairs_raises_when_left_is_nil
    assert_raise ArgumentError do
      generate_all_pairs(nil, @right)
    end
  end
  
  # Ensures that the all pairs method raises an error when supplied nil as the right parameter.
  def test_generate_all_pairs_raises_when_right_is_nil
    assert_raise ArgumentError do
      generate_all_pairs(@left, nil)
    end
  end
  
  # Ensures that the all pairs method raises an error when supplied a left list with only one item.
  def test_generate_all_pairs_raises_when_there_is_only_one_item_in_left_list
    assert_raise ArgumentError do
      generate_all_pairs(@left.take(1), @right)
    end
  end
  
  # Ensures that the all pairs method raises an error when supplied a right list with only one item.
  def test_generate_all_pairs_raises_when_there_is_only_one_item_in_right_list
    assert_raise ArgumentError do
      generate_all_pairs(@left, @right.take(1))
    end
  end
end
