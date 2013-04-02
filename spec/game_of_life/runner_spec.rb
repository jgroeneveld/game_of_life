require 'game_of_life/runner'

module GameOfLife
  describe Runner do
    subject { Runner.new }

    it "should tick" do
      subject.board.revive_cell 5,5
      subject.tick!
      subject.board.cell_at(5,5).should == :dead
    end
  end
end