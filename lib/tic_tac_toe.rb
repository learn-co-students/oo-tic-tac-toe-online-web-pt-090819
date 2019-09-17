class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5],  # Middle row
        [6,7,8], #Bottom Row
        [0,3,6], # Left Column
        [1,4,7], #Mid Column
        [2,5,8], #Right Column
        [0,4,8], #Diagonal
        [2,4,6] #Diagonal
      ]
    def initialize
        @board = Array.new(9, " ")
        
    end

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

    def move(place, player)
        @board[place] = player
    end

    def position_taken?(index)
        @board[index] == " " ? false : true
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        @board.count { |piece| piece == "X" || piece == "O"}
    end

    def current_player
        turn_count % 2 == 0 ?  "X" : "O"
    end

    def turn
        puts "Please enter a number between 1-9"
        input = input_to_index(gets.chomp)
        
        if valid_move?(input)
            player = current_player
            move(input, player)
        else
            turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.any? do | combination | 
            if position_taken?(combination[0]) && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
                 return combination
            end
        end
    end

    def full?
        turn_count == 9
    end

    def draw?
        full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        if player = won? 
             @board[player[0]]        
        end
    end

    def play
        turn until over?
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end