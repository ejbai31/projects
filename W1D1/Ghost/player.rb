class Player

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def guess
    puts "#{@name}, Enter your guess:"
    gets.chomp
  end

  # def alert_invalid_guess
  # end


end
