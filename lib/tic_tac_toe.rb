class TicTacToe
    attr_reader :board

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
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
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
    end
end

def won?
    winner = nil

    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|win| @board[win] == "X" }
        winner = combo
      elsif combo.all? {|win| @board[win] === "O" }
        winner = combo
      else
      winner
      end
    end
    winner
  end

  def full?
    turn_count == 9
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    # won? ? @board[won?[0]] : nil
    if player = won?
      @board[player[0]]
    end
  end

  def play
    turn until over?
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end


end
