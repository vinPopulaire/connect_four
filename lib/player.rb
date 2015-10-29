class Player
  @num_players = 0

  class << self
    attr_accessor :num_players
  end

  attr_accessor :name, :symbol

  def initialize(name)
    @name = name
    Player.num_players += 1
    if Player.num_players == 1
      @symbol = "x"
    else
      @symbol = "o"
    end
  end

end
