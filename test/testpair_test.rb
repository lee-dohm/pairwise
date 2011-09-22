# Tests for the Test::Pairwise::TestPair class.
# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.

require 'test/pairwise/testpair'

# Tests for the Test::Pairwise::TestPair class.
class TestPairTests < Test::Unit::TestCase  
  include Test::Pairwise
  
  # Ensures that we can create a TestPair with valid defaults.
  def test_constructor_happy_path
    pair = TestPair.new('left', 'right')
    
    assert_equal 'left', pair.left, 'The left value was not set properly'
    assert_equal 'right', pair.right, 'The right value was not set properly'
    assert_equal false, pair.excluded?, 'The pair should not be excluded by default'
    assert_equal false, pair.covered?, 'The pair should not start out as covered'
  end
  
  # Ensures that a no-parameter constructor is invalid.
  def test_constructor_throws_without_values
    assert_raise ArgumentError do
      TestPair.new
    end
  end
  
  # Ensures that a one-parameter constructor is invalid.
  def test_constructor_throws_with_only_one_value
    assert_raise ArgumentError do
      TestPair.new('foo')
    end
  end
  
  # Ensures that we can set the +excluded+ property and it does not change anything
  # it shouldn't.
  def test_can_set_excluded
    pair = TestPair.new('left', 'right')
    
    pair.excluded = true
    
    assert_equal 'left', pair.left, 'The left value was changed'
    assert_equal 'right', pair.right, 'The right value was changed'
    assert_equal true, pair.excluded?, 'The excluded property was not set'
    assert_equal false, pair.covered?, 'The covered property was changed'
  end
  
  # Ensures that we can set the +covered+ property and it does not change anything it
  # shouldn't.
  def test_can_set_covered
    pair = TestPair.new('left', 'right')
    
    pair.covered = true
    
    assert_equal 'left', pair.left, 'The left value was changed'
    assert_equal 'right', pair.right, 'The right value was changed'
    assert_equal false, pair.excluded?, 'The excluded property was changed'
    assert_equal true, pair.covered?, 'The ecovered property was not set'
  end
end
