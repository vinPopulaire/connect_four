require "spec_helper.rb"

describe Board do
  let(:board) { Board.new }

  it "create a 6x7 board" do
    expect(board.board.size).to eq 6
    expect(board.board[0].size).to eq 7
  end
  describe "#finished?" do
    it "returns false when not finished" do
      board.board[2][3] = "x"
      expect(board.finished?).to be false
    end
    it "returns :winner if someone won horizontally" do
      board.board[3][3] = "o"
      for i in 1..4
        board.board[2][i] = "x"
      end
      expect(board.winner_horizontal?).to be true
      expect(board.finished?).to eq :winner
    end
    it "returns :winner if someone won vertically" do
      board.board[3][3] = "o"
      for i in 1..4
        board.board[i][2] = "x"
      end
      expect(board.winner_vertical?).to be true
      expect(board.finished?).to eq :winner
    end
    it "returns :winner if someone won diagonally" do
      board.board[2][3] = "o"
      for i in 1..4
        board.board[1+i][1+i] = "x"
      end
      expect(board.winner_left_diagonal?).to be true
      expect(board.finished?).to eq :winner
    end
    it "returns :draw if noone won" do
      for i in 0...Board::ROWS
        for j in 0...Board::COLOMNS
          board.board[i][j] = "x"
        end
      end
      for i in 0...Board::ROWS
        board.board[i][2] = "o"
        board.board[i][4] = "o"
      end
      for j in 0..Board::COLOMNS
        board.board[3][j] = "o"
      end
      board.board[3][3] = "x"
      board.board[3][4] = "x"
      board.board[3][2] = "x"
      board.board[2][3] = "o"
      board.board[4][3] = "o"
      expect(board.winner?).to be false
      expect(board.finished?).to eq :draw
    end
  end

end
