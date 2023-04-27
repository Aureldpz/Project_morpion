require_relative 'Show'

class Board
  attr_accessor :cases
  
  def initialize
    # On initialise le plateau de jeu avec 9 cases vides
    @cases = {
      "A1" => BoardCase.new("A1"),
      "A2" => BoardCase.new("A2"),
      "A3" => BoardCase.new("A3"),
      "B1" => BoardCase.new("B1"),
      "B2" => BoardCase.new("B2"),
      "B3" => BoardCase.new("B3"),
      "C1" => BoardCase.new("C1"),
      "C2" => BoardCase.new("C2"),
      "C3" => BoardCase.new("C3")
    }
  end

  def valid_move?(position)
    board_case = @cases[position]
    return false unless board_case # la case n'existe pas
    board_case.value == " " # la case est vide
  end

  def victory?(board)
    winning_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # horizontal wins
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # vertical wins
      [0, 4, 8], [2, 4, 6] # diagonal wins
    ]
    
    winning_combinations.each do |combo|
      values = combo.map { |i| @cases.values[i].value }
      if values.all? { |v| v == "X" }
        return "X wins"
      elsif values.all? { |v| v == "O" }
        return "O wins"
      end
    end
    
    if board.all? { |v| v == "X" || v == "O" }
      return "Tie"
    end
    
    return "No winner yet"
  end

end