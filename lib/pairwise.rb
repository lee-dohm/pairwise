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
    VERSION = [0, 9]
    JENNY_PATH = Pathname.new(File.expand_path(File.dirname(File.dirname(__FILE__)))) + 'bin' + 'jenny'
  end
end
