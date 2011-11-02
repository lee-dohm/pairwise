# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.
# 

require 'optparse'
require 'pathname'

module Test
  module Pairwise
    # The command-line interface for the pairwise tool.
    class Engine
      # Initializes a new instance of the +Engine+ class from the supplied command-line arguments.
      def initialize(*args)
        if parse_arguments(args) then
          read_input_file
        end
      end
      
      # Gets the parameter hash to be given to the Jenny utility.
      def hash
        @hash
      end
      
      # Gets the input file path.
      def input_file
        @input_file.to_s
      end
      
      # Gets the output file path, if it exists.
      def output_file
        @output_file ? @output_file.to_s : nil
      end
      
      # Gets the results of the run.
      def results
        @results
      end
      
      # Executes the Jenny utility to perform the heavy lifting.
      def run
        args = Jenny::parameters(@hash)
        output = Jenny::execute(args)
        @results = Jenny::parse(output, @hash)
      end
      
      # Writes the results to the appropriate stream.
      def write
        file = self.output_file ? File.open(self.output_file, 'w') : $stdout
        keys = @results[0].keys.sort
        
        begin
          file.puts(keys.join(','))
          @results.each do |row|
            items = items_for_keys(row, keys)
            file.puts(items.join(','))
          end
        ensure
          file.close
        end
      end
      
      # Returns the items for the given keys as an array.
      def items_for_keys(hash, keys)
        items = []
        keys.each do |key|
          items << hash[key]
        end
        items
      end
      private :items_for_keys
      
      # Parses the arguments supplied on the command line.
      def parse_arguments(args)
        @output_file = nil

        options = OptionParser.new do |opts|
          opts.banner = 'Usage: pairwise FILENAME [options]'
          
          opts.on('-o', '--output FILENAME', 'Write the output to FILENAME') do |output|
            @output_file = Pathname.new(output)
          end
          
          opts.separator ''
          opts.separator 'Common options:'
          
          opts.on_tail('-h', '--help', 'Show this message.') do
            puts opts
            return false
          end
          
          opts.on_tail('--version', 'Show version.') do
            puts version_text
            return false
          end
        end
        options.parse!(args)

        raise ArgumentError, "Must specify an input file" if args.count < 1
        raise ArgumentError, "There can be only one input file" if args.count > 1
        
        @input_file = Pathname.new(args[0])
        true
      end
      private :parse_arguments
      
      def read_input_file
        @hash = {}
        
        lines = []
        File.open(@input_file, 'r') do |file|
          lines = file.readlines
        end
        
        lines.each do |line|
          line.chomp!
          items = line.split(',')
          hash[items[0]] = items[1..-1]
        end
      end
      private :read_input_file
      
      # Puts together the version text from various constants.
      def version_text
        items = []
        items << "#{PRODUCT_NAME}"
        items << "v#{VERSION.join('.')}"
        items << "by #{AUTHOR}"
        items << "(#{AUTHOR_EMAIL})" if AUTHOR_EMAIL
        items.join(' ')
      end
      private :version_text
    end
  end
end
