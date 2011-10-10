# Defines the +Test::Pairwise::Combination+ class.
# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.

module Test
  module Pairwise
    # Represents a specific combination of values from given test dimensions.
    class Combination
      # Initializes a new instance of the +Combination+ class.
      def initialize(values)
        @values = values
        @covered = false
        @excluded = false
      end
      
      # Gets the value associated with the given dimension.
      def [](key)
        @values[key]
      end
      
      # Determines equality with another object.
      def ==(other)
        @values == other.values
      end
      
      # Gets a flag indicating whether the combination has been covered by
      # previous test cases.
      def covered?
        @covered
      end
      
      # Sets the flag indicating whether the combination has been covered by
      # previous test cases.
      def covered=(value)
        @covered = value
      end
      
      # Gets a flag indicating whether the combination has been excluded from
      # being used in test cases.
      def excluded?
        @excluded
      end
      
      # Sets the flag indicating whether the combination has been excluded from
      # being used in test cases.
      def excluded=(value)
        @excluded = value
      end
      
      # Gets the entire hash of values.
      def values
        @values
      end
    end
  end
end