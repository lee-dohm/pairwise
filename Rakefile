#
# Build file for the pairwise gem.
# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.
# 

require 'rubygems'
require 'rake/clean'
require 'rake/testtask'

task :default => [:jenny, :test]

GCC_FLAGS = "-O3"

SRC = FileList['src/jenny/*.c']
CLOBBER << FileList['bin/jenny', 'bin']

file 'bin/jenny' => SRC do
  mkdir 'bin'
  sh "gcc #{GCC_FLAGS} -o bin/jenny #{SRC}"
end

task :jenny => ['bin/jenny']

Rake::TestTask.new do |test|
    desc 'Run all tests'
    test.libs << ['test', 'spec']
    test.test_files = Dir['test/*_test.rb', 'spec/*_spec.rb']
end
