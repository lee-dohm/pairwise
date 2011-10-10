# Implements the +Test::Pairwise::Engine+ class.
# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.

module Test
  module Pairwise  
    # Converts +num+ to a character based on 'a'.
    def to_char_index(num)
      if RUBY_VERSION =~ /^1\.8/
        a = "a"[0]
      else
        a = 'a'.ord
      end
      
      (a + num).chr.to_sym
    end

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
      
      # Gets the combination that matches the given set of values.
      def combination(values)
        match = Combination.new(values)
        found = @combinations.select { |c| c == match }
        found[0]
      end
      
      # Gets the set of combinations the engine is tracking.
      def combinations
        @combinations
      end
      
      # Marks a particular combination as covered.
      def cover(values)
        self.combination(values).covered = true
      end
      
      # Marks a particular combination as excluded.
      def exclude(values)
        self.combination(values).excluded = true
      end
      
      private
      
      # Gets the set of dimension combinations
      def dimension_combinations
        dimensions = (0...@value_counts.count).to_a
        dimensions.combination(2).to_a
      end
      
      # Gets the set of required combinations.
      def required_combinations
        combos = []
        
        dimension_combos = dimension_combinations
        dimension_combos.each do |combo|
          for i in 0...(@value_counts[combo[0]]) do
            for j in 0...(@value_counts[combo[1]]) do
              dim1 = to_char_index(combo[0])
              dim2 = to_char_index(combo[1])
              combos << Combination.new(dim1 => i, dim2 => j)
            end
          end
        end
        
        combos
      end
    end
  end
end