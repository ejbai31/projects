class Array

  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    selected_array = []
    self.my_each do |el|
      selected_array << el if prc.call(el)
    end
    selected_array
  end

  def my_reject(&prc)
    selected_array = []
    self.my_each do |el|
      selected_array << el unless prc.call(el)
    end
    selected_array
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false unless prc.call(el)
    end
    true
  end
end



# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end

# a = [1, 2, 3]
# puts a.my_select { |num| num > 1 }.inspect # => [2, 3]
# puts a.my_select { |num| num == 4 }.inspect # => []
#
# a = [1, 2, 3]
# puts a.my_reject { |num| num > 1 }.inspect # => [1]
# puts a.my_reject { |num| num == 4 }.inspect # => [1, 2, 3]

a = [1, 2, 3]
puts a.my_any? { |num| num > 1 }.inspect # => true
puts a.my_any? { |num| num == 4 }.inspect # => false
puts a.my_all? { |num| num > 1 }.inspect # => false
puts a.my_all? { |num| num < 4 }.inspect # => true
