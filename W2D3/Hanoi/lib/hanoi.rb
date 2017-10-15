class Hanoi

  attr_reader :stacks
  def initialize
    @stacks = [[1,2,3], [], []]
  end

  def play
    render
    until game_over?
      puts "Select tower"
      first = gets.to_i

      puts "Move to?"
      second = gets.to_i

      if valid?(first, second)
        move(first, second)
      else
        render
        puts "Invalid move."
      end
    end
    puts "WINNER WINNER"
  end

  def game_over?
    @stacks == [[], [3,2,1], []]
  end

  def valid?(first, second)
    return false if [first, second].any?{|tower| tower > 2}
    
  end

  def render
    puts @stacks
  end

  def move(first, second)
    raise "no discs here!" if @stacks[first].empty?
    @stacks[second] << @stacks[first].shift
  end

end
