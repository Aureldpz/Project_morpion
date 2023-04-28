

class Show
  def initialize
    @board = board
  end

  def show_board
    puts "   1   2   3"
    puts "A  #{cases['A1'].value} | #{cases['A2'].value} | #{cases['A3'].value} "
    puts "  ---|---|---"
    puts "B  #{cases['B1'].value} | #{cases['B2'].value} | #{cases['B3'].value} "
    puts "  ---|---|---"
    puts "C  #{cases['C1'].value} | #{cases['C2'].value} | #{cases['C3'].value} "
  end
end