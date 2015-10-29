require "spec_helper.rb"

describe Game do
  before(:all) do
    @game = Game.new
    @game.current_player = Player.new("Giorgos")
    @game.other_player = Player.new("Opponent")
    @game.board = Board.new
  end

  describe "#switch_player" do
    it "changes player" do
      @game.switch_player
      expect(@game.current_player.name).to eq "Opponent"
    end
  end

  describe "#get_move" do
    it "returns the column you want to place the mark" do
      allow(@game).to receive(:gets).and_return("6\n")
      expect(@game.get_move).to eq 6
    end
    it "return first valid input" do
      allow(@game).to receive(:gets).and_return("8\n","4\n")
      expect(@game.get_move).to eq 4
      allow(@game).to receive(:gets).and_return("3\n","4\n")
      expect(@game.get_move).to eq 3
    end
  end

  describe "#make_valid_move" do
    it "takes a column and marks the lowest possible position" do
      @game.make_valid_move(2)
      expect(@game.board.get_cell(0,1)).to eq "o"
    end
    it "returns false if outside of board" do
      @game.board.set_cell(0,1,"x")
      @game.board.set_cell(1,1,"x")
      @game.board.set_cell(2,1,"x")
      @game.board.set_cell(3,1,"x")
      @game.board.set_cell(4,1,"x")
      @game.board.set_cell(5,1,"x")

      expect(@game.make_valid_move(2)).to be false
      expect(@game.make_valid_move(3)).to be true
    end
  end
end
