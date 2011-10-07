# Implements the +Test::Pairwise::Engine+ class.
# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.

module Test
  module Pairwise
    # The pairwise test case generation engine.
    class Engine
      def initialize(*value_counts)
        raise ArgumentError, 'There must be at least two dimensions.' if 
          value_counts.count < 2
        raise ArgumentError, 'The value counts must be numeric.' if
          value_counts.any? { |c| !c.respond_to?(:to_int) }
      end
    end
  end
end