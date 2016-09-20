require_relative 'sticks.rb'

def take_sticks(player, total_sticks)
  if total_sticks.sticks != 1
    (1..3).include?(player)
    total_sticks.sticks = total_sticks.sticks - player
  elsif total_sticks.sticks == 1 && player == 1
    total_sticks.sticks = total_sticks.sticks - player
  else
    try_again()
  end
  return total_sticks
end

def try_again()
  puts "Invalid input. Would you like to try again?"
  print "Type \'retry\' to try again or \'exit\' to return to the Terminal: "
  input = gets.chomp.downcase
  if input == "retry"
    main
  else
    exit
  end
end

def main()
  puts "Welcome to the Game of Sticks!"
  print "How many sticks are on the table initially? Please choose a number between 10 and 100: "
  initial_sticks = gets.chomp.to_i
   if (10..100).include?(initial_sticks)
     total_sticks = Sticks.new(initial_sticks)
   else
     try_again()
   end

  until total_sticks.sticks == 0
    puts "There are #{total_sticks.sticks} sticks on the board."
    print "Player 1: How many sticks would you like to take? You may choose a number between 1 and 3: "
    p1_take_sticks = gets.chomp.to_i
      total_sticks = take_sticks(p1_take_sticks, total_sticks)
    puts "There are #{total_sticks.sticks} sticks on the board."
    print "Player 2: How many sticks would you like to take? You may choose a number between 1 and 3: "
    p2_take_sticks = gets.chomp.to_i
      total_sticks = take_sticks(p2_take_sticks, total_sticks)
  end
  if total_sticks.sticks == 0
    puts "There are #{total_sticks.sticks} sticks on the board."
    # how to let player know they won!
    try_again()
  end
end

if __FILE__ == $PROGRAM_NAME
main
end
