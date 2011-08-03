require "#{File.dirname(__FILE__)}/summary/version"
require "#{File.dirname(__FILE__)}/summary/summarize"

module Summary
  module String
    # This method sanitizes the string removing html tags, \t \n \r characters, and duplicated blank spaces.
    # To use it just do:
    #
    #   "your string".summary
    #
    # or with a custom limit
    #
    #   "your string".summary(10)
    #
    # or with a custom limit and another terminator
    #
    #   "your string".summary(10, ' :)')
    #
    # or with a custom limit and a html terminator
    #
    #   "your string".summary(10, '... <a href="#">read more</a>')
    def summary(size=100, terminator = '...')
      Summarize.new(self, size, terminator).summary
    end
  end
end

String.send(:include, Summary::String)
