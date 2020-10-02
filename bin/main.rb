#!/usr/bin/env ruby
# Ask the players for their names
puts 'Enter player 1 name:'
player1 = gets.chomp

puts 'Enter player 2 name:'
player2 = gets.chomp

# Display players names
puts "#{player1} vs #{player2}"

# Ask random player to choose a sign to play with
puts 'Player 1 Choose if x or o'
gets.chomp

# Display initial board
puts 'You can play with your numeric keyboard with one hand'
puts " 7 | 8 | 9
---+---+---
 4 | 5 | 6
---+---+---
 1 | 2 | 3"

# Number of maximum moves during the game
moves = 9

# Loop to ask for moves until moves are out
while moves > 0

  # Choose at random player for first move
  puts "#{player1} Where do you want to make your first move?"
  gets.chomp

  # Display board after each move for each player
  puts " 7 | 8 | 9
  ---+---+---
  4 | x | 6
  ---+---+---
  1 | 2 | 3"

  # Check if a user has won
  # player1.win == true ? break : continue
  
  moves -= 1
  break if moves == 0
  
  # Choose 2nd player his move
  puts "#{player2} Where do you want to make your first move?"
  gets.chomp

  # Display board after each move for each player
  puts " 7 | 8 | 9
  ---+---+---
  4 | x | 6
  ---+---+---
  1 | 2 | 3"

  # Check if a user has won
  # player2.win == true ? break : continue

  moves -= 1
end

# Check if someone wins or game tie
puts "#{player2} wins!"

# After the game is over, ask if they want to play again
puts 'Do you want to play again? (Y/N)'
gets.chomp
