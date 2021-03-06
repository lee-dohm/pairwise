# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.
# 

require 'rubygems'

gem 'minitest'

require 'minitest/spec'
require 'minitest/autorun'

require 'helpers'
require 'tempfile'

require 'pairwise'

include Test::Helpers
include Test::Pairwise

describe Engine do
  SAMPLE = Test::Helpers::test_data('test.txt')
  TEST_OUTPUT = Test::Helpers::test_data('output.txt')

  before do
    @sample_file = Test::Helpers::test_file('test.txt')
  end
  
  it 'will accept a filename argument' do
    engine = Engine.new(@sample_file.to_s)
    engine.parse_arguments
    
    engine.input_file.must_equal @sample_file.to_s
  end
  
  it 'default to writing to stdout' do
    engine = Engine.new(@sample_file.to_s)
    engine.parse_arguments
    
    engine.output_file.must_be_nil
  end
  
  it 'will accept an output file parameter' do
    engine = Engine.new(@sample_file.to_s, '--output', 'foo.txt')
    engine.parse_arguments
    
    engine.output_file.must_equal 'foo.txt'
  end
  
  it 'will accept a short output file parameter' do
    engine = Engine.new(@sample_file.to_s, '-o', 'foo.txt')
    engine.parse_arguments
    
    engine.output_file.must_equal 'foo.txt'
  end
  
  it 'will raise an error when more than one input file is supplied' do
    engine = Engine.new('foo.txt', 'bar.txt')
    proc {
      engine.parse_arguments
    }.must_raise ArgumentError
  end
  
  it 'will raise an error when no input file is specified' do
    engine = Engine.new
    proc {
      engine.parse_arguments
    }.must_raise ArgumentError
  end
  
  it 'will output version text' do
    engine = Engine.new('--version')
    
    proc {
      engine.run
    }.must_output "lifted-pairwise v0.9.0 by Lee Dohm (lee@liftedstudios.com)\n"
  end
  
  it 'will accept a comma-delimited text file' do
    engine = Engine.new(@sample_file.to_s)
    engine.parse_arguments
    engine.read_input
    
    engine.hash[:number].must_be_nil
    engine.hash['English'].wont_be_nil
    engine.hash['English'].must_equal ['one', 'two', 'three']
  end
  
  it 'will execute the Jenny utility and parse the results' do
    engine = Engine.new(@sample_file.to_s)
    engine.parse_arguments
    engine.read_input
    engine.generate_results
    
    results = engine.results
    results[0]['English'].must_equal 'one'
    results[0]['German'].must_equal 'eins'
    results[0]['Japanese'].must_equal 'san'
    results[0]['Spanish'].must_equal 'uno'
  end
  
  it 'will translate the results to comma-delimited text and write it out' do
    engine = Engine.new(@sample_file.to_s)
    
    proc {
      engine.run
    }.must_output TEST_OUTPUT
  end
end
