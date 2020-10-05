class Player
  attr_reader :name
  attr_accessor :sign
  def initialize(name, sign = nil)
    @name = name
    @sign = sign
  end

  def choose_sign
    puts "#{@name} Choose if x or o"
    @sign = gets.chomp
    unless @sign == 'x' || @sign == 'o'
      puts 'Wrong sign! Choose either x or o please'
      choose_sign
    end
  end
end
