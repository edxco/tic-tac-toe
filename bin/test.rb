move = gets.chomp.to_i
 p move

 move <= 9 && move >= 1 ? state = false : state = true

 p state

  while state
    puts "Invalid move, choose between 1 or 9?"
    move = gets.chomp.to_i
    move <= 9 && move >= 1 ? state = false : state = true
  end 