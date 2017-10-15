require 'byebug'

def factors(num)
  (1..num).select do |n|
    num % n == 0
  end
end

class Array
  def bubble_sort!(&prc)
    unsorted = true
    while unsorted
      unsorted = false
      self.each_index do |index|
        left, right = self[index], self[index + 1]
        break if index == self.length - 1
        if prc.call(left, right) == 1
          left, right = right, left
          unsorted = true
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
  end
end

def substrings(string)
  rt_arr = []
  letters = string.chars
  letters.each_with_index do |l, i|
    end_ind = i
    while end_ind < letters.length
      rt_arr << letters[i..end_ind].join
      end_ind += 1
    end
  end
  rt_arr
end

def subwords(word, dictionary)
  list = substrings(word)
  list.select{ |w| dictionary.include?(w)}
end

puts substrings("cat").inspect # ["c", "ca", "cat", "a", "at", "t"]

puts subwords("cat", ["at", "ha", "c"]).inspect



# puts [1, 3, 5, 4, 2].bubble_sort! { |num1, num2| num1 <=> num2 }.inspect #sort ascending
# puts [1, 3, 5, 4, 2].bubble_sort! { |num1, num2| num2 <=> num1 }.inspect #sort descending

# puts factors(49).inspect
# puts factors(2).inspect
