# -*- encoding: utf-8 -*-
require File.expand_path("../lib/summary", __FILE__)

Gem::Specification.new do |s|
  s.name        = "summary"
  s.version     = Summary::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Bruno Azisaka Maciel"]
  s.email       = ["bruno@bubble.com.br"]
  s.homepage    = "http://github.com/azisaka/summary"
  s.summary     = "This is a simple gem that generates introduction text from a long text."
  s.description = "This is a simple gem that generates introduction text from a long text, it will always break the text at the end of the last word near to the limit you informed as argument."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "summary"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "minitest", ">= 0"
  s.add_development_dependency "yard", ">= 0"
  s.add_development_dependency "rake", ">= 0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'

  s.rdoc_options = ["--charset=UTF-8"]
end