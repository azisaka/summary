# -*- encoding: utf-8 -*-
require "#{File.dirname(__FILE__)}/lib/summary/version"

Gem::Specification.new do |s|
  s.name              = 'summary'
  s.version           = Summary::Version::STRING
  s.platform          = Gem::Platform::RUBY
  s.authors           = %w(Bruno Azisaka Maciel)
  s.email             = %w(bruno@azisaka.com.br)
  s.homepage          = 'http://github.com/azisaka/summary'
  s.summary           = "This is a simple gem that generates introduction text from a long text, it will always break the text at the end of the last word near to the limit you informed as argument."
  s.description       = "This is a simple gem that generates introduction text from a long text, it will always break the text at the end of the last word near to the limit you informed as argument."

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths     = %w(lib)

  
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
end
