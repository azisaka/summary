module Summary
  MAJOR = '0'
  TINY = '6'
  PATCH = '2'
  VERSION = [MAJOR, TINY, PATCH] * '.'
  
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

  class Summarize
    def initialize(text, size = 100, terminator = '...')
      @text = text
      @size = size
      @terminator = terminator
    end

    # Checks the need of "summarize" the string. When it is needed, the string is splitted.
    # Then the last dot is removed and the terminator is pushed into the resultant string.
    def summary
      if pure.size > @size
      	@text = pure[0...pure[0..(@size-backspace)].rindex(' ')]
      	@text.gsub(/\.$/,'') + @terminator
      else
        pure
    	end
    end

    protected
    # It cleans up the text removing the html tags, break lines and white spaces
    def pure
      @pure ||= @text.strip.gsub(/<(.|\n)+?>|(\t|\n|\r)+/,'').gsub(/\s+/,' ')
    end

    # Measures the space needed by the terminator.
    # Let's say you want a string with 50 chars, and your terminator is a '...'.
    # That means your string can only have 47 chars + 3 chars from your terminator.
    def backspace
      (@terminator =~ /<(.|\n)+?>/ ? @terminator.gsub(/<(.|\n)+?>/,'') : @terminator).size
    end
  end
end

String.send(:include, Summary::String)