# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.
# 

module Test
  module Pairwise
    class Engine
      attr_reader :input_file
      
      def initialize(args = nil)
        parse_arguments(args)
      end
      
      def parse_arguments(args)
        @input_file = args
      end
      private :parse_arguments
    end
  end
end
