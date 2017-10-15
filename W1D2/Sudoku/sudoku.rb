require_relative 'board'

class Sudoku

  attr_reader :board

  def initialize(board)
    @board = board
  end

def get_pos
  pos = nil
  until pos && valid_pos?
    puts "Enter a position on the board ex: 2,3"
    pos = gets.chomp.split(",").each(&:to_i)
  end
  pos
end

def valid_pos?(pos)
  pos.is_a?(Array) && pos.length == 2 && #within  board dimensions
end

def get_val
  val = nil
  until val && valid_val?
    puts "Enter value between 1 to 9."
    val = gets.chomp
  end
end

def valid_val?(val)
end

def play
end



end
