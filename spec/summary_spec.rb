require File.dirname(__FILE__) + '/helper'

describe Summary do
  it 'should be version 0.5.0' do
    subject::VERSION.should == '0.5.0'
  end
end


describe Summary, 'on plain text' do
  before :each do
    @text = 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam. Aliquam ultricies. Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis, mi metus sagittis augue, sed hendrerit nunc felis eget neque. Fusce vel massa. Quisque ligula enim, tempor sed, lacinia non, malesuada ac, enim. Curabitur at enim scelerisque neque egestas luctus. Mauris lacinia varius diam.'
  end
  
  it 'should break with 100 chars by default' do
    summarized = @text.summary 
    summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam...'
    summarized.should be_summarizable_of(100)
  end
  
  it 'should break with 50 chars' do
    summarized = @text.summary(50)
    summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla...'
    summarized.should be_summarizable_of(50)
  end
end


describe Summary, 'on html' do
  before :each do
    @text = 'Cras <strong>eleifend sodales sem</strong>. <img src="image.jpg" /><h1>Ut</h1> nec metus. <br />Nulla sed<p> nisl. Praesent malesuada</p> dui rhoncus quam. Aliquam ultricies. Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis, mi metus sagittis augue, <strong>sed</strong> hendrerit nunc felis eget neque. Fusce vel massa. Quisque ligula enim, tempor sed, lacinia non, malesuada ac, enim. Curabitur at enim scelerisque neque egestas luctus. Mauris lacinia varius diam.'
  end
  
  it 'should break with 100 chars by default' do
    summarized = @text.summary
    summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam...'
    summarized.should be_summarizable_of(100)
  end
  
  it 'should break with 50 chars' do
    summarized = @text.summary(50)
    summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla...'
    summarized.should be_summarizable_of(50)
  end
end

describe Summary, 'on complex text' do
  before :each do
    @text = <<-BREAK
      Cras <strong>eleifend sodales sem</strong>. 
      
      <img src="image.jpg" /><h1>Ut</h1> nec metus. 
      <br />Nulla sed<p> nisl. Praesent malesuada</p> dui rhoncus quam. Aliquam ultricies. 
      
      Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis, mi metus sagittis augue, <strong>sed</strong> hendrerit nunc felis eget neque. Fusce vel massa. Quisque ligula enim, tempor sed, lacinia non, malesuada ac, enim. Curabitur at enim scelerisque neque egestas luctus. Mauris lacinia varius diam.
    BREAK
  end
  
  it 'should break with 100 chars by default' do
    summarized = @text.summary
    summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam...'
    summarized.should be_summarizable_of(100)
  end
  
  it 'should break with 50 chars' do
    summarized = @text.summary(50)
    summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla...'
    summarized.should be_summarizable_of(50)
  end
end

describe Summary, 'on tiny text' do
  before :each do
    @text = 'Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis.'
  end
  
  it 'should break with 100 chars by default' do
    summarized = @text.summary
    summarized.should == 'Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis.'
    summarized.should be_summarizable_of(100)
  end
  
  it 'should break with 50 chars' do
    summarized = @text.summary(50)
    summarized.should == 'Praesent commodo. Nam nec pede. Pellentesque...'
    summarized.should be_summarizable_of(50)
  end
end


describe Summary, 'with different terminators' do
  before :each do
    @text = 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam. Aliquam ultricies. Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis, mi metus sagittis augue, sed hendrerit nunc felis eget neque. Fusce vel massa. Quisque ligula enim, tempor sed, lacinia non, malesuada ac, enim. Curabitur at enim scelerisque neque egestas luctus. Mauris lacinia varius diam.'
  end
  
  it 'should end with !' do
    summarized = @text.summary(50, '!')
    summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla!'
    summarized.should be_summarizable_of 50
  end
  
  it 'should end with .' do
    summarized = @text.summary(50, '.')
    summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla.'
    summarized.should be_summarizable_of(50)
  end
  
  it 'should end with nothing' do
    summarized = @text.summary(50, '')
    summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla sed'
    summarized.should be_summarizable_of(50)
  end
  
  it 'should end with ...<a href="#read-more">read more</a>' do
    summarized = @text.summary(50, '... <a href="#read-more">read more</a>')
    summarized.should == 'Cras eleifend sodales sem. Ut nec... <a href="#read-more">read more</a>'
    summarized.should be_summarizable_of(50)
  end
end

