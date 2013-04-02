require 'game_of_life/pattern_generator'
require 'game_of_life/runner'

r = GameOfLife::Runner.new
GameOfLife::PatternGenerator.new.glider r.board, 0, 0
r.run!