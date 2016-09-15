class Combiner
  def initialize(array)
    @array = array.map(&:to_s)
  end
  
  def output_string
    @array.sort{ |a , b| b + a <=> a + b }.join
  end
end