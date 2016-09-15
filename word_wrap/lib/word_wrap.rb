class WordWrap
  
  def initialize(raw_text:, line_width:)
    @raw_text = raw_text
    @line_width = line_width
  end
  
  def with_line_breaks
    if @raw_text.length <= @line_width
      @raw_text
    else
      segment = @raw_text[0...@line_width].strip
      segment + "\n" + @raw_text[@line_width...@raw_text.length]
    end
  end
end