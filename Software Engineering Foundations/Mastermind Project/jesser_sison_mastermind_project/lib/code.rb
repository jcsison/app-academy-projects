class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.key?(char.upcase) }
  end

  def self.random(length)
    Code.new(length.times.map { POSSIBLE_PEGS.keys.sample })
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def initialize(chars)
    raise "Invalid pegs!" unless Code.valid_pegs?(chars)
    @pegs = chars.map(&:upcase)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    guess.length.times.count { |i| guess[i] == self[i] }
  end

  def num_near_matches(guess)
    guess.length.times.count do
      |i| self.pegs.include?(guess[i]) && guess[i] != self[i]
    end
  end

  def ==(code)
    self.pegs == code.pegs
  end
end
