require "spec_helper.rb"

describe Player do
  before(:all) do
    @player = Player.new("Giorgos")
    @opponent = Player.new("Opponent")
  end

  context "when creating a new Player" do
    it { expect {Player.new}.to raise_error ArgumentError }

    it "creates a player of class Player" do
      expect(@player).to be_instance_of Player
    end

    it "creates a player with name" do
      expect(@player.name).to eql "Giorgos"
    end
  end

  context "when creating two players" do
    it "gives different symbol to different players" do
      expect(@player.symbol).not_to eql @opponent.symbol
    end

    it "shows two instantiations of the class" do
      expect(Player.num_players).to eql 2
    end
  end
end
