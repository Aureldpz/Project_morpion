

class Game
  attr_accessor :current_player, :status, :board, :players
  
  def initialize
    puts "-" *49
    puts "|                   MORPIONS                      |"
    puts "|         Le but du jeu c'est de gagné!!!         |"
    puts "-" *49
    puts "Quel est ton nom brave guerrier ?"
    print '>'
    player1_name = gets.chomp
    player1 = Player.new(player1_name, "X")
    puts "-" *49
    puts "Quel est ton nom insignifiant vermisseau ?"
    print '>'
    player2_name = gets.chomp
    player2 = Player.new(player2_name, "O")
    puts "-" *49
    @players = [player1, player2]
    @board = Board.new
    @status = "on going"
    @current_player = @players.first
  end

  def turn
    puts "C'est au tour de #{current_player.name} !"
    @board.show_board

    input = nil
    until input
      puts "Choisis une case (1-9): "
      input = gets.chomp.to_i
      if !board.valid_move?(input)
        puts "Case déjà occupée, choisi en une autre (1-9): "
        input = nil
      end
    end

    board.update(input, current_player.value)

    if board.victory?
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
      puts "#{current_player.value} wins!"
    end
    board.display
  end

  private

  def switch_player
    @current_player = @players.rotate.first
  end
end