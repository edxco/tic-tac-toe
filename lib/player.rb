class Player
  attr_reader :name, :sign
  def initialize(name, sign = 'x')
    @name = name
    @sign = sign
  end
end

def check_player(player1, player2)
  player1.include?(player2) ? true : false
end

def check_sign(first_player_sign)
  first_player_sign == 'x' || first_player_sign == 'o' ? false : true
end
