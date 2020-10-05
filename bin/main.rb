#!/usr/bin/env ruby
require 'pry'
require_relative "../lib/Player.rb"
require_relative "../lib/game_initializer.rb"
require_relative "../lib/table.rb"

players = game_initializer
first_player = players[0]
second_player = players[1]
table = table_method

  # puts "  #{table[:"7"]} | #{table[:"8"]} | #{table[:"9"]}
  # ---+---+---
  # #{table[:"4"]} | #{table[:"5"]} | #{table[:"6"]}
  # ---+---+---
  # #{table[:"1"]} | #{table[:"2"]} | #{table[:"3"]}"

  # move = gets.chomp

  # table[:"#{move}"] = first_player.sign


  puts "  #{table[:"7"]} | #{table[:"8"]} | #{table[:"9"]}
  ---+---+---
  #{table[:"4"]} | #{table[:"5"]} | #{table[:"6"]}
  ---+---+---
  #{table[:"1"]} | #{table[:"2"]} | #{table[:"3"]}"

  moves = 9
  game_on = true

  while game_on

  # Choose at random player for first move
  puts "#{first_player.name} Where do you want to make your first move?"
  move = gets.chomp
  table[:"#{move}"] = first_player.sign
  # Check if it is a valid move
  # puts 'Not a valid move or the position is already taken, please choose another:'
  # gets.chomp

  # Display board after each move for each player
  puts "  #{table[:"7"]} | #{table[:"8"]} | #{table[:"9"]}
   ---+---+---
   #{table[:"4"]} | #{table[:"5"]} | #{table[:"6"]}
   ---+---+---
   #{table[:"1"]} | #{table[:"2"]} | #{table[:"3"]}"

  # Check if a user has won
  # player1.win == true ? game_on = false

  moves -= 1
  game_on = false if moves.zero?

  # Choose 2nd player his move
  puts "#{second_player.name} Where do you want to make your first move?"
  move = gets.chomp
  table[:"#{move}"] = second_player.sign

  # Display board after each move for each player
 puts "  #{table[:"7"]} | #{table[:"8"]} | #{table[:"9"]}
   ---+---+---
   #{table[:"4"]} | #{table[:"5"]} | #{table[:"6"]}
   ---+---+---
   #{table[:"1"]} | #{table[:"2"]} | #{table[:"3"]}"

  # Check if a user has won
  # player2.win == true ? game_on = false

  moves -= 1
  game_on = false if moves.zero?
  end