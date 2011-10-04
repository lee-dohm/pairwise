# Tests for the Test::Pairwise::ScenarioGenerator class.
# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.

require 'test/unit'
require 'test/pairwise'
require 'test_helpers'

# Tests for the Test::Pairwise::ScenarioGenerator class.
class ScenarioGeneratorTests < Test::Unit::TestCase
  include Test::Pairwise
  include Test::Helpers
  
  # Performs pre-test setup.
  def setup
    @test_values = { :first => [:one, :two, :three],
                     :second => [:foo, :bar, :baz],
                     :third => [:eins, :zwei, :drei] }
  end
  
  # Ensures that we can construct a ScenarioGenerator object.
  def test_constructor_happy_path
    generator = ScenarioGenerator.new(@test_values)
    
    assert_equal 9, generator.pairs(:first, :second).count, 'There should be nine generated pairs'
    assert_equal 9, generator.pairs(:first, :third).count, 'There should be nine generated pairs'
    assert_equal 9, generator.pairs(:second, :third).count, 'There should be nine generated pairs'
  end
  
  # The order of the equivalence classes should not be significant.
  def test_that_pairs_can_be_in_either_order
    generator = ScenarioGenerator.new(@test_values)
    
    first_second = generator.pairs(:first, :second)
    second_first = generator.pairs(:second, :first)
    
    assert_same first_second, second_first, 'The two should be the same object'
  end
  
  # Ensures that we can give a selection criteria to the pairs method.
  def test_pairs_select
    generator = ScenarioGenerator.new(@test_values)
    
    first_second = generator.pairs(:first, :second)
    first_second[1].covered = true
    first_second[2].excluded = true
    uncovered = generator.pairs(:first, :second) { |a| !a.covered? }
    included = generator.pairs(:first, :second) { |a| !a.excluded? }
    
    assert_equal 8, uncovered.count, 'There should only be eight uncovered pairs'
    assert_equal 8, included.count, 'There should only be eight included pairs'
  end
  
  # Ensures that pairs in select mode will return an empty list if there are no matches.
  def test_pairs_select_returns_an_empty_list_if_none_match
    generator = ScenarioGenerator.new(@test_values)
    
    first_second = generator.pairs(:first, :second)
    first_second.each { |item| item.covered = true }
    uncovered = generator.pairs(:first, :second) { |item| !item.covered? }
    
    assert_equal true, uncovered.empty?, 'The list was not empty'
  end
end
