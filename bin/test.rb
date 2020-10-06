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
    # Choose at random player for first move
    puts "#{player_turn.name} (#{player_turn.sign}) your turn to choose move:"
    move = gets.chomp.to_i
  
    while table.valid_move(move)
      puts "Invalid move, choose between 1 or 9?  :"
      move = gets.chomp.to_i
    end

    table.show_table(move, player_turn.sign)

    if table.check_win
      puts "#{player_turn.name} Wins!" 
      break
    end 

    game_moves -= 1
    if game_moves.zero?
      puts 'Game tie'
      game_on = false
    end

    player_turn = player_turn == players[0] ? players[1] : players[0]
  end

  puts "Do you want to play again? (y/n):"
  play_again = gets.chomp
  break if play_again != "y"

  end

  puts "\nGame Over! Thank you for playing\nIf you have any suggestion to improve this game please open an Issue\nhttps://github.com/edxco/tic-tac-toe\n"