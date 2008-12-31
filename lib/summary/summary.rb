module Summary
  module String
    # This method sanitizes the string removing html tags, \t \n \r characters, and duplicated blank spaces.
    # To use it just do:
    # 
    #   your_string.summary
    #
    # or
    #
    #   your_string.summary(size)
    def summary(size=100)
  	  pure = self.strip.gsub(/<(.|\n)+?>|(\t|\n|\r)+/,'')
  	  pure = pure.gsub(/\s+/,' ')
	  
  	  if pure.size > size
      	text = pure[0...pure[0..(size-3)].rindex(' ')]
      	text.gsub(/\.$/,'') + '...'
      else
        pure
    	end
    end
  end
end

String.send(:include, Summary::String)