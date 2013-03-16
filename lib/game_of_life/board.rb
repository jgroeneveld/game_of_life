module GameOfLife
  class Board
    class OutOfBoundaries < Exception; end

    attr_reader :width, :height

    def initialize(width, height)
      @width = width
      @height = height
      @cells = {}
    end

    def clone
      Marshal.load(Marshal.dump(self))
    end

    def cell_at(x,y)
      ensure_boundaries(x,y)

      @cells[[x,y]].nil? ? :dead : @cells[[x,y]]
    end

    def revive_cell(x,y)
      ensure_boundaries(x,y)
      @cells[[x,y]] = :alive
    end

    def kill_cell(x,y)
      ensure_boundaries(x,y)
      @cells[[x,y]] = :dead
    end

    def alive_neighbours_count(x,y)
      max_left = [0,x-1].max
      max_right = [@width-1,x+1].min
      max_top = [0,y-1].max
      max_bottom = [@height-1,y+1].min

      count = 0
      (max_left..max_right).each do |xp|
        (max_top..max_bottom).each do |yp|
          if xp != x || yp != y
            count += 1  if cell_at(xp,yp) == :alive
          end
        end
      end

      count
    end

    def each_cell(&block)
      (0...@width).each do |x|
        (0...@height).each do |y|
          yield(x,y)
        end
      end
    end

    def to_s
      res = ""
      (0...@height).each do |y|
        line = ""
        (0...@width).each do |x|
          line << (cell_at(x,y) == :alive ? "O" : " ")
        end
        res << "#{line}\n"
      end
      res
    end

    private

    def ensure_boundaries(x,y)
      raise OutOfBoundaries  if x >= @width || y >= @height || x < 0 || y < 0
    end
  end
end