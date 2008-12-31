require 'test_helper'

class TestSummary < Test::Unit::TestCase
  context "When a string is too big" do
    setup do
      @string = 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam. Aliquam ultricies. Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis, mi metus sagittis augue, sed hendrerit nunc felis eget neque. Fusce vel massa. Quisque ligula enim, tempor sed, lacinia non, malesuada ac, enim. Curabitur at enim scelerisque neque egestas luctus. Mauris lacinia varius diam.'
    end

    should_break_with_or_less 100, 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam...'
    should_break_with_or_less 50, 'Cras eleifend sodales sem. Ut nec metus. Nulla...'
  end
  
  context "When a string has html tags" do
    setup do
      @string = 'Cras <strong>eleifend sodales sem</strong>. <img src="image.jpg" /><h1>Ut</h1> nec metus. <br />Nulla sed<p> nisl. Praesent malesuada</p> dui rhoncus quam. Aliquam ultricies. Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis, mi metus sagittis augue, <strong>sed</strong> hendrerit nunc felis eget neque. Fusce vel massa. Quisque ligula enim, tempor sed, lacinia non, malesuada ac, enim. Curabitur at enim scelerisque neque egestas luctus. Mauris lacinia varius diam.'
    end

    should_break_with_or_less 100, 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam...'
    should_break_with_or_less 50, 'Cras eleifend sodales sem. Ut nec metus. Nulla...'
  end
  
  context "When the string has break lines" do
    setup do
      @string = <<-BREAK
        Cras eleifend sodales sem. Ut nec metus.
        Nulla sed nisl.
        
        Praesent malesuada dui rhoncus quam. Aliquam ultricies. Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis, mi metus sagittis augue, sed hendrerit nunc felis eget neque. Fusce vel massa. Quisque ligula enim, tempor sed, lacinia non, malesuada ac, enim. Curabitur at enim scelerisque neque egestas luctus. Mauris lacinia varius diam.
        BREAK
    end

    should_break_with_or_less 100, 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam...'
    should_break_with_or_less 50, 'Cras eleifend sodales sem. Ut nec metus. Nulla...'
  end
  
  context "When the string has break lines and html tags" do
    setup do
      @string = <<-BREAK
        Cras <strong>eleifend sodales sem</strong>. 
        
        <img src="image.jpg" /><h1>Ut</h1> nec metus. 
        <br />Nulla sed<p> nisl. Praesent malesuada</p> dui rhoncus quam. Aliquam ultricies. 
        
        Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis, mi metus sagittis augue, <strong>sed</strong> hendrerit nunc felis eget neque. Fusce vel massa. Quisque ligula enim, tempor sed, lacinia non, malesuada ac, enim. Curabitur at enim scelerisque neque egestas luctus. Mauris lacinia varius diam.
      BREAK
    end

    should_break_with_or_less 100, 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam...'
    should_break_with_or_less 50, 'Cras eleifend sodales sem. Ut nec metus. Nulla...'
  end
end