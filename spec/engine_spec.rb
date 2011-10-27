# Spec tests for the +Test::Pairwise::Engine+ class.
# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.

require 'rubygems'
require 'minitest/spec'
require 'minitest/autorun'
require 'test/pairwise/engine'

include Test::Pairwise

describe Engine do
  it 'accepts a series of counts of values in the dimensions' do
    Engine.new(3, 3, 3)
  end
  
  it 'will not accept less than two values' do
    proc {
      Engine.new(3)
    }.must_raise ArgumentError
  end
  
  it 'will not accept non-numeric counts of values' do
    proc {
      Engine.new(3, 'foo', 3)
    }.must_raise ArgumentError
  end
  
  it 'will not accept counts less than two' do
    proc {
      Engine.new(3, 3, 1)
    }.must_raise ArgumentError
  end
  
  it 'will calculate the list of required combinations' do
    engine = Engine.new(2, 2)
    
    engine.combinations.count.must_equal 4
    engine.combinations.must_include Combination.new(:a => 0, :b => 0)
    engine.combinations.must_include Combination.new(:a => 0, :b => 1)
    engine.combinations.must_include Combination.new(:a => 1, :b => 0)
    engine.combinations.must_include Combination.new(:a => 1, :b => 1)
  end
  
  it 'will allow covering a combination' do
    engine = Engine.new(2, 2)
    engine.cover(:a => 1, :b => 1)
    
    engine.combination(:a => 1, :b => 1).covered?.must_equal true
  end
  
  it 'will allow excluding a combination' do
    engine = Engine.new(2, 2)
    engine.exclude(:a => 1, :b => 1)
    
    engine.combination(:a => 1, :b => 1).excluded?.must_equal true
  end
  
  it 'will generate test cases one at a time' do
    engine = Engine.new(2, 2)
    test_case = engine.test_case
    
    (0..1).must_include test_case[test_case.keys[0]]
    (0..1).must_include test_case[test_case.keys[1]]
  end
  
  it 'will mark all combinations covered on generated test cases' do
    engine = Engine.new(2, 2)
    test_case = engine.test_case
    
    engine.combination(test_case).covered?.must_equal true
  end
end
