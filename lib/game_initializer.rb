require 'pry'
require_relative "Player.rb"
def game_initializer
  players_objects = []
  puts 'Enter player1 name please:'
  player1 = Player.new(gets.chomp)
  players_objects << player1
  puts 'Enter player2 name please'
  player2 = Player.new(gets.chomp)
  players_objects << player2

  # Choose a random player to specify a sign and start the game
  first_player = players_objects.sample
  second_player = nil
  first_player == player1 ? second_player = player2 : second_player = player1
  first_player.choose_sign
  # binding.pry
  first_player.sign == 'x' ? second_player.sign = 'o' : second_player.sign = 'x'
  # current_player = second_player
  # current_player == second_player ? current_player = first_player : current_player = second_player
end
