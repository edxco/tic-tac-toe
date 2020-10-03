#!/usr/bin/env ruby

class Player
  attr_reader :name, :sign
  def initialize(name, sign = nil)
    @name = name
    @sign = sign
  end

  def choose_sign
    puts "#{@name} Choose if x or o"
    @sign = gets.chomp
    while @sign != 'x' || @sign != 'x'
      puts "#{@name} Incorrect option, please choose if x or o"
      @sign = gets.chomp
    end
  end
end

puts 'Enter player 1 name:'
player1 = Player.new(gets.chomp)

puts 'Enter player 2 name:'
player2 = Player.new(gets.chomp)

puts "#{player1.name} vs #{player2.name}"

r = rand(0..1)

r = 1 ? player1.choose_sign : player2.choose_sign
