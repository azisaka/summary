module Summary
  class Summarize
    def initialize(text, size = 100, terminator = '...')
      @text, @size, @terminator = text, size, terminator
    end

    # Checks the need of "summarize" the string. When it is needed, the string is splitted.
    # Then the last dot is removed and the terminator is pushed into the resultant string.
    def summary
      return pure unless summarizable?

      pure[0...string_limit].sub(/\.$/,'') + @terminator
    end

    protected
    # It cleans up the text removing the html tags, break lines and white spaces
    def pure
      @pure ||= purify @text
    end

    # Cleans up any string removing the html tags, break lines and white spaces.
    def purify(string)
      string.gsub(/(^\s+)|<(.|\n)+?>|(\t|\n|\r)+/,'').sub(/\s+/,' ')
    end

    # Calculates the size limit to summarize the string.
    def string_limit
      @string_limit ||= pure[0..(@size - backspace)].rindex(' ')
    end

    # Verifies if the string can be summarized.
    def summarizable?
      pure.size > @size and pure =~ /\s/ and string_limit >= backspace
    end

    # Measures the space needed by the terminator.
    # Let's say you want a string with 50 chars, and your terminator is a '...'.
    # That means your string can only have 47 chars + 3 chars from your terminator.
    def backspace
      @backspace ||= purify(@terminator).size
    end
  end
end
