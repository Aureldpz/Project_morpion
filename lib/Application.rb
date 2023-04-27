require_relative 'Player'
require_relative 'Game'

class Application
  def perform

    puts "-" *49
    puts "|                   MORPIONS                      |"
    puts "|         Le but du jeu c'est de gagné!!!         |"
    puts "-" *49
    puts "Quel est ton nom brave guerrier ?"
    print '>'
    player1_name = gets.chomp
    player1 = Player.new("player1_name", "X")
    puts "-" *49
    puts "Quel est ton nom insignifiant vermisseau ?"
    print '>'
    player2_name = gets.chomp
    player2 = Player.new("player2_name", "O")
    puts "-" *49
    game = Game.new
    while game.status == "on going"
      game.turn
    end
    game.game_end
  end
end