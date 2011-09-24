# Declares the class Test::Pairwise::ScenarioGenerator.
# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.

require 'set'

module Test
  module Pairwise
    # Generates the set of test scenarios from the given sets of independent equivalence classes.
    class ScenarioGenerator
      # Initializes a new instance of the +ScenarioGenerator+ class.
      def initialize(parameters)
        @scenario_pairs = {}
        parameters.keys.combination(2).each do |combo|
          keypair = combo.to_set
          pairs = Pairwise.generate_all_pairs(parameters[combo[0]], parameters[combo[1]])
          @scenario_pairs[keypair] = pairs
        end
      end
      
      # Returns the list of all pairs of values for the two parameters.
      def pairs(first, second)
        seekset = Set.new [first, second]
        @scenario_pairs[seekset]
      end
    end
  end
end