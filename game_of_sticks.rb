require 'pry'

def take_sticks(player, total_sticks)
  if total_sticks != 1
    (1..3).include?(player)
    total_sticks = total_sticks - player
  elsif total_sticks == 1 && player == 1
    total_sticks = total_sticks - player
  else
    print "There is/are #{total_sticks} stick(s) on the board. You must pick up #{total_sticks} stick(s). "
    sticks = gets.chomp.to_i
    total_sticks = take_sticks(sticks, total_sticks)
  end
  return total_sticks
end

def whos_turn(player, other, total_sticks)
  @current_player = player
  @opponent = other
  puts "There are #{total_sticks} sticks on the board."
  if player != 'AI'
    sticks = 0

    until (1..3).include? sticks
      print "#{@current_player}: How many sticks would you like to take? You may choose a number between 1 and 3: "
      sticks = gets.chomp.to_i
    end
  else
    sticks = rand(1..3)
    puts "AI takes #{sticks}"
  end
  total_sticks = take_sticks(sticks, total_sticks)
end

def game_over(total_sticks)
  if total_sticks == 0
    puts "There are #{total_sticks} sticks on the board."
    puts "#{@opponent} lost... #{@current_player} WINS!"
    play_again()
  end
end

# def try_again()
#   puts "Invalid input. Would you like to try again?"
#   print "Type \'retry\' to try again or \'exit\' to return to the Terminal: "
#   input = gets.chomp.downcase
#   if input == "retry"
#     main
#   else
#     exit
#   end
# end

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

def get_game_mode_option
  option = nil

  until option == "1" || option == "2" do
    print "Which option do you choose? "
    option = gets.chomp
  end

  option
end

def get_initial_sticks
  initial_sticks = 0

  until (10..100).include?(initial_sticks) do
    print "How many sticks are on the table initially? Please choose a number between 10 and 100: "
    initial_sticks = gets.chomp.to_i
  end

  initial_sticks
end

def main()
  puts "Welcome to the Game of Sticks!"
  puts "Options for Gameplay:"
  puts "Play against a friend (1)"
  puts "Play against the computer (2)"

  option = get_game_mode_option

  total_sticks = get_initial_sticks

  until total_sticks == 0
    player2 = option == "1" ? 'Player 2' : 'AI'

    total_sticks = whos_turn('Player 1', player2, total_sticks)
    game_over(total_sticks)
    total_sticks = whos_turn(player2, 'Player 1', total_sticks)
    game_over(total_sticks)
  end
end

if __FILE__ == $PROGRAM_NAME
  main
end
