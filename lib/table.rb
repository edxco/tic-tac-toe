require_relative "game_initializer.rb"

def table
  table = {
    "1": 1,
    "2": 2,
    "3": 3,
    "4": 4,
    "5": 5,
    "6": 6,
    "7": 7,
    "8": 8,
    "9": 9
  }

  puts "  #{table[:"7"]} | #{table[:"8"]} | #{table[:"9"]}
  ---+---+---
  #{table[:"4"]} | #{table[:"5"]} | #{table[:"6"]}
  ---+---+---
  #{table[:"1"]} | #{table[:"2"]} | #{table[:"3"]}"

  move = gets.chomp

  table[:"5"] = second_player.sign


  puts "  #{table[:"7"]} | #{table[:"8"]} | #{table[:"9"]}
  ---+---+---
  #{table[:"4"]} | #{table[:"5"]} | #{table[:"6"]}
  ---+---+---
  #{table[:"1"]} | #{table[:"2"]} | #{table[:"3"]}"
 
end
