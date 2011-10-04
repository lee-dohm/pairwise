# Spec tests for Test::Pairwise::TestPair
# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.


require 'rubygems'
require 'minitest/spec'
require 'minitest/autorun'
require 'test/pairwise/testpair'

include Test::Pairwise

describe TestPair do
  it "will start uncovered" do
    TestPair.new(:left, :right).covered?.must_equal false
  end
  
  it "will start included" do
    TestPair.new(:left, :right).excluded?.must_equal false
  end
  
  it "will retain the left value" do
    TestPair.new(:left, :right).left.must_equal :left
  end
  
  it "will retain the right value" do
    TestPair.new(:left, :right).right.must_equal :right
  end
  
  it "will raise when not given a left or right" do
    proc {
      TestPair.new
    }.must_raise ArgumentError
  end
  
  it "will raise when only given one value" do
    proc {
      TestPair.new('foo')
    }.must_raise ArgumentError
  end
  
  it "will allow us to set the covered property" do
    pair = TestPair.new(:left, :right)
    
    pair.covered = true
    
    pair.left.must_equal :left
    pair.right.must_equal :right
    pair.excluded?.must_equal false
    pair.covered?.must_equal true
  end
  
  it "will allow us to set the excluded property" do
    pair = TestPair.new(:left, :right)
    
    pair.excluded = true
    
    pair.left.must_equal :left
    pair.right.must_equal :right
    pair.covered?.must_equal false
    pair.excluded?.must_equal true
  end
  
  it "can test for equality" do
    first = TestPair.new('left', 'right')
    second = TestPair.new('left', 'right')
    
    first.must_equal second
  end
end
