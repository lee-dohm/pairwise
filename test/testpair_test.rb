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
    
    assert_equal 'left', pair.left, 'The left parameter was not set properly'
    assert_equal 'right', pair.right, 'The right parameter was not set properly'
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
end
