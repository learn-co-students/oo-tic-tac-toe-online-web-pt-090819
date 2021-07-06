require 'pry'

class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  
  def display_board
    puts @board[0..2].join(" | ").insert(0," ").insert(10," ")
    puts ("-----------")
    puts @board[3..5].join(" | ").insert(0," ").insert(10," ")
    puts ("-----------")
    puts @board[6..8].join(" | ").insert(0," ").insert(10," ")
    #I know I should use .each but I'm too lazy to do it
  end
  
  def input_to_index(n)
    n.to_i - 1
  end
  
  def move(input,token = "X")
    @board[input] = token
  end
  
  def position_taken?(index)
    @board[index]== " " ? false : true
  end
  
  def valid_move?(move)
    move > 8 || move < 0 || position_taken?(move) ? false : true
  end
  
  def turn_count
    @board.filter{|a|a != " "}.count
  end
  
  def current_player
    turn_count.even? ? "X":"O"
  end
  
  def turn
    while input = gets
      index = input_to_index(input)
      break if valid_move?(index)
    end
      @board[index] = current_player
      display_board
  end
  
  def won?
    won = false
    WIN_COMBINATIONS.each do |win|
      a = @board[win[0]]
      b = @board[win[1]]
      c = @board[win[2]]
      won = win if a == b && b == c && a != " "
    end
    won
  end
  
  def full?
    full = @board.filter{|a| a == " "}.count
    full == 0 ? true : false
  end
  
  def draw?
    full? && !won? ? true : false
  end
  
  def over?
    won? || draw? ? true : false
  end
  
  def winner
    v = won?
    v ? @board[v[0]] : nil
  end
  
  def play
    until over?
    turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end




