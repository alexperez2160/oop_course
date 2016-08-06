
class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end
  
  def lizard?
    @value == 'lizard'
  end 
  
  def spock?
    @value == 'spock'
  end 

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?) ||
      (rock? && other_move.lizard?) ||
      (lizard? && other_move.spock?) ||
      (scissors? && other_move.lizard?) ||
      (paper? && other_move.spock?) ||
      (spock? && other_move.rock?)
  end

  def <(other_move)
    rock? && other_move.paper? ||
      paper? && other_move.scissors? ||
      scissors? && other_move.rock? ||
      lizard? && other_move.rock? || 
      spock? && other_move.lizard? || 
      lizard? && other_move.scissors? || 
      spock? && other_move.paper? || 
      rock? && other_move.spock? 
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score, :movehist

  def initialize
    set_name
    @score = 0 
    @movehist = [] 
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry must enter a value"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors, lizard, spock"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
    self.movehist << Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
    self.movehist << Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    
    loop do 
      loop do
        human.choose
        computer.choose
        display_winner
        display_score
        break if human.score == 10 || computer.score == 10 
      end
      display_game_winner
      reset_score
      puts "#{human.movehist.join(', ')}"
      break if play_again? == FALSE
    end
    
    display_goodbye_message
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "Best of ten matches wins the game!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock! Goodbye!"
  end

  def display_winner
    puts "----------------------------------"
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"

    if human.move > computer.move
      human.score +=1 
      puts "#{human.name} won!"
    elsif human.move < computer.move
      computer.score += 1 
      puts "#{computer.name} won!"
    else
      puts "It's a tie"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n"
    end
    return true if answer == 'y'
    return false
  end
  
  def display_score
    puts "-------------------------"
    puts "#{human.name}'s score is #{human.score}."
    puts "#{computer.name}'s score is #{computer.score}."
    puts "-------------------------"
  end 
  
  def display_game_winner
    if human.score > computer.score 
      puts "#{human.name} won the best out of ten!"
    elsif computer.score > human.score 
      puts "#{computer.name} won the best out of ten!"
    else 
      puts "It was a tie. You fought valiantly"
    end
  end

  def reset_score 
    human.score = 0 
    computer.score = 0
  end 
  
end

RPSGame.new.play
