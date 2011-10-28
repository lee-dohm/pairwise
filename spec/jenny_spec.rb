#
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.
# 

require 'rubygems'
require 'minitest/spec'
require 'minitest/autorun'

require 'pairwise'

include Test::Pairwise

describe Jenny do
  it 'can format basic parameters' do
    args = Jenny::parameters(:foo => ['a', 'b', 'c'], :bar => ['1', '2', '3', '4'])

    args.include?('-n2').must_equal true
    args.include?('3').must_equal true
    args.include?('4').must_equal true
  end

  it 'will raise an error if a value is not Enumerable' do
    proc {
      Jenny::parameters(:foo => ['a', 'b', 'c'], :bar => 5)
    }.must_raise ArgumentError
  end
  
  it 'can set the number of values per combination' do
    args = Jenny::parameters(:foo => ['a', 'b', 'c'], :bar => ['1', '2', '3', '4'], :number => 5)

    args.include?('-n5').must_equal true
    args.include?('3').must_equal true
    args.include?('4').must_equal true
  end
  
  it 'will raise an error if number does not respond to to_i' do
    proc {
      Jenny::parameters(:foo => ['a', 'b', 'c'], :bar => ['1', '2', '3', '4'], :number => StandardError.new)
    }.must_raise ArgumentError
  end
  
  it 'will raise an error if there are more than 65535 dimensions' do
    hash = {}
    (1..65536).each do |i|
      hash["foo_#{i}"] = [1, 2, 3]
    end
    
    proc {
      Jenny::parameters(hash)
    }.must_raise ArgumentError
  end
  
  it 'will raise an error if the number of values in any one dimension is greater than 52' do
    hash = {:foo => [1, 2, 3], :bar => (1..55).to_a}
    
    proc {
      Jenny::parameters(hash)
    }.must_raise ArgumentError
  end
end
