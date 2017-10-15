require 'colorize'

class Tile

  attr_accessor :value

  def initialize(value)
    @value = value
    @given = value == 0 ? false : true 
  end

  def color
    self.given? ? :blue : :red
  end

  def given?
    @given
  end


end
