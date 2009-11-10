require 'rubygems'
require 'activesupport'

module Summary
  MAJOR = '0'
  TINY = '5'
  PATCH = '0'
  VERSION = [MAJOR, TINY, PATCH] * '.'
end

require File.dirname(__FILE__) + '/summary/summary'