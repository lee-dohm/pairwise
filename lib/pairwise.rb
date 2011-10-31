# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.
# 

require 'test/pairwise/engine'
require 'test/pairwise/jenny'

# Represents an error in the arguments passed to a method.
class ArgumentError < StandardError
end

module Test
  module Pairwise
    AUTHOR = 'Lee Dohm'
    AUTHOR_EMAIL = 'lee@liftedstudios.com'
    PRODUCT_NAME = 'pairwise'
    VERSION = [0, 5]
  end
end
