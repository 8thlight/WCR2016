require 'rspec'
require 'word_wrap'


describe WordWrap do
  subject { WordWrap.new(raw_text: input, line_width: 10) }
  
  context 'empty string' do
    let (:input) {""}
    
    it 'returns an empty string' do 
      expect(subject.with_line_breaks).to eq("")
    end
  end
  
  context 'raw text shorter than line width' do
    let(:input) {"hello"}
    
    it 'does not add line breaks' do
      expect(subject.with_line_breaks).to eq("hello")
    end
  end

  context 'raw text equal to line width' do
    let(:input) {"abcdefghij"}
    
    it 'does not add line breaks' do
      expect(subject.with_line_breaks).to eq(input)
    end
  end
  
  context 'raw text without a space longer than line width' do
    let(:input) { 'schadenfreude' }
    
    it 'breaks in the middle of the word' do
      expect(subject.with_line_breaks).to eq("schadenfre\nude")
    end
  end
  
  context 'raw text with a space longer than line width' do
    let(:input) {"dinosaurs hello!"}
    
    it 'breaks at the word boundary' do
      expect(subject.with_line_breaks).to eq("dinosaurs\nhello!")
    end
  end
  
  xcontext '2 short words that should remain on one line' do
    let(:input) { 'the dog hello!' }
    
    it 'wraps at the second space' do
      expect(subject.with_line_breaks).to eq("the dog\nhello!")
    end
  end
end
