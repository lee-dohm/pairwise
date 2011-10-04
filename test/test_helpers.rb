# Defines the Test::Helpers module.
# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.

module Test
  # Various helper methods for testing.
  module Helpers
    # Validates that +actual+ is present in +expected+.
    def assert_include(expected, actual)
      assert_block("#{actual.inspect} was not found in #{expected.inspect}") do
        expected.include? actual
      end
    end
  end
end