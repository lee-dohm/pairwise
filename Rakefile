#
# Build file for the pairwise gem.
# 
# Copyright:: Copyright (c) 2011 by Lifted Studios.  All Rights Reserved.
# 

require 'rubygems'
require 'rake/clean'
require 'rake/testtask'

##### Constants
BINDIR = 'bin'
VNDDIR = 'vendor'

JENNY = "#{BINDIR}/jenny"
JENNY_SRC = FileList["#{VNDDIR}/jenny/*.c"]

GCC = 'gcc'
GCC_FLAGS = "-O3"

CLOBBER << JENNY

##### Task definitions
task :default => [:jenny, :test]

task :jenny => ['bin/jenny']

Rake::TestTask.new do |test|
  test.libs << ['test', 'spec']
  test.test_files = Dir['test/*_test.rb', 'spec/*_spec.rb']
end

##### File definitions
file JENNY => JENNY_SRC do
  mkpath BINDIR
  sh "#{GCC} #{GCC_FLAGS} -o #{JENNY} #{JENNY_SRC}"
end


