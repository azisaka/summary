class String
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