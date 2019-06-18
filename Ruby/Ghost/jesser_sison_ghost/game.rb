require_relative "player"

class Game
  attr_reader :players, :losses

  def self.run
    print "\e[H\e[2J"
    print "Input the names of the players, separated by commas: "
    game = Game.new(*gets.chomp.split(/\s*,\s*/))
    raise "Not enough players!" if game.players.length == 1
    nil until game.play_round
  end

  def initialize(*players)
    @players = players.map { |name| Player.new(name) }
    @fragment = ""
    @dictionary = IO.readlines("dictionary.txt").map { |w| [w.chomp, 0] }.to_h
    @losses = players.map { |name| [name, 0] }.to_h
  end

  def current_player
    @players[0].name
  end

  def previous_player
    @players[-1].name
  end

  def next_player!
    @players = @players.rotate
  end

  def play_round
    @fragment = ""
    while !@dictionary.has_key?(@fragment)
      self.take_turn(self.current_player)
      self.next_player!
    end
    @losses[self.previous_player] += 1
    puts "%s spelled the word \"%s\"!" % [self.previous_player, @fragment]
    letter = "GHOST"[@losses[self.previous_player] - 1]
    puts "%s gets the letter \"%s\"!" % [self.previous_player, letter]
    if letter == "T"
      puts "%s lost!" % [self.previous_player]
      @losses.delete(self.previous_player)
      @players.delete(@players[-1])
    end
    game_over = self.game_over?
    if game_over
      puts "%s wins!" % [self.winner]
    else
      print "\nEnter to continue. "
      gets
    end
    game_over
  end

  def take_turn(player_name)
    print "\e[H\e[2J"
    puts "\n[%s\'s turn]" % [player_name]
    begin
      guess = self.guess
      valid = self.valid_play?(guess)
      self.alert_invalid_guess(guess) unless valid
    end until valid
    @fragment << guess
    puts "%s added \"%s\" to the fragment." % [player_name, guess]
  end

  def guess
    puts "\nCurrent fragment: \"%s\"" % [@fragment]
    print "Input a letter to guess: "
    gets.chomp.downcase
  end

  def alert_invalid_guess(guess)
    puts "\"%s\" is an invalid guess!" % [guess]
  end

  def valid_play?(char)
    return false unless "abcdefghijklmnopqrstuvwkyz".include?(char)
    @dictionary.any? { |key, value| key.start_with?(@fragment + char) }
  end

  def winner
    @losses.select { |key, value| value < 5 }.keys[0]
  end

  def game_over?
    @players.length == 1
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.run
end
