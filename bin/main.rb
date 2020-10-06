#!/usr/bin/env ruby
require_relative '../lib/player.rb'
require_relative '../lib/table.rb'
# rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
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
  second_player = first_player == player1 ? player2 : player1
  puts "#{first_player.name} Choose if x or o"
  first_player_sign = gets.chomp

  while first_player.check_sign(first_player_sign)
    puts 'Wrong sign! Choose either x or o please'
    first_player_sign = gets.chomp
  end

  first_player.sign = first_player_sign

  second_player.sign = (first_player.sign == 'x' ? 'o' : 'x')
  [first_player, second_player]
end

def game_on
  players = game_initializer
  player_turn = players[0]
  table = Table.new
  table.show_table
  game_moves = 9
  game_on = true

  while game_on
    puts "#{player_turn.name} (#{player_turn.sign}) your turn to choose move:"
    move = gets.chomp.to_i
    while table.valid_move(move)
      puts 'Invalid move, choose from 1 to 9?  :'
      move = gets.chomp.to_i
    end
    table.show_table(move, player_turn.sign)
    case table.check_win
    when 1
      puts "#{player_turn.name} Wins! With a row"
      game_moves = -1
    when 2
      puts "#{player_turn.name} Wins! With a column"
      game_moves = -1
    when 3
      puts "#{player_turn.name} Wins! With a diagonal"
      game_moves = -1
    end
    game_moves -= 1
    if game_moves.zero?
      puts 'Game tie'
      game_on = false
    elsif game_moves.negative?
      game_on = false
    end
    player_turn = player_turn == players[0] ? players[1] : players[0]
  end
end

loop do
  game_on
  puts "\nDo you want to play again? (y/n):"
  play_again = gets.chomp
  break if play_again != 'y'
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
puts "\nGame Over! Thank you for playing\n"
puts "If you have any suggestion to improve this game please open an Issue\nhttps://github.com/edxco/tic-tac-toe"
