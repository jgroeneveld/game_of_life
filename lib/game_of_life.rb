require "game_of_life/version"
require 'game_of_life/board'
require 'game_of_life/rules'
require 'game_of_life/pattern_generator'

module GameOfLife

  class Runner
    attr_reader :board

    def initialize
      @rules = Rules.new
      @board = Board.new(20,20)
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
GameOfLife::PatternGenerator.new.glider r.board, 0, 0
r.run!