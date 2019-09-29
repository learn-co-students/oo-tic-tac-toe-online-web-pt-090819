class TicTacToe
  def initialize(board = nil)
    @board = board || @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(place, token="X")
    @board[place] = token
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(position)
    position.between?(0,8) && !position_taken?(position)
  end
  
  def turn_count
    number_of_turns = 0
    @board.each do |space|
      if space == "X" || space == "O"
        number_of_turns += 1
      end
    end
  return number_of_turns
  end
  
  def current_player
    if turn_count % 2 == 0 
      "X"
    else
      "O"
    end
  end
  
  def turn 
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win|
      if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
        return win
      elsif @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
        return win
      end
      false
    end
  end
  
  def full?
    @board.all?{|taken| taken != " "}
  end
  
  def draw?
    !(won?) && (full?)
  end
  
  def over?
    won? || full? || draw?
  end
  
  def winner
    WIN_COMBINATIONS.detect do |win|
      if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
        return "X"
      elsif @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
        return "O"
      end
      false
    end
  end
  
  def play 
    while over? == false 
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end