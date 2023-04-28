

class Board
  attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3
  
  def initialize
    # On initialise le plateau de jeu avec 9 cases vides
      @a1 = BoardCase.new
      @a2 = BoardCase.new
      @a3 = BoardCase.new
      @b1 = BoardCase.new
      @b2 = BoardCase.new
      @b3 = BoardCase.new
      @c1 = BoardCase.new
      @c2 = BoardCase.new
      @c3 = BoardCase.new
      @array_board_case = [a1, a2, a3, b1, b2, b3, c1, c2, c3]
  end
  
  def show_board
    puts "   1   2   3"
    puts "A  #{@a1.value} | #{@a2.value} | #{@a3.value} "
    puts "  ---|---|---"
    puts "B  #{@b1.value} | #{@b2.value} | #{@b3.value} "
    puts "  ---|---|---"
    puts "C  #{@c1.value} | #{@c2.value} | #{@c3.value} "
  end

  def valid_move?(position)
    unless @array_board_case[position -1].value == " "
      return false
    else
      return true
    end
  end

  def update(position, value)
    @array_board_case[position - 1].value = value
  end

  def victory?
    winning_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # horizontal wins
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # vertical wins
      [0, 4, 8], [2, 4, 6] # diagonal wins
    ]
    
    winning_combinations.each do |combo|
      values = combo.map { |i| @array_board_case[i].value }
      if values.all? { |v| v == "X" }
        return "X wins"
      elsif values.all? { |v| v == "O" }
        return "O wins"
      end
    end
    
    if @array_board_case.all? { |v| v == "X" || v == "O" }
      return "Tie"
    end
    
    return "No winner yet"
  end

end