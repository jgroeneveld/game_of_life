require 'game_of_life/rules'
require 'game_of_life/board'

module GameOfLife
  describe Rules do
    subject { Rules.new }
    let(:board) { Board.new }

    context 'rule one' do

      it "Any live cell with fewer than two live neighbours dies, as if caused by under-population" do

        board.set_cell 5, 5, :alive
        subject.tick board
        board.get_cell(5,5).should == :dead

      end

    end

  end
end