require 'game_of_life/rules'
require 'game_of_life/board'

module GameOfLife
  describe Rules do
    subject { Rules.new }
    let(:board) { Board.new(10,10) }

    context 'rule one' do
      context "Any live cell with fewer than two live neighbours dies, as if caused by under-population" do

        it "should kill the cell if there are no neighbours" do
          board.revive_cell 5, 5
          next_board = board.clone
          subject.tick board, next_board
          next_board.cell_at(5,5).should == :dead
        end

        it "should kill the cell if there is one neighbour" do
          board.revive_cell 5, 5
          board.revive_cell 5, 6
          next_board = board.clone
          subject.tick board, next_board
          next_board.cell_at(5,5).should == :dead
        end

        it "should keep the cell alive if there are two neighbours" do
          board.revive_cell 5, 5
          board.revive_cell 5, 6
          board.revive_cell 6, 6

          next_board = board.clone
          subject.tick board, next_board
          next_board.cell_at(5,5).should == :alive
        end

        it "should not touch the current board" do
          board.revive_cell 5, 5
          next_board = board.clone
          subject.tick board, next_board
          next_board.cell_at(5,5).should == :dead
          board.cell_at(5,5).should == :alive
        end

      end
    end

    context 'rule two' do
      context "Any live cell with two or three live neighbours lives on to the next generation" do

        it "should keep the cell alive if there are three neighbours" do
          board.revive_cell 5, 5
          board.revive_cell 5, 6
          board.revive_cell 6, 6
          board.revive_cell 4, 6

          next_board = board.clone
          subject.tick board, next_board
          next_board.cell_at(5,5).should == :alive
        end

      end
    end


    context 'rule three' do
      context "Any live cell with more than three live neighbours dies, as if by overcrowding" do

        it "should kill the cell if there are 4 neighours" do
          board.revive_cell 5, 5
          board.revive_cell 5, 6
          board.revive_cell 6, 6
          board.revive_cell 6, 5
          board.revive_cell 6, 4

          next_board = board.clone
          subject.tick board, next_board
          next_board.cell_at(5,5).should == :dead
        end

      end
    end


    context 'rule four' do
      context "Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction" do

        it "should revice the cell if there are 3 neighours" do
          board.kill_cell 5, 5
          board.revive_cell 5, 6
          board.revive_cell 6, 6
          board.revive_cell 6, 5

          next_board = board.clone
          subject.tick board, next_board
          next_board.cell_at(5,5).should == :alive
        end

      end
    end

  end
end