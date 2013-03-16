module GameOfLife
  class Rules
    def tick board, next_board
      board.each_cell do |x,y|
        rule_one(x,y, board, next_board)
        rule_three(x,y, board, next_board)
        rule_four(x,y, board, next_board)
      end
    end

    private

    def rule_one(x, y, board, next_board)
      if board.cell_at(x,y) == :alive
        if board.alive_neighbours_count(x,y) < 2
          next_board.kill_cell(x,y)
        end
      end
    end

    def rule_three(x, y, board, next_board)
      if board.cell_at(x,y) == :alive
        if board.alive_neighbours_count(x,y) > 3
          next_board.kill_cell(x,y)
        end
      end
    end

    def rule_four(x, y, board, next_board)
      if board.cell_at(x,y) == :dead
        if board.alive_neighbours_count(x,y) == 3
          next_board.revive_cell(x,y)
        end
      end
    end

  end
end