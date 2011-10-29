# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.
# 

module Test
  module Pairwise
    # Interface methods for working with the Jenny pairwise-testing utility.
    module Jenny
      KEYS_TO_REMOVE = [:number]
      
      # Formats the parameters from the given values.
      def self.parameters(options)
        args = []
        
        if options[:number] then
          raise ArgumentError, "The value of the 'number' parameter does not appear to be a number." \
            unless options[:number].respond_to?(:to_i)
              
          num = options[:number].to_i
          args << "-n#{num}"
        else
          args << '-n2'
        end
        
        dimensions = remove_options(options)
        
        raise ArgumentError, "The number of dimensions is too large." unless dimensions.keys.count <= 65535
          
        sorted_keys = dimensions.keys.sort
        sorted_keys.each do |k|
          raise ArgumentError, "There doesn't appear to be more than one value in dimension #{k}." \
            unless options[k].is_a? Enumerable
          raise ArgumentError, "The number of values in dimension #{k} is too large." \
            unless options[k].count <= 52
            
          args << dimensions[k].count.to_s
        end
        
        args
      end
      
      def self.parse(output, options)
        dimensions = remove_options(options)
        sorted_keys = dimensions.keys.sort

        results = []
        lines = output.split("\n")        
        lines.each do |line|
          items = line.split(" ")
          
          result = {}
          items.each do |item|
            item.chomp!
            if (item.length > 0) then
              dimension = (item[0..-2]).to_i - 1
              value = value_map(item[-1])
              key = sorted_keys[dimension]
              result[key] = dimensions[key][value]
            end
          end
          
          results << result
        end
        
        results
      end
      
      # Removes the option keys from the hash so all we're left with is the dimensions.
      def self.remove_options(options)
        dimensions = {}
        dimensions.replace(options)
        dimensions.delete_if { |key, value| KEYS_TO_REMOVE.include?(key) }
        dimensions
      end
      
      def self.value_map(char)
        if ord(char) >= ord('a') && ord(char) <= ord('z') then
          ord(char) - ord('a')
        elsif ord(char) >= ord('A') && ord(char) <= ord('Z') then
          ord(char) - ord('A') + 26
        else
          raise ArgumentError, "The value '#{char}' could not be converted."
        end
      end
      
      # Gets the ordinal value of the character.
      def self.ord(char)
        if char.is_a? Fixnum then
          return char
        end
        
        if RUBY_VERSION =~ /^1\.8/ then
          char[0]
        else
          char.ord
        end
      end
    end
  end
end
