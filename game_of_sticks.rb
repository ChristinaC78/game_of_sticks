require_relative 'sticks.rb'
require 'pry'
def take_sticks(player, total_sticks)
  if total_sticks.sticks != 1
    (1..3).include?(player)
    total_sticks.sticks = total_sticks.sticks - player
  elsif total_sticks.sticks == 1 && player == 1
    total_sticks.sticks = total_sticks.sticks - player
  else
    print "There is/are #{total_sticks.sticks} stick(s) on the board. You must pick up #{total_sticks.sticks} stick(s). "
    sticks = gets.chomp.to_i
      total_sticks = take_sticks(sticks, total_sticks)
  end
  return total_sticks
end

def whos_turn(player, other, total_sticks)
  @current_player = player
  @opponent = other
  puts "There are #{total_sticks.sticks} sticks on the board."
  print "#{@current_player}: How many sticks would you like to take? You may choose a number between 1 and 3: "
  sticks = gets.chomp.to_i
    total_sticks = take_sticks(sticks, total_sticks)
end

def game_over(total_sticks)
  if total_sticks.sticks == 0
    puts "There are #{total_sticks.sticks} sticks on the board."
    puts "#{@opponent} lost... #{@current_player} WINS!"
    play_again()
  end
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

def play_again()
  puts "Would you like to play again?"
  print "Type \'again\' to play again or \'exit\' to return to the Terminal: "
  input = gets.chomp.downcase
  if input == "again"
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
    total_sticks = whos_turn('Player 1', 'Player 2', total_sticks)
    game_over(total_sticks)
    total_sticks = whos_turn('Player 2', 'Player 1', total_sticks)
    game_over(total_sticks)
  end
end

if __FILE__ == $PROGRAM_NAME
main
end
