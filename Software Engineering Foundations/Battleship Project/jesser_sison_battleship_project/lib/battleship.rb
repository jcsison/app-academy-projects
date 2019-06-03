require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player

  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = n**2 / 2
  end

  def start_game
    @board.place_random_ships
    puts "There are %i ships remaining." % [@board.num_ships]
    @board.print
  end

  def lose?
    return false unless @remaining_misses <= 0
    puts "You lose."
    true
  end

  def win?
    return false unless @board.num_ships == 0
    puts "You win!" 
    true
  end

  def game_over?
    self.win? || self.lose?
  end

  def turn
    if !@board.attack(@player.get_move)
      @remaining_misses -= 1
      printf("You have %i remaining misses.\n", @remaining_misses)
    end
    @board.print
  end
end
