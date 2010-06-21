require File.expand_path('spec_helper', File.dirname(__FILE__))

describe Summary do
  it 'should be version 0.6.0' do
    subject::VERSION.should == '0.6.0'
  end
end

describe Summary, 'on plain text' do
  before do
    @text = 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam. Aliquam ultricies. Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis, mi metus sagittis augue, sed hendrerit nunc felis eget neque. Fusce vel massa. Quisque ligula enim, tempor sed, lacinia non, malesuada ac, enim. Curabitur at enim scelerisque neque egestas luctus. Mauris lacinia varius diam.'
  end
  
  context "by default" do
    before do
      @summarized = @text.summary
    end
    
    it 'should break the text' do
      @summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam...'
    end
    
    it "should have 100 chars" do
      @summarized.should be_summarizable_of(100)
    end
  end
  
  context "limited to 50 chars" do
    before do
      @summarized = @text.summary(50)
    end
    
    it "should break the text" do
      @summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla...'
    end
    
    it "should have 50 chars" do
      @summarized.should be_summarizable_of(50)
    end
  end
end


describe Summary, 'on html' do
  before do
    @text = 'Cras <strong>eleifend sodales sem</strong>. <img src="image.jpg" /><h1>Ut</h1> nec metus. <br />Nulla sed<p> nisl. Praesent malesuada</p> dui rhoncus quam. Aliquam ultricies. Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis, mi metus sagittis augue, <strong>sed</strong> hendrerit nunc felis eget neque. Fusce vel massa. Quisque ligula enim, tempor sed, lacinia non, malesuada ac, enim. Curabitur at enim scelerisque neque egestas luctus. Mauris lacinia varius diam.'
  end
  
  context "by default" do
    before do
      @summarized = @text.summary
    end
    
    it "should break the text" do
      @summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam...'
    end
    
    it "should have 100 chars" do
      @summarized.should be_summarizable_of(100)
    end
  end
  
  context "limited to 50 chars" do
    before do
      @summarized = @text.summary(50)
    end
    
    it "should break the text" do
      @summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla...'
    end
    
    it 'should have 50 chars' do
      @summarized.should be_summarizable_of(50)
    end
  end
end

describe Summary, 'on complex text' do
  before do
    @text = <<-BREAK
      Cras <strong>eleifend sodales sem</strong>. 
      
      <img src="image.jpg" /><h1>Ut</h1> nec metus. 
      <br />Nulla sed<p> nisl. Praesent malesuada</p> dui rhoncus quam. Aliquam ultricies. 
      
      Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis, mi metus sagittis augue, <strong>sed</strong> hendrerit nunc felis eget neque. Fusce vel massa. Quisque ligula enim, tempor sed, lacinia non, malesuada ac, enim. Curabitur at enim scelerisque neque egestas luctus. Mauris lacinia varius diam.
    BREAK
  end
  
  context "by default" do
    before do
      @summarized = @text.summary
    end
    
    it "should break the text" do
      @summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam...'
    end
    
    it 'should have 100 chars' do
      @summarized.should be_summarizable_of(100)
    end
  end
  
  context "limited to 50 chars" do
    before do
      @summarized = @text.summary(50)
    end
    
    it "should break the text" do
      @summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla...'
    end
    
    it 'should have 50 chars' do
      @summarized.should be_summarizable_of(50)
    end
  end
end

describe Summary, 'on tiny text' do
  before do
    @text = 'Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis.'
  end
  
  context "by default" do
    before do
      @summarized = @text.summary
    end
    
    it "should not break the text" do
      @summarized.should == 'Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis.'
    end
    
    it "should have 100 chars" do
      @summarized.should be_summarizable_of(100)
    end
  end
  
  context "limited to 50 chars" do
    before do
      @summarized = @text.summary(50)
    end
    
    it "should break the text" do
      @summarized.should == 'Praesent commodo. Nam nec pede. Pellentesque...'
    end
    
    it "should have 50 chars" do
      @summarized.should be_summarizable_of(50)
    end
  end
end


describe Summary, 'with different terminators' do
  before do
    @text = 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam. Aliquam ultricies. Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis, mi metus sagittis augue, sed hendrerit nunc felis eget neque. Fusce vel massa. Quisque ligula enim, tempor sed, lacinia non, malesuada ac, enim. Curabitur at enim scelerisque neque egestas luctus. Mauris lacinia varius diam.'
  end
  
  context "limited to 50 chars" do
    context "with !" do
      before do
        @summarized = @text.summary(50, '!')
      end

      it "should end with !" do
        @summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla!'
      end

      it "should have 50 chars" do
        @summarized.should be_summarizable_of 50
      end
    end
    
    context "with ." do
      before do
        @summarized = @text.summary(50, '.')
      end
      
      it "should end with ." do
        @summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla.'
      end
      
      it "should have 50 chars" do
        @summarized.should be_summarizable_of(50)
      end
    end
    
    context "with nothing" do
      before do
        @summarized = @text.summary(50, '')
      end
      
      it 'should end with nothing' do
        @summarized.should == 'Cras eleifend sodales sem. Ut nec metus. Nulla sed'
      end
      
      it "should have 50 chars" do
        @summarized.should be_summarizable_of(50)
      end
    end
    
    context "with html" do
      before do
        @summarized = @text.summary(50, '... <a href="#read-more">read more</a>')
      end
      
      it "should end with ...<a href=\"#read-more\">read more</a>" do
        @summarized.should == 'Cras eleifend sodales sem. Ut nec... <a href="#read-more">read more</a>'
      end
      
      it "should have 50 chars" do
        @summarized.should be_summarizable_of(50)
      end
    end
  end
end

