class Player
  attr_reader :name
  attr_accessor :sign
  def initialize(name, sign = nil)
    @name = name
    @sign = sign
  end

  def check_sign(first_player_sign)
    first_player_sign.include?('x') || first_player_sign.include?('o') ? false : true
  end
end
