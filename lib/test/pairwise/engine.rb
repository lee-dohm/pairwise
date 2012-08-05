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
        @arguments = args
      end
      
      # Generates the resulting test cases and stores them.
      def generate_results
        args = Jenny::parameters(@hash)
        output = Jenny::execute(args)
        @results = Jenny::parse(output, @hash)
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
      
      # Parses the arguments supplied on the command line.
      def parse_arguments
        @output_file = nil
        @execute = nil

        options = OptionParser.new do |opts|
          opts.banner = 'Usage: #{opts.program_name} FILENAME [options]'
          
          opts.on('-o', '--output FILENAME', 'Write the output to FILENAME') do |output|
            @output_file = Pathname.new(output)
          end
          
          opts.separator ''
          opts.separator 'Common options:'
          
          opts.on_tail('-h', '--help', 'Show this message.') do
            puts opts
            return
          end
          
          opts.on_tail('--version', 'Show version.') do
            puts version_text
            return
          end
        end
        options.parse!(@arguments)

        @execute = true

        raise ArgumentError, "Must specify an input file" if @arguments.count < 1
        raise ArgumentError, "There can be only one input file" if @arguments.count > 1
        
        @input_file = Pathname.new(@arguments[0])
      end
      
      def read_input
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
      
      # Gets the results of the run.
      def results
        @results
      end
      
      # Executes the normal command-line flow for the +Engine+.
      def run
        parse_arguments
        
        if @execute then
          read_input
          generate_results
          write_output
        end
      end
      
      # Writes the results to the appropriate stream.
      def write_output
        file = self.output_file ? File.open(self.output_file, 'w') : $stdout
        keys = @results[0].keys.sort
        
        begin
          file.puts(keys.join(','))
          @results.each do |row|
            items = row.values_at(*keys)
            file.puts(items.join(','))
          end
        ensure
          file.close
        end
      end
      
      # Puts together the version text from various constants.
      def version_text
        items = []
        items << "#{GEM_NAME}"
        items << "v#{VERSION}"
        items << "by #{AUTHOR}"
        items << "(#{AUTHOR_EMAIL})" if AUTHOR_EMAIL
        items.join(' ')
      end
      private :version_text
    end
  end
end
