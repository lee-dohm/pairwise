#
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.
# 

require 'rubygems'
require 'minitest/spec'
require 'minitest/autorun'

require 'pairwise'

include Test::Pairwise

describe Jenny do
  OUTPUT = <<-EOF
 1a 2a 3c 4a 
 1b 2c 3b 4c 
 1c 2b 3a 4b 
 1a 2b 3c 4c 
 1b 2a 3a 4c 
 1c 2a 3b 4a 
 1a 2c 3b 4b 
 1b 2b 3c 4b 
 1c 2c 3a 4a 
 1c 2c 3c 4c 
 1b 2b 3b 4a 
 1a 2a 3a 4b
EOF

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
  
  it 'can parse the output of Jenny into a more readable form' do
    hash = {'English' => ['one', 'two', 'three'], 
            'German' => ['eins', 'zwei', 'drei'],
            'Japanese' => ['ichi', 'ni', 'san'],
            'Spanish' => ['uno', 'dos', 'tres']}
            
    results = Jenny::parse(OUTPUT, hash)
    
    results[0]['English'].must_equal 'one'
    results[0]['German'].must_equal 'eins'
    results[0]['Japanese'].must_equal 'san'
    results[0]['Spanish'].must_equal 'uno'
  end
end
