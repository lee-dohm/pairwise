# Declares the class Test::Pairwise::TestPair.
# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.

module Test
  module Pairwise
    # A pair of values.
    class TestPair
      # The left value of the pair.
      attr_accessor :left
      
      # The right value of the pair.
      attr_accessor :right
      
      # Initializes a new instance of the TestPair class.
      def initialize(left, right)
        @left = left
        @right = right
        @covered = false
        @excluded = false
      end
      
      # Indicates whether the pair has been covered by an already-generated test case.
      def covered?
        @covered
      end
      
      # Sets whether the pair has been covered by an already-generated test case.
      def covered=(value)
        @covered = value
      end
      
      # Indicates whether the pair has been excluded from generated test cases.
      def excluded?
        @excluded
      end
      
      # Sets whether the pair should be excluded from generated test cases.
      def excluded=(value)
        @excluded = value
      end        
    end
  end
end