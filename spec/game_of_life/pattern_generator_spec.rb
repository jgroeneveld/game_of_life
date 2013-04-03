require 'spec_helper'

require 'game_of_life/board'
require 'game_of_life/pattern_generator'

module GameOfLife

  describe PatternGenerator do
    subject { PatternGenerator.new }
    let (:board) { Board.new(10,10) }

    it "should generate a blinker" do
      subject.blinker board, 1, 1

      cells_should_be_alive [1,1], [2,1], [3,1]
    end

    it "should generate a block" do
      subject.block board, 1, 1

      cells_should_be_alive [1,1], [2,1], [2,2], [1,2]
    end

    it "should generate a beacon" do
      subject.beacon board, 1, 1

      cells_should_be_alive [1,1], [2,1], [2,2], [1,2]
      cells_should_be_alive [3,3], [4,3], [4,4], [3,4]
    end

    it "should generate a glider" do
      subject.glider board, 1, 1

      cells_should_be_alive [2,1], [3,2], [3,3], [2,3], [1,3]
    end



    def cells_should_be_alive(*cells)
      cells.each do |x,y|
        board.cell_at(x,y).should == :alive
      end
    end

  end

end