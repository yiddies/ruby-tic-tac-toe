class Board
  attr_reader :board

  def initialize
    @board = [
      [[""], [""], [""]],  #row0
      [[""], [""], [""]],  #row1
      [[""], [""], [""]],  #row2
    ]
  end

  def input(choice = gets.chomp)
    puts input
  end
end

board = Board.new.board
puts board[0][0]
