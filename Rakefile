
require 'rubygems'
require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new do |test|
    desc 'Run all tests'
    test.libs << ['test', 'spec']
    test.test_files = Dir['test/*_test.rb', 'spec/*_spec.rb']
end
