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
      end
      
      # Indicates whether the pair has been covered by some previously-generated test case.
      def covered?
        false
      end
      
      # Indicates whether the pair has been excluded from the list of tests to be generated.
      def excluded?
        false
      end
    end
  end
end