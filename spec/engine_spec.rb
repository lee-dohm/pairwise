# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.
# 

require 'rubygems'
require 'minitest/spec'
require 'minitest/autorun'

require 'pairwise'

include Test::Pairwise

describe Engine do
  it 'can be constructed' do
    Engine.new
  end
  
  it 'will accept a filename argument' do
    engine = Engine.new('filename.txt')
    
    engine.input_file.must_equal 'filename.txt'
  end
end
