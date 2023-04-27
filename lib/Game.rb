require_relative 'Player'

class Game
  attr_accessor :current_player, :status, :board, :players
  Player1 = Player.new("player1_name", "X")
  Player2 = Player.new("player2_name", "O")
  def initialize
    @players = [Player1, Player2]
    @board = Board.new
    @status = "on going"
    @current_player = @players.first
  end

  def turn
    puts "C'est au tour de #{current_player.value} !"
    board.display

    input = nil
    until input
      puts "Choisis une case (1-9): "
      input = gets.chomp.to_i
      if !board.valid_move?(input)
        puts "Case déjà occupée, choisi en une autre (1-9): "
        input = nil
      end
    end

    board.update(input, current_player.symbol)

    if board.win?
      @status = current_player
    elsif board.tie?
      @status = "tie"
    else
      switch_player
    end
  end

  def new_round
    @board = Board.new
    @status = "on going"
  end

  def game_end
    if @status == "tie"
      puts "It's a tie!"
    else
      puts "#{current_player.symbol} wins!"
    end
    board.display
  end

  private

  def switch_player
    @current_player = @players.rotate!.first
  end
end