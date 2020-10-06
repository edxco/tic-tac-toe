#!/usr/bin/env ruby
require 'pry'
require_relative "../lib/Player.rb"
require_relative "../lib/game_initializer.rb"
require_relative "../lib/table.rb"

loop do
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
      puts "Invalid move, choose between 1 or 9?  :"
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
    elsif game_moves < 0
      game_on = false
    end

    player_turn = player_turn == players[0] ? players[1] : players[0]
  end

  puts "\nDo you want to play again? (y/n):"
  play_again = gets.chomp
  break if play_again != "y"

  end

  puts "\nGame Over! Thank you for playing\nIf you have any suggestion to improve this game please open an Issue\nhttps://github.com/edxco/tic-tac-toe\n"