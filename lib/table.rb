# rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
require_relative 'colors.rb'

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

    case sign
    when 'x'
      @table[:"#{move}"] = sign.pink
    when 'o'
      @table[:"#{move}"] = sign.yellow
    else
      @table[:"#{move}"] = sign
    end

    #@table[:"#{move}"] = sign
    puts "     #{table[:"7"]} | #{table[:"8"]} | #{table[:"9"]}
    ---+---+---
     #{table[:"4"]} | #{table[:"5"]} | #{table[:"6"]}
    ---+---+---
     #{table[:"1"]} | #{table[:"2"]} | #{table[:"3"]}\n"
  end

  def valid_move(move)
    check = @table[:"#{move}"]
    check == 'x' || check == 'o' || move > 9 || move < 1 ? true : false
  end

  def check_win
    if @table[:"1"] == @table[:"2"] && @table[:"3"] == @table[:"1"]
      1
    elsif @table[:"4"] == @table[:"5"] && @table[:"4"] == @table[:"6"]
      1
    elsif @table[:"7"] == @table[:"8"] && @table[:"7"] == @table[:"9"]
      1
    elsif @table[:"7"] == @table[:"4"] && @table[:"7"] == @table[:"1"]
      2
    elsif @table[:"8"] == @table[:"5"] && @table[:"8"] == @table[:"2"]
      2
    elsif @table[:"9"] == @table[:"6"] && @table[:"9"] == @table[:"3"]
      2
    elsif @table[:"7"] == @table[:"5"] && @table[:"5"] == @table[:"3"]
      3
    elsif @table[:"1"] == @table[:"5"] && @table[:"5"] == @table[:"9"]
      3
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
