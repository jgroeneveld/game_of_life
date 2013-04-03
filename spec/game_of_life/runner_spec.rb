require 'spec_helper'

require 'game_of_life/runner'

module GameOfLife
  describe Runner do
    subject { Runner.new }

    it "should tick" do
      subject.board.revive_cell 5,5
      subject.tick!
      subject.board.cell_at(5,5).should == :dead
    end

    it "should clean the screen, output the board and tick when running" do
      subject.should_receive(:print).with("\e[2J\e[f")
      subject.should_receive(:puts).with(subject.board.to_s).once
      subject.should_receive(:tick!)

      subject.run!(false)
    end
  end
end