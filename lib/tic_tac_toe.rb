class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
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
  
  def input_to_index(i)
    place=(i.to_i)-1
     
  end
  
  def move(i, token="X")
    @board[i] = token
  end
  
  def position_taken?(i)
    @board[i]== "X" || @board[i] == "O"
  end  
  
  def valid_move?(i)
    !position_taken?(i) && i<9 && i>=0
  end
  
  def current_player
   turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def turn
    puts "Please provide position 1-9"
    position=gets
    i=input_to_index(position)
    if valid_move?(i)
      move(i, current_player)
      display_board
    else
    turn
    end
  end
  
  def won?
    winner=nil
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|win| @board[win]=="X"}
        winner=combo
      elsif combo.all? {|win| @board[win]=="O"}
        winner=combo
      else
        winner
      end
    end
    winner
  end  
  
  def full?
    turn_count==9
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    won? ? @board[won?[0]] : nil
  end
  
  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
   

end