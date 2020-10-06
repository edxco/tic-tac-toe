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

table[:"5"] = "x"

table.each do |key, value|
  puts "#{key}:#{value}"
  end

p "Give me the key position"
pos = gets.chomp.to_i

table[:"#{pos}"] = "x"

table.each do |key, value|
  puts "#{key}:#{value}"
  end