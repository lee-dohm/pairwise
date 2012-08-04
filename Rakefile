#
# Build file for the pairwise gem.
# 
# Copyright:: Copyright (c) 2011-2012 by Lifted Studios.  All Rights Reserved.
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

task :jenny => [JENNY]

desc 'Run all tests'
task :test => [:spec]

Rake::TestTask.new('spec') do |t|
  t.libs << ['spec']
  t.warning = true
  t.test_files = Dir['spec/*_spec.rb']
end

##### File definitions
file JENNY => JENNY_SRC do
  mkpath BINDIR
  sh "#{CC} #{CC_FLAGS} -o #{JENNY} #{JENNY_SRC}"
end
