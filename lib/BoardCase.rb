

class BoardCase
  attr_accessor :position, :value
  
  def initialize(position)
    @position = position
    @value = " " # Valeur par défaut de chaque case
  end
end