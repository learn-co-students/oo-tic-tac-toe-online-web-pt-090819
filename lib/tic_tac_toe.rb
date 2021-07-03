class TicTacToe
  
  def initialize()
    @board = Array.new(9," ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [2,5,8],
    [1,4,7]
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
  
  def move(index, value)
    @board[index] = value
    @board
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please choose a position between 1-9."
    input = gets.strip
    index = input_to_index(input)
    value = current_player
      if valid_move?(index)
        move(index, value)
        display_board
      else 
        puts "Invalid selection, please choose a position between 1-9."
        turn
     end
     
    def won?
       WIN_COMBINATIONS.detect do |win_combo|
           pos1 = @board[win_combo[0]]
      pos2 = @board[win_combo[1]]
      pos3 = @board[win_combo[2]]
      if (pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O")
        return win_combo
      end
    end
    return false
  end
   end
   
 def turn_count
    count = 0
    @board.each do |pos|
      count += 1 if pos == "X" || pos == "O"
     end
    count
  end
  
  def current_player
    if turn_count % 2 == 0 
      "X"
    else
      "O" 
    end
  end
    
  def full?
    @board.all?{|occupied| occupied != " "}
  end
    
  def draw?
    !(won?) && (full?)
  end
  
  def over?
    (won?) || (full?) || (draw?)
  end
  
  def winner
        the_champ = won?
        if the_champ
         return @board[the_champ[0]]
    end
  end
  
  def play 
    while !over?
    turn
  end
  
  if draw?
    puts "Cat's Game!"
  elsif won?
    puts "Congratulations #{winner}!"
  end
end
  
end

