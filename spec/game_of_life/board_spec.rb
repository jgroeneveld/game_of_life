require 'game_of_life/board'

module GameOfLife

  describe Board do
    subject { Board.new(10,10) }

    it "should have dead cells at the beginning" do
      subject.cell_at(5,5).should == :dead
    end

    it "should give nocell if out of bounds" do
      expect {
        subject.cell_at(11,11)
      }.to raise_error

      expect {
        subject.revive_cell(-11,11)
      }.to raise_error

      expect {
        subject.kill_cell(11,-11)
      }.to raise_error
    end

    it "should be possible to revive a cell" do
      subject.revive_cell 5, 5
      subject.cell_at(5,5).should == :alive
    end

    it "should be possible to kill a cell" do
      subject.kill_cell 5, 5
      subject.cell_at(5,5).should == :dead
    end

    it "should be possible to count the cell neighbours" do
      subject.alive_neighbour_count(5,5).should == 0

      subject.revive_cell(6,5)
      subject.alive_neighbour_count(5,5).should == 1

      subject.revive_cell(5,6)
      subject.alive_neighbour_count(5,5).should == 2

      subject.revive_cell(2,6)
      subject.alive_neighbour_count(5,5).should == 2
    end

    it "should be possible to iterate all cells" do
      count = 0
      subject.each_cell do |x,y|
        count += 1
      end

      count.should == subject.width*subject.height
    end
  end

end