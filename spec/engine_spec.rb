# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.
# 

require 'rubygems'
require 'minitest/spec'
require 'minitest/autorun'

require 'pairwise'

include Test::Pairwise

describe Engine do
  it 'will accept a filename argument' do
    engine = Engine.new('filename.txt')
    
    engine.input_file.must_equal 'filename.txt'
  end
  
  it 'will have a default output filename' do
    engine = Engine.new('filename.txt')
    
    engine.output_file.must_equal 'testcases.txt'
  end
  
  it 'will accept an output file parameter' do
    engine = Engine.new('filename.txt', '--output', 'foo.txt')
    
    engine.output_file.must_equal 'foo.txt'
  end
  
  it 'will accept a short output file parameter' do
    engine = Engine.new('filename.txt', '-o', 'foo.txt')
    
    engine.output_file.must_equal 'foo.txt'
  end
  
  it 'will raise an error when more than one input file is supplied' do
    proc {
      Engine.new('foo.txt', 'bar.txt')
    }.must_raise ArgumentError
  end
  
  it 'will raise an error when no input file is specified' do
    proc {
      Engine.new()
    }.must_raise ArgumentError
  end
end
