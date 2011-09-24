# The Test::Pairwise module contains tools and utilities for creating pairwise test sets from lists of
# independent equivalence classes.
#
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.

require 'test/pairwise/testpair'
require 'test/pairwise/scenariogenerator'

module Test
  # Contains tools and utilities for creating pairwise test sets from lists of independent equivalence
  # classes.
  module Pairwise
    # Generates all pairs from the two lists.
    def generate_all_pairs(left, right)
      raise ArgumentError, 'The left list cannot be nil and must have at least two items.' if left.nil? || left.length < 2
      raise ArgumentError, 'The right list cannot be nil and must have at least two items.' if right.nil? || right.length < 2
      
      pairs = []
      
      left.each do |x|
        right.each do |y|
          pairs << TestPair.new(x, y)
        end
      end
      
      pairs
    end
  end
end
