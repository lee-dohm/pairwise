# Implements the +Test::Pairwise::Engine+ class.
# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.

module Test
  module Pairwise
    # The pairwise test case generation engine.
    class Engine
      # Initializes a new instance of the +Engine+ class.
      def initialize(*value_counts)
        raise ArgumentError, 'There must be at least two dimensions.' if 
          value_counts.count < 2
        raise ArgumentError, 'The value counts must be numeric.' if
          value_counts.any? { |c| !c.respond_to?(:to_int) }
        raise ArgumentError, 'Less than two values in a dimension will not work.' if
          value_counts.any? { |c| c < 2 }
          
        @value_counts = value_counts
        @combinations = required_combinations
      end
      
      # Gets the set of dimension combinations
      def dimension_combinations
        dimensions = (0...@value_counts.count).to_a
        dimensions.combination(2).to_a
      end
      
      # Gets the set of required combinations.
      def required_combinations
        combos = []
        
        dimension_combos = self.dimension_combinations
        dimension_combos.each do |combo|
          for i in 0...(@value_counts[combo.first]) do
            for j in 0...(@value_counts[combo.second]) do
              combos << [i, j]
            end
          end
        end
        
        combos
      end
    end
  end
end