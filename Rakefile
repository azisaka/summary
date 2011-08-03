require 'bundler'
require 'rake/testtask'

Bundler::GemHelper.install_tasks
Rake::TestTask.new { |t| t.pattern = "spec/**/*_spec.rb" }

task :default => 'test'