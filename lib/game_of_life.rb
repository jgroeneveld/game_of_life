require "game_of_life/version"
require 'game_of_life/board'
require 'game_of_life/rules'


module GameOfLife

  class Runner

    def initialize
      @rules = Rules.new
      @board = Board.new(20,20)
    end

    def blinker(x,y)
      @board.revive_cell(x,y)
      @board.revive_cell(x+1,y)
      @board.revive_cell(x+2,y)
    end

    def block(x,y)
      @board.revive_cell(x,y)
      @board.revive_cell(x+1,y)
      @board.revive_cell(x+1,y+1)
      @board.revive_cell(x,y+1)
    end

    def beacon(x,y)
      block(x,y)
      block(x+2,y+2)
    end

    def glider(x,y)
      @board.revive_cell(x+1,y)
      @board.revive_cell(x+2,y+1)
      @board.revive_cell(x+2,y+2)
      @board.revive_cell(x+1,y+2)
      @board.revive_cell(x,y+2)
    end

    def tick!
      next_board = @board.clone
      @rules.tick @board, next_board
      @board = next_board
    end

    def run!()
      while(true)
        puts "\n"*50
        puts @board
        tick!
        sleep(0.25)
      end
    end

  end
end


r = GameOfLife::Runner.new
r.glider(0,0)
r.run!