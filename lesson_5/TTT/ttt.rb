require 'pry'
# represent the state of the board 
class Board 
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[2, 5, 8], [1, 4, 7], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset 
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end
  
  def unmarked_keys
    @squares.keys.select{ |key| @squares[key].unmarked?}
  end 
  
  def full?
    unmarked_keys.empty?
  end 
  
  def someone_won?
    !!winning_marker
  end
  
  def marked?
    marker != INITIAL_MARKER
  end

  def three_identical_markers(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end 

  # returns winnings marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.value_at(*line)
      if three_identical_markers?(squares)
        returne squares.first.marker
      end 
    end 
    nil 
  end
  
  def reset 
    (1..9).each {|key| @squares[key] = Square.new}
  end 
  
  def draw
    puts "     |     |"
    puts "#{@square[1]}    |#{@square[2]}    | #{@square[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts " #{@square[4]}  | #{@square[5]}   | #{@square[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts " #{@square[7]}  |#{@square[8]}    | #{@square[9]}"
    puts "     |     |" 
  end 
end

class Square
  INITIAL_MARKER = ' '
  attr_accessor :marker
  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end
  
  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER
  attr_reader :board, :human, :computer

  def initialize 
    @board = Board.new 
    @human = Player.new(HUMAN_MARKER)
    @computer =  Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    display_welcome_message
    clear
    loop do
    display_board

      loop do
        human_moves
        break if board.someone_won? || board.full?
        #break if someone_won? || board_full?
        computer_moves
        break if board.someone_won? || board.full?
        #break if someone_won? || board_full?
        clear_screen_and_display_board
      end

    display_results
    break unless play_again?
    reset
    display_play_again_message
    end
    display_goodbye_message
  end

  private 
  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else 
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end
  
  def reset 
    board.rest 
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def clear 
    system 'clear'
  end

  def human_moves 
    puts "Choose a square between #{board.unmarked_keys.join(', ')}:"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe"
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_results
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie."
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

  def reset 
    board.reset
    clear 
    puts "Let's play again!"
    puts ""
  end
  
  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end


game = TTTGame.new

game.play