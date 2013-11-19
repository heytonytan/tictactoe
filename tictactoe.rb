# This is a simple game of tictactoe written by Tony Tan Kwan Tiong on 18 - 19 Nov 2013, meant to be played by two players over the command line.

# global variables holding the tictactoe moves
$upper_left = "-"
$upper_middle = "-"
$upper_right = "-"
$middle_left = "-"
$middle_middle = "-"
$middle_right = "-"
$lower_left = "-"
$lower_middle = "-"
$lower_right = "-"

#loads up the game
def start_game
  print "\nHi! We are developing a tic tac toe game here.\n\n"
  sleep 1.0
  print "We are now going to start a new board"
  pause_period; pause_period; pause_period; pause_period; pause_period
end

# checks that the board is not full
def board_not_full
  return $upper_left == "-" \
  || $upper_middle == "-" \
  || $upper_right == "-" \
  || $middle_left == "-" \
  || $middle_middle == "-" \
  || $middle_right == "-" \
  || $lower_left == "-" \
  || $lower_middle == "-" \
  || $lower_right == "-"
end

# print current state of game board
def print_current
  print "|"
  print $upper_left
  print "|"
  print $upper_middle
  print "|"
  print $upper_right
  print "|"
  print "\n"

  print "|"
  print $middle_left
  print "|"
  print $middle_middle
  print "|"
  print $middle_right
  print "|"
  print "\n"

  print "|"
  print $lower_left
  print "|"
  print $lower_middle
  print "|"
  print $lower_right
  print "|"
  print "\n\n"
end

# prints available moves, filled boxes are excluded
def print_available_moves
  if $upper_left == "-"; print "(a) upper-left\n"; end
  if $middle_left == "-"; print "(b) middle-left\n"; end
  if $lower_left == "-"; print "(c) lower-left\n"; end
  if $upper_middle == "-"; print "(d) upper-middle\n"; end
  if $middle_middle == "-"; print "(e) middle-middle\n"; end
  if $lower_middle == "-"; print "(f) lower-middle\n"; end
  if $upper_right == "-"; print "(g) upper-right\n"; end
  if $middle_right == "-"; print "(h) middle-right\n"; end
  if $lower_right == "-"; print "(i) lower-right\n"; end
end

# pausing when loading up (for dramatic effect)
def pause_period
  sleep 0.25
  print "."
end

# entering of moves
def enter_move_o(play)
  enter_move(play, "O")
end

def enter_move_x(play)
  enter_move(play, "X")
end

def enter_move(play, symbol)
  if play == "a" && $upper_left == "-"
    $upper_left = symbol
  elsif play == "b" && $middle_left == "-"
    $middle_left = symbol
  elsif play == "c" && $lower_left == "-"
    $lower_left = symbol
  elsif play == "d" && $upper_middle == "-"
    $upper_middle = symbol
  elsif play == "e" && $middle_middle == "-"
    $middle_middle = symbol
  elsif play == "f" && $lower_middle == "-"
    $lower_middle = symbol
  elsif play == "g" && $upper_right == "-"
    $upper_right = symbol
  elsif play == "h" && $middle_right == "-"
    $middle_right = symbol
  elsif play == "i" && $lower_right == "-"
    $lower_right = symbol
  else
    print "\nSorry, my dear. You would need to enter the corresponding alphabet representing the move you wish to make. Also, you can only select from the choices displayed above as some moves have already been made. Please try again.\n\n"
    next_play = gets.chomp
    enter_move(next_play, symbol)
  end
end

# asking the player to make his or her move
def make_move(player)
  print "\n\n"
  print_current
  print "Player "+ player.to_s + ". Please now make your move. You can chose from the following:\n"
  print_available_moves

  play = gets.chomp
  
  if player == 1
    enter_move_o(play)
  elsif player == 2
    enter_move_x(play)
  end
  
  print "\n\n"
  print_current
  print "Thanks for your move, Player "+ player.to_s + ".\n\n"
end



# checks that one of the players won
def someone_won?(turn)
  if turn == 1
    o_won?
  elsif turn == 2
    x_won?
  end
end

def o_won?
  check_win?("O")
end

def x_won?
  check_win?("X")
end

def check_win?(symbol) # 8 ways of winning
  return upper_horizontal_match(symbol) \
  || middle_horizontal_match(symbol) \
  || lower_horizontal_match(symbol) \
  || left_vertical_match(symbol) \
  || middle_vertical_match(symbol) \
  || right_vertical_match(symbol) \
  || left_diagonal_match(symbol) \
  || right_diagonal_match(symbol)
end

def upper_horizontal_match(symbol)
  return $upper_left == symbol \
  && $upper_middle == symbol \
  && $upper_right == symbol
end

def middle_horizontal_match(symbol)
  return $middle_left == symbol \
  && $middle_middle == symbol \
  && $middle_right == symbol
end

def lower_horizontal_match(symbol)
  return $lower_left == symbol \
  && $lower_middle == symbol \
  && $lower_right == symbol
end

def left_vertical_match(symbol)
  return $upper_left == symbol \
  && $middle_left == symbol \
  && $lower_left == symbol
end

def middle_vertical_match(symbol)
  return $upper_middle == symbol \
  && $middle_middle == symbol \
  && $lower_middle == symbol
end

def right_vertical_match(symbol)
  return $upper_right == symbol \
  && $middle_right == symbol \
  && $lower_right == symbol
end

def left_diagonal_match(symbol)
  return $upper_left == symbol \
  && $middle_middle == symbol \
  && $lower_right == symbol
end

def right_diagonal_match(symbol)
  return $upper_right == symbol \
  && $middle_middle == symbol \
  && $lower_left == symbol
end

# prints out results
def publish_result(turn)
  if someone_won?(turn)
    print "Thank you everyone! Player " + turn.to_s + " won."
  else
    print "\nThe board is full now. It's a draw!\n\n"
  end
  print "Thanks for playing this game of tic tac toe!\n"
end 

def asks_if_replay
  print "\nDo you guys want to play again? (Y/N)\n\n"

  response = gets.chomp
  while response != "Y" && response != "N"
    print "please respond Y or N."
    response = gets.chomp
  end

  if response == "Y"
    print "Okay! Game will start up again"
    pause_period; pause_period; pause_period; pause_period; pause_period
    print "\n"
    run_game
  elsif response == "N"
    print "If that is your choice, the program will end! Thanks again for playing!\n\n"
  end
end

# main function calling all the other sub-functions
def run_game  
  start_game
  turn = 1
  while board_not_full
    make_move(turn)
    if someone_won?(turn)
      break
    elsif turn == 1 # switch players - players take turns
      turn = 2
    elsif turn == 2
      turn = 1
    end
  end
  publish_result(turn)
  asks_if_replay  
end

#execution of program
run_game