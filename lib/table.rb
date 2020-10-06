require 'pry'
require_relative "game_initializer.rb"

class Table
  attr_accessor :table

  def initialize
  @table = {
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
  end

  def show_table(move = nil, sign = nil)
    @table[:"#{move}"] = sign
    puts "     #{table[:"7"]} | #{table[:"8"]} | #{table[:"9"]}
    ---+---+---
     #{table[:"4"]} | #{table[:"5"]} | #{table[:"6"]}
    ---+---+---
     #{table[:"1"]} | #{table[:"2"]} | #{table[:"3"]}"
  end

  def valid_move(move)
    check = @table[:"#{move}"]
    check == "x" || check == "o" || move > 9 || move < 1 ? true : false
  end

  def check_win
    if @table[:"1"] == @table[:"2"] && @table[:"3"] == @table[:"1"]
      true
      # puts 'Row bottom line'
    elsif @table[:"4"] == @table[:"5"] && @table[:"4"] == @table[:"6"]
      true
      # puts 'Row middle line'
    elsif @table[:"7"] == @table[:"8"] && @table[:"7"] == @table[:"9"]
      true
      # puts 'Row top line'
    elsif @table[:"7"] == @table[:"4"] && @table[:"7"] == @table[:"1"]
      true
      # puts 'Col 1st line'
    elsif @table[:"8"] == @table[:"5"] && @table[:"8"] == @table[:"2"]
      true
      # puts 'Col 2nd line'
    elsif @table[:"9"] == @table[:"6"] && @table[:"9"] == @table[:"3"]
      true
      # puts 'Col 3rd line'
    elsif @table[:"7"] == @table[:"5"] && @table[:"5"] == @table[:"3"]
      true
      # puts 'Diagonal'
    elsif @table[:"1"] == @table[:"5"] && @table[:"5"] == @table[:"9"]
      true
      # puts 'Diagonal'
    end
  end
end
