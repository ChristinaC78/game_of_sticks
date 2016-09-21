require 'pry'

def get_game_mode_option
  puts "Lets play a game of Pick Up Sticks!"
  puts "Options for Gameplay:"
  puts "Play against a friend type \'1\'"
  puts "Play against the computer type \'2\'"
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
    print "How many sticks are on the table? Please choose a number between 10 and 100: "
    initial_sticks = gets.chomp.to_i
  end

  initial_sticks
end

def pick_up_sticks(player, total_sticks)
  if total_sticks >= 3
    total_sticks = total_sticks - player
  else
    if total_sticks == 2 && (1..2).include?(player)
      total_sticks = total_sticks - player
    else
      total_sticks == 1 && player == 1
      total_sticks = total_sticks - player
    end
  end

  total_sticks
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
    puts "AI chose #{sticks}"
  end

  total_sticks = pick_up_sticks(sticks, total_sticks)
end

def game_over(total_sticks)
  if total_sticks <= 0
    puts "There are no sticks on the board."
    puts "#{@opponent} lost... #{@current_player} WINS!"
    play_again()
  end
end

def play_again()
  puts "Would you like to play again?"
  print "Type \'again\' to play again or \'exit\' to return to the Terminal: "
  input = gets.chomp.downcase
  if input == "again"
    option = get_game_mode_option

    total_sticks = get_initial_sticks

    until total_sticks == 0
      player2 = option == "1" ? 'Player 2' : 'AI'

      total_sticks = whos_turn('Player 1', player2, total_sticks)
      game_over(total_sticks)
      total_sticks = whos_turn(player2, 'Player 1', total_sticks)
      game_over(total_sticks)
    end
  else
    exit
  end
end

def main
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
