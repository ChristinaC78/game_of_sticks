def main()
puts "Welcome to the Game of Sticks!"
print "How many sticks are on the table initially? Please choose a number between 10 and 100: "
initial_sticks = gets.chomp.to_i
 if initial_sticks == [10..100]
   total_sticks = Sticks.new(initial_sticks)
 else
 end

while total_sticks.sticks != 0
  puts "There are #{total_sticks.sticks} sticks on the board."
  print "Player 1: How many sticks would you like to take? You may choose a number between 1 and 3: "
  p1_take_sticks = gets.chomp.to_i
    if p1_take_sticks == [1..3] || p1_take_sticks == 2 || p1_take_sticks == 3
  total_sticks.sticks = total_sticks.sticks - p1_take_sticks

  puts "There are #{total_sticks.sticks} sticks on the board."
  print "Player 2: How many sticks would you like to take? You may choose a number between 1 and 3: "
  take_sticks_player_2 = gets.chomp.to_i
  sticks_left = sticks_remaining - take_sticks_player_2

  puts "There are #{sticks_left} sticks on the board."
  print "Player 1: How many sticks would you like to take? You may choose a number between 1 and 3: "
end

if __FILE__ == $PROGRAM_NAME
main
end
