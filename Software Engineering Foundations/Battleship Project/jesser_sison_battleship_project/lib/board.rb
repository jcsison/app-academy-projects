class Board
  attr_reader :size

  def self.print_grid(grid)
    grid.each { |array| puts array.map(&:to_s).join(" ") }
  end

  def initialize(n)
    @grid = n.times.map { Array.new(n, :N) }
    @size = n**2
  end

  def [](position)
    @grid[position[0]][position[1]]
  end

  def []=(position, value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    @grid.map { |array| array.count(:S) }.reduce(:+)
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "You sunk my battleship!"
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    (@size / 4).times.each do
      begin
        rand_pos = [rand(@grid.length), rand(@grid.length)]
      end while self[rand_pos] != :N
      self[rand_pos] = :S
    end
  end

  def hidden_ships_grid
    @grid.map { |array| array.map { |item| item == :S ? :N : item } }
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
