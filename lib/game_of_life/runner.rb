require 'game_of_life/board'
require 'game_of_life/rules'

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

    def run!(forever=true)
      begin
        clear_screen
        put_board
        tick!
        sleep(0.25)
      end while forever
    end

    def clear_screen
      print "\e[2J\e[f"
    end

    def put_board
      puts @board.to_s
    end

  end
end