require 'rspec'
require 'hanoi'


describe Hanoi do
  subject(:towers) {Hanoi.new}

  it "initializes stack properly" do
    expect(tower.stacks).to eq([[1,2,3], [],[]])
  end

  describe "#move" do
    it "moves disc to empty space"

    it "moves disc to a space with a disc of bigger size"

    it "denies move if move starts from empty stack" do
      expect do
        towers.move(1,2)
      end.to raise_error("no discs here!")
    end
  end

  describe "#game_won?" do
    it "won when all moves are valid in end" do
      towers = Hanoi.new([[],[],[1,2,3]])
      expect(towers).to be_won
    end
  end
end
