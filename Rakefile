#!/usr/bin/env rake

#
# Build file for the pairwise gem.
# 
# Copyright:: Copyright (c) 2011-2012 by Lifted Studios.  All Rights Reserved.
# 

require 'rubygems'

require 'bundler/gem_tasks'
require 'rake/clean'
require 'rake/testtask'
require 'yard'

BINDIR = 'bin'
VNDDIR = 'vendor'

JENNY = "#{BINDIR}/jenny"
JENNY_SRC = FileList["#{VNDDIR}/jenny/*.c"]

CC = 'gcc'
CC_FLAGS = "-O3"

CLEAN.include('.yardoc')
CLOBBER.include('doc', 'pkg', JENNY)

task :default => [:jenny, :test, :yard]

task :jenny => [JENNY]

desc 'Execute all tests'
task :test => [:spec]

Rake::TestTask.new('spec') do |t|
  t.libs << ['spec']
  t.warning = true
  t.test_files = Dir['spec/*_spec.rb']
end

YARD::Rake::YardocTask.new

file JENNY => JENNY_SRC do
  mkpath BINDIR
  sh "#{CC} #{CC_FLAGS} -o #{JENNY} #{JENNY_SRC}"
end
