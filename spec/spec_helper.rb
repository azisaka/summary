require 'minitest/autorun'
MiniTest.autorun

require File.dirname(__FILE__) + '/../lib/summary'

def assert_summary_to(string, size)
  assert string.gsub(/<(.|\n)+?>/,'').size <= size
end
