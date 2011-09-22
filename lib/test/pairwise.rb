# The Test::Pairwise module contains tools and utilities for creating pairwise test sets from lists of
# independent equivalence classes.
#
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.

require 'test/pairwise/testpair'

module Test
  # Contains tools and utilities for creating pairwise test sets from lists of independent equivalence
  # classes.
  module Pairwise
    # Generates all pairs from the two lists.
    def generate_all_pairs(left, right)
      raise ArgumentError, 'The left list cannot be nil or empty.' if left.nil? || left.empty?
      raise ArgumentError, 'The right list cannot be nil or empty.' if right.nil? || right.empty?
      
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
