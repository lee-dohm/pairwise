# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.
# 

module Test
  module Pairwise
    # Interface methods for working with the Jenny pairwise-testing utility.
    module Jenny
      # Formats the parameters from the given values.
      def self.parameters(options)
        args = []
        
        if options[:number] then
          raise ArgumentError, "The value of the 'number' parameter does not appear to be a number." \
            unless options[:number].respond_to?(:to_i)
              
          num = options[:number].to_i
          args << "-n#{num}"
          options.delete(:number)
        else
          args << '-n2'
        end
        
        raise ArgumentError, "The number of dimensions is too large." unless options.keys.count <= 65535
          
        options.keys.each do |k|
          raise ArgumentError, "There doesn't appear to be more than one value in dimension #{k}." \
            unless options[k].is_a? Enumerable
          raise ArgumentError, "The number of values in dimension #{k} is too large." \
            unless options[k].count <= 52
            
          args << options[k].count.to_s
        end
        
        args
      end
    end
  end
end
