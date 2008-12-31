class String
  def summary(size=100)
	  pure = self.strip.gsub(/<(.|\n)+?>|(\t|\n|\r)+/,'')
	  pure = pure.gsub(/\s+/,' ')
  	text = pure[0...pure[0..(size-3)].rindex(' ')]
  	text = text.gsub(/\.$/,'') + "..." if pure.size > size
  	text
  end
end