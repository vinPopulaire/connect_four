class Board
  ROWS = 6
  COLOMNS = 7
  attr_accessor :board

  def initialize
    @board = Array.new(ROWS)
    @board.map! { Array.new(COLOMNS, " ") }
  end

  def draw
    puts "---------------"
    for i in (0...ROWS).reverse_each
      print "|"
      for j in (0...COLOMNS)
        print @board[i][j]
        print "|"
      end
      puts
      puts "---------------"
    end
    puts " 1 2 3 4 5 6 7 "
  end

  def get_cell(x,y)
    @board[x][y]
  end

  def set_cell(x,y,value)
    @board[x][y] = value
  end

  def finished?
    return :winner if winner?
    return :draw if draw?
    false
  end

  def winner?
    return true if winner_horizontal?
    return true if winner_vertical?
    return true if winner_right_diagonal?
    return true if winner_left_diagonal?
    false
  end

  def draw?
    # or could flatten the array before using any?
    return false if @board.any? { |x| x.any? { |x| x == " " } }
    true
  end

  def winner_horizontal?
    for i in 0...ROWS
      for j in 0...COLOMNS-3
        if get_cell(i,j) != " " &&
            get_cell(i,j) == get_cell(i,j+1) &&
            get_cell(i,j) == get_cell(i,j+2) &&
            get_cell(i,j) == get_cell(i,j+3)
          return true
        end
      end
    end
    false
  end

  def winner_vertical?
    for i in 0...ROWS-3
      for j in 0...COLOMNS
        if get_cell(i,j) != " " &&
            get_cell(i,j) == get_cell(i+1,j) &&
            get_cell(i,j) == get_cell(i+2,j) &&
            get_cell(i,j) == get_cell(i+3,j)
          return true
        end
      end
    end
    false
  end

  def winner_right_diagonal?
    for i in 0...ROWS-3
      for j in 0...COLOMNS-3
        if get_cell(i,j) != " " &&
            get_cell(i,j) == get_cell(i+1,j+1) &&
            get_cell(i,j) == get_cell(i+2,j+2) &&
            get_cell(i,j) == get_cell(i+3,j+3)
          return true
        end
      end
    end
    false
  end

  def winner_left_diagonal?
    for i in 3...ROWS
      for j in 3...COLOMNS
        if get_cell(i,j) != " " &&
            get_cell(i,j) == get_cell(i-1,j-1) &&
            get_cell(i,j) == get_cell(i-2,j-2) &&
            get_cell(i,j) == get_cell(i-3,j-3)
          return true
        end
      end
    end
    false
  end
end
