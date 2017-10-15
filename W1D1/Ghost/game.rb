require_relative 'player'
require 'byebug'
class Game

  GHOST_TRASLATOR = { 1 => "G", 2 => "GH", 3 =>"GHO", 4 => "GHOS", 5 => "GHOST" }

  attr_accessor :player_one, :player_two, :fragment,
                :dictionary, :current_player, :previous_player, :losses

  def initialize(player_one, player_two, dictionary = Game.create_dictionary)
    @player_one = player_one
    @player_two = player_two
    @fragment = ""
    @dictionary = dictionary
    @current_player = player_one
    @previous_player = player_two
    @losses = {}
    @losses[@player_one.name] = 0
    @losses[@player_two.name] = 0
  end

  def self.create_dictionary
    hash = Hash.new
    File.open("dictionary.txt") do |fp|
      fp.each do |line|
        key = line.chomp
        hash[key] = ""
      end
    end
    hash
  end



  def play_round
    puts "Welcome to the game!"
    loop do
      take_turn(current_player)
      break if won?
      next_player!
    end
    puts "GAME OVER"
  end

  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
  end

  def run
    until @losses.keys.any? {|k| k == 5}
      play_round
    end
  end

  def take_turn(player)
    temp_play = ""
    loop do
      puts self.fragment
      temp_play = player.guess
      break if valid_play?(temp_play)
      puts "Invalid."
    end
    @fragment += temp_play
  end

  def won?
    if @dictionary.has_key?(@fragment)
      puts "#{@previous_player.name} won."
      @losses[@current_player.name] += 1
      puts "#{@previous_player.name} has the following letters: "
      + GHOST_TRASLATOR[@losses[@current_player.name]]
      return true
    end
    false
  end

  def valid_play?(string)
    alphab = ('a'..'z').to_a
    return false unless alphab.include?(string)
    guess = @fragment + string
    @dictionary.each_key do |k|
      return true if k[0...guess.length] == guess
    end
    false
  end


end



if __FILE__ == $PROGRAM_NAME
  puts "Player 1 name?"
  player_1 = gets.chomp
  puts "Player 2 name?"
  player_2 = gets.chomp
  Game.new(Player.new(player_1), Player.new(player_2)).play_round
end
