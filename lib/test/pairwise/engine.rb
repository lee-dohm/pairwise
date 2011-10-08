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
        raise ArgumentError, 'A count of less than two will not work.' if
          value_counts.any? { |c| c < 2 }
          
        @value_counts = value_counts
        @combinations = required_combinations
      end
      
      # Gets the set of required combinations.
      def required_combinations
        
      end
    end
  end
end