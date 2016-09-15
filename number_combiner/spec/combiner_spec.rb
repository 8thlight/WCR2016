require 'rspec'
require 'combiner'

describe Combiner do
  def combine(input)
    Combiner.new(input).output_string
  end
  
  it 'combines an empty array' do
    expect(combine([])).to be_empty
  end
  
  it 'combines an single element array' do
    expect(combine([5])).to eq "5"
  end
  
  it 'combines two single digit elements into a string' do
    expect(combine([5, 5])).to eq "55"
  end
  
  it 'combines two ordered single digit elements into a string' do
    expect(combine([5, 6])).to eq "65"
  end

  it 'combines a single digit and two digits' do
    expect(combine([50, 5])).to eq "550"
  end
  
  
  it 'combines two elements into a single string' do
    expect(combine([5, 56])).to eq "565"
  end
  
  it 'combines numbers' do
    input = [50, 2, 1, 9]
    expect(combine(input)).to eq "95021"
  end

  it 'combines 3 elemtns where the elemnts are 1-2 digits' do
    input = [5, 50, 56]
    expect(combine(input)).to eq "56550"
  end

  it 'combines 3 elemtns of up to 3 digits each' do
    input = [420, 42, 423]
    expect(combine(input)).to eq "42423420"
  end
  
  it 'combines 3 small elements to beat 1 large element' do
    input = [420, 4, 5, 01]
    expect(combine(input)).to eq "544201"
  end
end
