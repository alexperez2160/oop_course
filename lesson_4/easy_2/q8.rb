class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
  def play 
    "Let's play bingo"
  end 
end

game_1 = Bingo.new 

p game_1.play