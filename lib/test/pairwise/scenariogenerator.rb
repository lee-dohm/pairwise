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
        @keys = parameters.keys
        @key_combinations = @keys.combination(2).to_a
        @key_combinations.each do |combo|
          keypair = combo.to_set
          pairs = Pairwise.generate_all_pairs(parameters[combo[0]], parameters[combo[1]])
          @scenario_pairs[keypair] = pairs
        end
      end
      
      # Returns the list of all pairs of values for the two parameters.
      def pairs(*args, &block)
        return @scenario_pairs[args.to_set].select &block unless block.nil?
        
        @scenario_pairs[args.to_set]
      end
      
      # Returns one scenario from the list of possibilities.
      def scenario
        scenario = {}
        @keys.each { |k| scenario[k] = nil }
                
        scenario
      end
    end
  end
end