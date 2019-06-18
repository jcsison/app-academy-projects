class Maze
  attr_reader :maze

  def self.read(file_name)
    maze = []
    File.open(file_name).each_line do |line|
      arr = []
      line.split("").each do |char|
        case char
          when " "
            arr << 0
          when "*"
            arr << 1
          when "S"
            arr << 2
          when "E"
            arr << 3
        end
      end
      maze << arr
    end
    maze
  end

  def self.generate(n = 10, complexity = 0.1, density = 0.1)
    shape = [(n / 2) * 2 + 1, (n / 2) * 2 + 1]
    components = Integer(complexity * (5 * (shape[0] + shape[1])))
    size = Integer(density * ((shape[0] / 2) * (shape[1] / 2)))
    maze = Array.new(shape[1]) { Array.new(shape[0], 0) }
    shape[0].times.each do |i|
      maze[0][i] = 1
      maze[-1][i] = 1
    end
    shape[1].times.each do |i|
      maze[i][0] = 1
      maze[i][-1] = 1
    end
    size.times.each do |i|
      x = rand(0..shape[1] / 2) * 2
      y = rand(0..shape[0] / 2) * 2
      maze[y][x] = 1 if maze[y][x] == 0
      components.times.each do |j|
        neighbors = []
        neighbors << [y, x - 2] if x > 1
        neighbors << [y, x + 2] if x < shape[1] - 2
        neighbors << [y - 2, x] if y > 1
        neighbors << [y + 2, x] if y < shape[0] = 2
        if neighbors.length > 0
          x_ = neighbors[rand(0..neighbors.length - 1)][1]
          y_ = neighbors[rand(0..neighbors.length - 1)][0]
          if maze[y_][x_] == 0
            maze[y_][x_] = 1
            maze[y_ + (y - y_) / 2][x_ + (x - x_) / 2] = 1
            x = x_
            y = y_
          end
        end
      end
    end
    maze[rand(1..shape[1] - 2)][1] = 2
    maze[rand(1..shape[1] - 2)][-2] = 3
    maze
  end

  def initialize(maze = nil)
    @maze = maze
  end

  def length
    @maze.length
  end

  def [](i)
    @maze[i]
  end

  def []=(i, value)
    @maze[i] = value
  end

  def print
    @maze.length.times.each do |i|
      @maze[i].length.times.each do |j|
        case @maze[i][j]
          when 0
            printf "  "
          when 1
            printf "* "
          when 2
            printf "S "
          when 3
            printf "E "
          when 4
            printf "# "
        end
      end
      puts
    end
  end
end
