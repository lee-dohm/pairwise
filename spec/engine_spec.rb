# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.
# 

require 'rubygems'

require 'minitest/spec'
require 'minitest/autorun'
require 'tempfile'

require 'pairwise'

include Test::Pairwise

describe Engine do
  SAMPLE = <<-TEXT
English,one,two,three
German,eins,zwei,drei
Japanese,ichi,ni,san
Spanish,uno,dos,tres
TEXT

  before do
    @sample_file = Tempfile.new('sample')
    @sample_file.write(SAMPLE)
    @sample_file.close
  end
  
  after do
    @sample_file.unlink
  end
  
  it 'will accept a filename argument' do
    engine = Engine.new(@sample_file.path)
    
    engine.input_file.must_equal @sample_file.path
  end
  
  it 'default to writing to stdout' do
    engine = Engine.new(@sample_file.path)
    
    engine.output_file.must_be_nil
  end
  
  it 'will accept an output file parameter' do
    engine = Engine.new(@sample_file.path, '--output', 'foo.txt')
    
    engine.output_file.must_equal 'foo.txt'
  end
  
  it 'will accept a short output file parameter' do
    engine = Engine.new(@sample_file.path, '-o', 'foo.txt')
    
    engine.output_file.must_equal 'foo.txt'
  end
  
  it 'will raise an error when more than one input file is supplied' do
    proc {
      Engine.new('foo.txt', 'bar.txt')
    }.must_raise ArgumentError
  end
  
  it 'will raise an error when no input file is specified' do
    proc {
      Engine.new
    }.must_raise ArgumentError
  end
  
  # it 'will output version text' do
  #   proc {
  #     Engine.new('--version')
  #   }.must_output "pairwise v0.5 by Lee Dohm (lee@liftedstudios.com)"
  # end
  
  it 'will accept a comma-delimited text file' do
    engine = Engine.new(@sample_file.path)
    
    engine.hash[:number].must_be_nil
    engine.hash['English'].wont_be_nil
    engine.hash['English'].must_equal ['one', 'two', 'three']
  end
end
