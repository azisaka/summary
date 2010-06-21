require 'rubygems'
require File.dirname(__FILE__) + '/../lib/summary'

module Summary
  module Matchers
    class SummarizableOf
      def initialize(size)
        @size = size
      end
      
      def matches?(actual)
        @actual = actual
        actual.gsub(/<(.|\n)+?>/,'').size.should <= @size
      end
    end

    def be_summarizable_of(size)
      SummarizableOf.new(size)
    end
  end
end

begin
  require 'spec'
  Spec::Runner.configure { |config| config.include(Summary::Matchers) }
rescue LoadError
  require 'rspec'
  RSpec.configure { |config| config.include(Summary::Matchers) }
end