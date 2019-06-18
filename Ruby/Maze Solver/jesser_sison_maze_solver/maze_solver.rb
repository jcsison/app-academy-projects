require_relative "maze"

class Maze_Solver
  def initialize(maze)
    @maze = maze
  end

  def solve
    start_coord = self.find_start
    end_coord = self.find_end
    open_list = { start_coord => [0, 0, 0] }
    closed_list = {}
    path = []
    iter = 0

    closed_list[start_coord] = [0, 0, 0]
    path << start_coord
    open_list.delete(start_coord)
    adjacent = find_adjacent(start_coord, closed_list)
    open_list.merge!(adjacent)

    while (!closed_list.key?(end_coord)) do
      next_coord = self.lowest_score(open_list)
      if !adjacent.key?(next_coord)
        while (next_coord[0] - path[-1][0])**2 + (next_coord[1] - path[-1][1])**2 != 1 do
          path.pop
          @maze.print if path[-1] == nil
          raise "Maze cannot be solved." if path[-1] == nil
          break if path[-1] == nil
        end
      end
      adjacent = find_adjacent(next_coord, closed_list)
      closed_list[next_coord] = open_list[next_coord]
      path << next_coord
      open_list.delete(next_coord)
      open_list.merge!(adjacent)
      iter += 1
      raise "Maze cannot be solved." if iter > @maze.length * @maze[0].length
    end

    path.each do |coord|
      @maze[coord[0]][coord[1]] = 4
    end

    @maze[start_coord[0]][start_coord[1]] = 2
    @maze[end_coord[0]][end_coord[1]] = 3

    @maze.print
  end

  def find_start
    @maze.length.times.each do |i|
      @maze[0].length.times.each do |j|
        return [i, j] if @maze[i][j] == 2
      end
    end
  end

  def find_end
    @maze.length.times.each do |i|
      @maze[0].length.times.each do |j|
        return [i, j] if @maze[i][j] == 3
      end
    end
  end

  def find_adjacent(coord, reject)
    adjacent = {}
    (coord[0] - 1..coord[0] + 1).each do |i|
      (coord[1] - 1..coord[1] + 1).each do |j|
        empty = @maze[i][j] != 1 && [i, j] != coord && !reject.key?([i, j])
        diag = ((coord[0] - i)**2 == 1) && ((coord[1] - j)**2 == 1)
        path = @maze[coord[0]][j] != 1 || @maze[i][coord[1]] != 1
        g = diag ? 14 : 10
        h = self.path_score([i, j]).round(1)
        adjacent[[i, j]] = [g, h, g + h] if empty && (diag ? path : true)
      end
    end
    adjacent
  end

  def path_score(coord)
    end_coord = self.find_end
    horizontal = end_coord[1] - coord[1]
    vertical = end_coord[0] - coord[0]
    Math.sqrt(horizontal**2 + vertical**2)
  end

  def lowest_score(hash)
    lowest_key = [-1, -1]
    lowest_value = 10000
    hash.each do |key, value|
      if value[2] < lowest_value
        lowest_key = key
        lowest_value = value[2]
      end
    end
    lowest_key
  end
end

if __FILE__ == $PROGRAM_NAME
  # maze = Maze.new(Maze.generate(10))
  maze = Maze.new(Maze.read("maze1.txt"))
  solver = Maze_Solver.new(maze)
  solver.solve
end
