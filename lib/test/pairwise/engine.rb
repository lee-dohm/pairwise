# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.
# 

require 'pathname'

module Test
  module Pairwise
    # The command-line interface for the pairwise tool.
    class Engine
      # Initializes a new instance of the +Engine+ class from the supplied command-line arguments.
      def initialize(*args)
        parse_arguments(args)
      end
      
      # Gets the input file path.
      def input_file
        @input_file.to_s
      end
      
      # Parses the arguments supplied on the command line.
      def parse_arguments(args)
        @input_file = Pathname.new(args[0])
      end
      private :parse_arguments
    end
  end
end
