class TicTacToe
  attr_reader :board

  def initialize
    @board = [
      [[" "], [" "], [" "]],  #column0
      [[" "], [" "], [" "]],  #column1
      [[" "], [" "], [" "]],  #column2
    ]
  end

  def display
    puts " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} "
    puts "---+---+---+---+---+--"
    puts " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
    puts "---+---+---+---+---+--"
    puts " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "
  end

  def input
    column = nil
    row = nil
    x = false
    x == true ? x = false : x = true

    loop do
      puts "Which column would you like to enter? (0-2)"
      column = gets.chomp.to_i
      break if (0..2).include?(column)

      puts "Invalid input. Please enter a number between 0 and 2."
    end

    loop do
      puts "You chose: column #{column}. Now choose a row. (0-2)"
      row = gets.chomp.to_i
      break if (0..2).include?(row)

      puts "Invalid input. Please enter a number between 0 and 2."
    end

    puts "You chose: column #{column}, row #{row}"

    if @board[row][column] == [" "] and x == true
      @board[row][column] = ["X"]  # set the element to X
      display
    elsif @board[row][column] == [" "] and x == false
      @board[row][column] = ["O"]  # set the element to X
      display
    else
      puts "That space is already taken."
    end
  end
end

board = TicTacToe.new.board
board_display = TicTacToe.new.display
TicTacToe.new.input
