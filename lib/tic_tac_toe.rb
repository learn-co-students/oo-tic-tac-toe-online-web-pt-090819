class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
      [0,1,2], #top  
      [3,4,5], #middle
      [6,7,8], #bottom
      [0,3,6], #left_down
      [1,4,7], #middle_down
      [2,5,8], #right_down
      [0,4,8], #left_diagonal
      [2,4,6] #right_diagonal
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    index = user_input.to_i - 1
  end
  
  def move(index, player_token = "X")
    @board[index] = player_token
  end
  
  def position_taken?(position)
    if ((@board[position] == "X") || (@board[position] == "O"))
      true 
    else 
      false 
    end
  end
  
  def valid_move?(position)
    if !position_taken?(position) && position.between?(0,8)
      true 
    else
      false 
    end
  end
  
  def turn 
    puts "Please enter 1-9:"
    user_input = gets.chomp.to_i
    index = input_to_index(user_input)
    player = current_player
    if valid_move?(index)
     move(index, player)
     display_board
    else 
      turn
    end
  end
  
  def turn_count
    number_of_turns = 0 
    @board.each do |turns|
      if turns == "X" || turns == "O"
        number_of_turns += 1 
      end
    end
    number_of_turns
  end
  
  def current_player
    if turn_count % 2 == 0 
      "X"
    else
      "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]] == "X")
        win_combo
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]] == "O")
        win_combo
      else
        false
      end
    end
  end
  
  def full?
   @board.all?{|occupied| occupied != " "}
  end
  
  def draw?
    if full? && !won?
      true
    else
      false
    end
  end
  
  def over?
    if won? || full?
      true
    else
      false 
    end
  end
  
  def winner
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return "X"
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return "O"
      else
        nil
      end
    end
  end

  def play
    while over? == false && draw? == false
      turn 
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

end
