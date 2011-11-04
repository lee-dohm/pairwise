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

CC = 'gcc'
CC_FLAGS = "-O3"

CLOBBER << JENNY

##### Task definitions
task :default => [:jenny, :test]

task :jenny => ['bin/jenny']

desc 'Run all tests'
task :test => [:unit_test, :spec]

Rake::TestTask.new do |test|
  test.name = 'unit_test'
  test.libs << ['test']
  test.warning = true
  test.test_files = Dir['test/*_test.rb']
end

Rake::TestTask.new do |spec|
  spec.name = 'spec'
  spec.libs << ['spec']
  spec.warning = true
  spec.test_files = Dir['spec/*_spec.rb']
end

##### File definitions
file JENNY => JENNY_SRC do
  mkpath BINDIR
  sh "#{CC} #{CC_FLAGS} -o #{JENNY} #{JENNY_SRC}"
end


