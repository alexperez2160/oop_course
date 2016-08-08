
module Hand

  def hit(deck)
    self.cards << deck.deal
  end

  def total
    values = cards.map { |card| card[1]} 
    sum = 0
    values.each do |value|
      if value == "A"
        sum += 11
      elsif value.to_i == 0 # J, Q, K
        sum += 10
      else
        sum += value.to_i
      end
    end

    values.select { |value| value == "A" }.count.times do
      sum -= 10 if sum > 21
    end
    sum
  end 
  
  def busted?
    self.total > 21
  end
  
end 

class Player 
  include Hand 
  attr_accessor :cards

  def initialize
    @cards = []
  end 
end 

class Dealer
  include Hand 
  attr_accessor :cards

  def initialize
    @cards = []
  end
end 

class Deck 
  attr_accessor :deck

  SUITS = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
  
  def initialize
    @deck = SUITS.product(VALUES)
  end 
  
  def deal
    deck.sample
  end 
end 

class Card 
  def initialize
  end 
end 

class Game 
  attr_accessor :human, :computer, :deck
  
  def initialize 
    @human = Player.new
    @computer = Dealer.new
    @deck = Deck.new
  end 
  
  def start
    display_welcome
    loop do 
        loop do 
          deal_cards 
          show_initial_cards 
          player_turn
          break if human.busted?
          dealer_turn
          break if computer.busted?
          show_result
          break
        end 
      break if !play_again?
    end 
    display_goodbye 
  end 
  
  def display_welcome
    puts "Welcome to twenty one"
  end 

  def deal_cards 
    human.cards.clear
    computer.cards.clear
    2.times {human.cards << deck.deal}
    2.times {computer.cards << deck.deal}
  end 
  
  def show_initial_cards
    puts "The dealer's one showing card #{computer.cards.sample(1)}"
  end
  
  def player_turn
    puts ""
    
    loop do 
      puts "Your current hand: #{human.cards}"
      puts "Your current total is #{human.total}"
      puts "Do you wish to stay or hit?"
      answer = gets.chomp 
      break if answer.downcase.start_with?("s")
      puts "You chose to hit."
      human.hit(deck)
      break if human.busted?
      puts ""
    end 
    if human.busted?
      puts "You busted at #{human.total}. YOU LOSE!"
    else 
      puts ""
      puts "The dealer's turn"
    end
  end
  
  def dealer_turn
    puts "The dealer reveals his hand."
    puts "He's got: #{computer.cards}."
    puts "for a total of #{computer.total}"
    
    loop do 
        break if computer.total > 17 
        puts ""
        puts "The dealer chose to hit."
        computer.hit(deck)
        puts "He's got: #{computer.cards}."
        puts "for a total of #{computer.total}"
        break if computer.busted?
        puts ""
    end 
    
    if computer.busted?
      puts "Dealer busted! You WIN!"
    else 
      puts "Dealer chose to stay."
    end 
  end
  
  def show_result
    puts ""
    puts "Your final total: #{human.total}"
    puts "The dealer's final total: #{computer.total}"
    if human.total > computer.total 
      puts "YOU WIN!"
    elsif computer.total > human.total
      puts "YOU LOSE!"
    else 
      puts "It's a tie!"
    end 
  end 
  
  def play_again?
   answer = nil
    loop do
      puts "Would you like to play again?"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end
    answer == 'y'
  end 
  
  def display_goodbye
    puts "Thanks for playing. Later!"
  end 
end 

Game.new.start 