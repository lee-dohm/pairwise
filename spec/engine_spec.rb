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
  
  it 'will generate an array of arrays of indices' do
    engine = Engine.new(3, 3, 3)
    
    cases = engine.generate()
    cases.each do |c|
      c.count.must_equal 3
      (c.all? { |v| v >= 0 && v < 3 }).must_equal true
    end
  end
end
