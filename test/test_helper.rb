require 'rubygems'
require 'shoulda'
require 'test/unit'
require File.dirname(__FILE__) + '/../lib/summary'

class Test::Unit::TestCase
  def self.should_break_with_or_less(size, result)
    should "brake it with #{size} characters or less" do
      summary = @string.summary(size)
      
      assert_equal(result, summary)
      assert(summary.size <= size)
    end
  end
end