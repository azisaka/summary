# -*- encoding: utf-8 -*-
require File.expand_path("../../spec_helper", __FILE__)

describe 'Summary on plain text' do
  before do
    @text = 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam. Aliquam ultricies. Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis, mi metus sagittis augue, sed hendrerit nunc felis eget neque. Fusce vel massa. Quisque ligula enim, tempor sed, lacinia non, malesuada ac, enim. Curabitur at enim scelerisque neque egestas luctus. Mauris lacinia varius diam.'
  end
  
  describe "by default" do
    before do
      @summarized = @text.summary
    end
    
    it 'should break the text' do
      assert_equal 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam...', @summarized
    end
    
    it "should have 100 chars" do
      assert_summary_to @summarized, 100
    end
  end
  
  describe "limited to 50 chars" do
    before do
      @summarized = @text.summary(50)
    end
    
    it "should break the text" do
      assert_equal 'Cras eleifend sodales sem. Ut nec metus. Nulla...', @summarized
    end
    
    it "should have 50 chars" do
      assert_summary_to @summarized, 50
    end
  end
end

describe "Summary when the string is a word" do
  before do
    @text = "test"
  end
  
  describe "when the summary size is lower than the string size" do
    it "should not summarize the string" do
      assert_equal @text, @text.summary(2)
    end
  end
end

describe 'Summary when the terminator is bigger' do
  before do
    @text = "test test"
  end
  
  it "should not summarize the string" do
    assert_equal @text, @text.summary(4, '.' * 5)
  end
end

describe 'Summary on html' do
  before do
    @text = 'Cras <strong>eleifend sodales sem</strong>. <img src="image.jpg" /><h1>Ut</h1> nec metus. <br />Nulla sed<p> nisl. Praesent malesuada</p> dui rhoncus quam. Aliquam ultricies. Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis, mi metus sagittis augue, <strong>sed</strong> hendrerit nunc felis eget neque. Fusce vel massa. Quisque ligula enim, tempor sed, lacinia non, malesuada ac, enim. Curabitur at enim scelerisque neque egestas luctus. Mauris lacinia varius diam.'
  end
  
  describe "by default" do
    before do
      @summarized = @text.summary
    end
    
    it "should break the text" do
      assert_equal 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam...', @summarized
    end
    
    it "should have 100 chars" do
      assert_summary_to @summarized, 100
    end
  end
  
  describe "limited to 50 chars" do
    before do
      @summarized = @text.summary(50)
    end
    
    it "should break the text" do
      assert 'Cras eleifend sodales sem. Ut nec metus. Nulla...', @summarized
    end
    
    it 'should have 50 chars' do
      assert_summary_to @summarized, 50
    end
  end
end

describe 'Summary on complex text' do
  before do
    @text = <<-BREAK
      Cras <strong>eleifend sodales sem</strong>. 
      
      <img src="image.jpg" /><h1>Ut</h1> nec metus. 
      <br />Nulla sed<p> nisl. Praesent malesuada</p> dui rhoncus quam. Aliquam ultricies. 
      
      Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis, mi metus sagittis augue, <strong>sed</strong> hendrerit nunc felis eget neque. Fusce vel massa. Quisque ligula enim, tempor sed, lacinia non, malesuada ac, enim. Curabitur at enim scelerisque neque egestas luctus. Mauris lacinia varius diam.
    BREAK
  end
  
  describe "by default" do
    before do
      @summarized = @text.summary
    end
    
    it "should break the text" do
      assert 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam...', @summarized
    end
    
    it 'should have 100 chars' do
      assert_summary_to @summarized, 100
    end
  end
  
  describe "limited to 50 chars" do
    before do
      @summarized = @text.summary(50)
    end
    
    it "should break the text" do
      assert 'Cras eleifend sodales sem. Ut nec metus. Nulla...', @summarized
    end
    
    it 'should have 50 chars' do
      assert_summary_to @summarized, 50
    end
  end
end

describe 'Summary on tiny text' do
  before do
    @text = 'Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis.'
  end
  
  describe "by default" do
    before do
      @summarized = @text.summary
    end
    
    it "should not break the text" do
      assert_equal 'Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis.', @summarized
    end
    
    it "should have 100 chars" do
      assert_summary_to @summarized, 100
    end
  end
  
  describe "limited to 50 chars" do
    before do
      @summarized = @text.summary(50)
    end
    
    it "should break the text" do
      assert_equal 'Praesent commodo. Nam nec pede. Pellentesque...', @summarized
    end
    
    it "should have 50 chars" do
      assert_summary_to @summarized, 50
    end
  end
end


describe 'Summary with different terminators' do
  before do
    @text = 'Cras eleifend sodales sem. Ut nec metus. Nulla sed nisl. Praesent malesuada dui rhoncus quam. Aliquam ultricies. Praesent commodo. Nam nec pede. Pellentesque egestas, urna vel accumsan venenatis, mi metus sagittis augue, sed hendrerit nunc felis eget neque. Fusce vel massa. Quisque ligula enim, tempor sed, lacinia non, malesuada ac, enim. Curabitur at enim scelerisque neque egestas luctus. Mauris lacinia varius diam.'
  end
  
  describe "limited to 50 chars" do
    describe "with !" do
      before do
        @summarized = @text.summary(50, '!')
      end

      it "should end with !" do
        assert_equal 'Cras eleifend sodales sem. Ut nec metus. Nulla!', @summarized
      end

      it "should have 50 chars" do
        assert_summary_to @summarized, 50
      end
    end
    
    describe "with ." do
      before do
        @summarized = @text.summary(50, '.')
      end
      
      it "should end with ." do
        assert_equal 'Cras eleifend sodales sem. Ut nec metus. Nulla.', @summarized
      end
      
      it "should have 50 chars" do
        assert_summary_to @summarized, 50
      end
    end
    
    describe "with nothing" do
      before do
        @summarized = @text.summary(50, '')
      end
      
      it 'should end with nothing' do
        assert_equal 'Cras eleifend sodales sem. Ut nec metus. Nulla sed', @summarized
      end
      
      it "should have 50 chars" do
        assert_summary_to @summarized, 50
      end
    end
    
    describe "with html" do
      before do
        @summarized = @text.summary(50, '... <a href="#read-more">read more</a>')
      end
      
      it "should end with ...<a href=\"#read-more\">read more</a>" do
        assert_equal 'Cras eleifend sodales sem. Ut nec... <a href="#read-more">read more</a>', @summarized
      end
      
      it "should have 50 chars" do
        assert_summary_to @summarized, 50
      end
    end
  end
end

describe "Summary with accents" do
  before do
    @text = 'Cras eleifend sodãles sëm. Ut nec metus. Nullá sêd nisl.'
  end
  
  describe "limited to 20 chars" do    
    it "should break the text" do
      assert_equal 'Cras eleifend', @text.summary(20,'')
    end
  end
  
  describe "limited to 25 chars" do    
    it "should break the text" do
      assert_equal 'Cras eleifend sodãles', @text.summary(25,'')
    end
  end
  
  describe "limited to 30 chars" do    
    it "should break the text" do
      assert_equal 'Cras eleifend sodãles sëm. Ut', @text.summary(30,'')
    end
  end
end

