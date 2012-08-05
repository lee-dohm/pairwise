# encoding: UTF-8

# 
# Copyright:: Copyright 2011-2012 by Lifted Studios. All Rights Reserved.
# 

require File.expand_path('../lib/test/pairwise/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = [Test::Pairwise::AUTHOR]
  gem.email         = [Test::Pairwise::AUTHOR_EMAIL]
  gem.description   = "A module and utilities for generating pairwise test sets."
  gem.summary       = "A module and utilities for generating pairwise test sets."
  gem.homepage      = "https://github.com/lee-dohm/pairwise"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = Test::Pairwise::GEM_NAME
  gem.require_paths = ["lib"]
  gem.version       = Test::Pairwise::VERSION

  gem.add_development_dependency('minitest', '~> 3.3')  # Test library
  gem.add_development_dependency('redcarpet')           # For Markdown formatting in documentation
  gem.add_development_dependency('yard', '~> 0.8')      # Generate code documentation
end
