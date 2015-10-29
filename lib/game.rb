require_relative "./board.rb"
require_relative "./player.rb"

class Game
  attr_accessor :current_player, :other_player, :board

  def welcome_screen
    puts("Hello! What's your name?")
    @current_player = Player.new(gets.chomp)
    puts("Nice meeting you #{@current_player.name}.")
    puts("And what's the name of the one next to you?")
    @other_player = Player.new(gets.chomp)
    puts("Nice meeting you too #{@other_player.name}")
    puts("Lets get started")
  end

  def switch_player
    @current_player, @other_player = @other_player, @current_player
  end

  def get_move
    move = ""
    until (1..7).include?(move)
      puts "Your choice must be between 1 and 7"
      move = gets.chomp.to_i
    end
    move
  end

  def make_valid_move(position)
    position -= 1
    for i in 0...Board::ROWS
      if @board.board[i][position] == " "
        @board.board[i][position] = @current_player.symbol
        return true
      end
      i += 1
    end
    puts "Column is full. Choose an other one"
    false
  end

  def play
    welcome_screen
    @board = Board.new
    until @board.finished?
      puts("#{@current_player.name} where do you want to place your mark?")
      @board.draw
      move = get_move
      until make_valid_move(move)
        @board.draw
        move = get_move
      end

      switch_player
    end
    if @board.draw?
      @board.draw
      puts "Too bad for both of you it's a draw!"
    else
      @board.draw
      puts "Congratulations #{@other_player.name} you won!"
    end
  end
end

game = Game.new
game.play
