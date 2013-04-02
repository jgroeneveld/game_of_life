module GameOfLife

  class PatternGenerator
    def blinker(board, x,y)
      board.revive_cell(x,y)
      board.revive_cell(x+1,y)
      board.revive_cell(x+2,y)
    end

    def block(board, x,y)
      board.revive_cell(x,y)
      board.revive_cell(x+1,y)
      board.revive_cell(x+1,y+1)
      board.revive_cell(x,y+1)
    end

    def beacon(board, x,y)
      block(board, x,y)
      block(board, x+2,y+2)
    end

    def glider(board, x,y)
      board.revive_cell(x+1,y)
      board.revive_cell(x+2,y+1)
      board.revive_cell(x+2,y+2)
      board.revive_cell(x+1,y+2)
      board.revive_cell(x,y+2)
    end
  end

end