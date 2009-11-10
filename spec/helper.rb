require 'rubygems'
require 'spec'

require File.dirname(__FILE__) + '/../lib/summary'

Spec::Matchers.define :be_summarizable_of do |size|
  match do |actual|
    actual.gsub(/<(.|\n)+?>/,'').size.should <= size
  end
end