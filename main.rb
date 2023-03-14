class TicTacToe
  attr_reader :board

  def initialize
    @board = [
      [[" "], [" "], [" "]],  #column0
      [[" "], [" "], [" "]],  #column1
      [[" "], [" "], [" "]],  #column2
    ]

    @x = false
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
    @x = !@x

    loop do
      puts "Which column would you like to enter? (0-2)"
      column = gets.chomp.to_i
      break if (0..2).include?(column) || column == -1

      puts "Invalid input. Please enter a number between 0 and 2, or -1 to exit."
    end

    if column == -1
      puts "Goodbye!"
      exit
    end

    loop do
      puts "You chose: column #{column}. Now choose a row. (0-2)"
      row = gets.chomp.to_i
      break if (0..2).include?(row) || row == -1

      puts "Invalid input. Please enter a number between 0 and 2, or -1 to exit."
    end

    if row == -1
      puts "Goodbye!"
      exit
    end

    puts "You chose: column #{column}, row #{row}"

    if @board[row][column] == [" "] and @x == true
      @board[row][column] = ["X"]  # set the element to X
      display

      if win("X")
        puts "X won the game!"
        exit
      end
    elsif @board[row][column] == [" "] and @x == false
      @board[row][column] = ["O"]  # set the element to O
      display

      if win("O")
        puts "O won the game!"
        exit
      end
    else
      puts "That space is already taken."
    end
    input
  end

  def win(symbol)
    # Check rows
    @board.each do |row|
      return true if row.all? { |cell| cell == [symbol] }
    end

    # Check columns
    (0..2).each do |i|
      column = @board.map { |row| row[i] }
      return true if column.all? { |cell| cell == [symbol] }
    end

    # Check diagonals
    diagonal1 = [@board[0][0], @board[1][1], @board[2][2]]
    diagonal2 = [@board[0][2], @board[1][1], @board[2][0]]
    return true if diagonal1.all? { |cell| cell == [symbol] } || diagonal2.all? { |cell| cell == [symbol] }

    false
  end
end

board = TicTacToe.new.board
board_display = TicTacToe.new.display
game = TicTacToe.new.input
