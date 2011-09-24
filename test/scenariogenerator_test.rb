# Tests for the Test::Pairwise::ScenarioGenerator class.
# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.

require 'test/unit'
require 'test/pairwise'

# Tests for the Test::Pairwise::ScenarioGenerator class.
class ScenarioGeneratorTests < Test::Unit::TestCase
  include Test::Pairwise
  
  # Ensures that we can construct a ScenarioGenerator object.
  def test_constructor_happy_path
    generator = ScenarioGenerator.new({:first => [:one, :two, :three],
                                       :second => [:foo, :bar, :baz],
                                       :third => [:eins, :zwei, :drei]})
    
    assert_equal 9, generator.pairs(:first, :second), 'There should be nine generated pairs'
    assert_equal 9, generator.pairs(:first, :third), 'There should be nine generated pairs'
    assert_equal 9, generator.pairs(:second, :third), 'There should be nine generated pairs'
  end
end
