# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.
# 

require 'pathname'

module Test
  module Helpers
    # Reads in test data from a file in the test directory.
    def self.test_data(filename)
      path = test_file(filename)
      path.open('r') do |file|
        file.read
      end
    end
    
    # Finds a file in the test directory and returns the path.
    def self.test_file(filename)
      dir = Pathname.new(File.dirname(__FILE__))
      dir + filename
    end
  end
end
