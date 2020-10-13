#!/usr/bin/env ruby
require_relative '../lib/player.rb'
require_relative '../lib/table.rb'
require_relative '../lib/colors.rb'
# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/AbcSize, Metrics/PerceivedComplexity

def game_initializer
  players_objects = []
  puts 'Enter Player 1 name please:'.blue
  player1 = gets.chomp
  players_objects << player1
  puts 'Enter Player 2 name please'.blue
  player2 = gets.chomp

  while check_player(player1, player2)
    puts "#{player1} name is already taken, please choose another name:".red
    player2 = gets.chomp
  end

  players_objects << player2

  first_player_name = players_objects.sample
  second_player_name = first_player_name == player1 ? player2 : player1

  puts "#{first_player_name} Choose if x or o".blue
  first_player_sign = gets.chomp

  while check_sign(first_player_sign)
    puts 'Wrong sign! Choose either x or o please'.red
    first_player_sign = gets.chomp
  end

  second_player_sign = first_player_sign == 'x' ? 'o' : 'x'

  first_player = Player.new(first_player_name, first_player_sign)
  second_player = Player.new(second_player_name, second_player_sign)

  [first_player, second_player]
end

def game_on
  players = game_initializer
  player_turn = players[0]
  table_instance = Table.new
  table = table_instance.table

  show_table = lambda do |my_table|
    puts "     #{my_table[:"7"]} | #{my_table[:"8"]} | #{my_table[:"9"]}
    ---+---+---
     #{my_table[:"4"]} | #{my_table[:"5"]} | #{my_table[:"6"]}
    ---+---+---
     #{my_table[:"1"]} | #{my_table[:"2"]} | #{my_table[:"3"]}\n"
  end

  show_table.call(table)
  game_moves = 9
  game_on = true

  while game_on
    puts "#{player_turn.name} (#{player_turn.sign}) your turn to choose move:".blue
    move = gets.chomp.to_i
    while table_instance.valid_move(move)
      puts 'Invalid move, choose from 1 to 9?  :'.red
      move = gets.chomp.to_i
    end
    table_instance.modify_table(move, player_turn.sign)
    show_table.call(table)
    case table_instance.check_win
    when 1
      puts "#{player_turn.name} Wins! With a row".green
      game_moves = -1
    when 2
      puts "#{player_turn.name} Wins! With a column".green
      game_moves = -1
    when 3
      puts "#{player_turn.name} Wins! With a diagonal".green
      game_moves = -1
    end
    game_moves -= 1
    if game_moves.zero?
      puts 'Game tie'.blue
      game_on = false
    elsif game_moves.negative?
      game_on = false
    end
    player_turn = player_turn == players[0] ? players[1] : players[0]
  end
end

loop do
  game_on
  puts "\nDo you want to play again? (y/n):".blue
  play_again = gets.chomp
  break if play_again != 'y'
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/AbcSize, Metrics/PerceivedComplexity
puts "\nGame Over! Thank you for playing\n".light_blue
puts "If you have any suggestion to improve this game please open an Issue\n"
puts 'https://github.com/edxco/tic-tac-toe'.light_blue
