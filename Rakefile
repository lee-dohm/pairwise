
require 'rubygems'
require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new do |test|
    desc 'Run all tests'
    test.libs << 'test'
    test.test_files = Dir[ 'test/*_test.rb' ]
end
