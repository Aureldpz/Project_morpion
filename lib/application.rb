
class Application
  def perform

    
    game = Game.new
    while game.status == "on going"
      game.turn
    end
    game.game_end
  end
end