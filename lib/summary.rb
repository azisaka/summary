module Summary
  MAJOR = '0'
  TINY = '6'
  PATCH = '3'
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
      return pure unless summarizable?

  	  text = pure[0...string_limit]
  	  text = text.gsub(/\.$/,'') + @terminator
    end

    protected
    # It cleans up the text removing the html tags, break lines and white spaces
    def pure
      @pure ||= purify @text
    end
    
    # Cleans up any string removing the html tags, break lines and white spaces.
    def purify(string)
      string.strip.gsub(/<(.|\n)+?>|(\t|\n|\r)+/,'').gsub(/\s+/,' ')
    end
    
    # Calculates the size limit to summarize the string.
    def string_limit
      @string_limit ||= pure[0..(@size-backspace)].rindex(' ')
    end
    
    # Verifies if the string can be summarized.
    def summarizable?
      pure.size > @size and pure =~ /\s/ and string_limit >= purify(@terminator).size
    end

    # Measures the space needed by the terminator.
    # Let's say you want a string with 50 chars, and your terminator is a '...'.
    # That means your string can only have 47 chars + 3 chars from your terminator.
    def backspace
      (@terminator =~ /<(.|\n)+?>/ ? purify(@terminator) : @terminator).size
    end
  end
end

String.send(:include, Summary::String)