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

# Check if the user has enter a valid sign
puts '$ is not a valid sign, plese chose if x or o'
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

# Variable for ending game
game_on = true

# Loop to ask for moves until moves are out
while game_on

  # Choose at random player for first move
  puts "#{player1} Where do you want to make your first move?"
  gets.chomp

  # Check if it is a valid move
  puts 'Not a valid move or the position is already taken, please choose another:'
  gets.chomp

  # Display board after each move for each player
  puts " 7 | 8 | 9
  ---+---+---
  4 | x | 6
  ---+---+---
  1 | 2 | 3"

  # Check if a user has won
  # player1.win == true ? game_on = false

  moves -= 1
  game_on = false if moves.zero?

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
  # player2.win == true ? game_on = false

  moves -= 1
  game_on = false if moves.zero?
end

# Check if someone wins or game tie
puts "#{player2} wins!"

# After the game is over, ask if they want to play again
puts 'Do you want to play again? (Y/N)'
gets.chomp
