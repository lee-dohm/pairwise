# Spec tests for the +Test::Pairwise::Combination+ class.
# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.

require 'rubygems'
require 'minitest/spec'
require 'minitest/autorun'
require 'test/pairwise/combination'

include Test::Pairwise

describe Combination do
  it 'will accept a hash of key/value pairs' do
    combo = Combination.new(:first => 'a', :second => 'b')
    
    combo[:first].must_equal 'a'
    combo[:second].must_equal 'b'
  end
  
  it 'will be uncovered by default' do
    combo = Combination.new(:first => 'a', :second => 'b')
    
    combo.covered?.must_equal false
  end
  
  it 'can be set to covered' do
    combo = Combination.new(:first => 'a', :second => 'b')
    combo.covered = true
    
    combo.covered?.must_equal true
  end
  
  it 'will be included by default' do
    combo = Combination.new(:first => 'a', :second => 'b')
    
    combo.excluded?.must_equal false
  end
  
  it 'can be set to included' do
    combo = Combination.new(:first => 'a', :second => 'b')
    combo.excluded = true
    
    combo.excluded?.must_equal true
  end
  
  it 'can determine equality' do
    combo = Combination.new(:first => 'a', :second => 'b')
    other = Combination.new(:first => 'a', :second => 'b')
    
    combo.must_equal other
  end
  
  it 'must not take exclusion into account on equality' do
    combo = Combination.new(:first => 'a', :second => 'b')
    combo.excluded = true
    other = Combination.new(:first => 'a', :second => 'b')
    
    combo.must_equal other
  end
  
  it 'must not take covered into account on equality' do
    combo = Combination.new(:first => 'a', :second => 'b')
    combo.covered = true
    other = Combination.new(:first => 'a', :second => 'b')
    
    combo.must_equal other
  end
end