class Array

  def my_flatten
    return_array = []
    self.each do |el|
      if el.is_a?(Array)
        return_array += el.my_flatten
      else
        return_array << el
      end
    end
    return_array
  end

  def my_zip(*args)
    return_arr = []
    self.each_with_index do |el, i|
      index_arr = [el]
      args.each do |val|
        index_arr << val[i]
      end
      return_arr << index_arr
    end
    return_arr
  end

  def my_join(sep = "")
    rt_string = ""
    self.each_with_index do |el, index|
      rt_string += el.to_s
      rt_string += sep unless index == self.length - 1
    end
    rt_string
  end

  def my_reverse
    rt_array = []
    i = self.length - 1
    while i >= 0
      rt_array << self[i]
      i -= 1
    end
    rt_array
  end

end

# puts [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten.inspect # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# puts [1, 2, 3].my_zip(a, b).inspect # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# puts a.my_zip([1,2], [8]).inspect   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# puts [1, 2].my_zip(a, b).inspect    # => [[1, 4, 7], [2, 5, 8]]
#
# c = [10, 11, 12]
# d = [13, 14, 15]
# puts [1, 2].my_zip(a, b, c, d).inspect    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# puts a.my_join.inspect      # => "abcd"
# puts a.my_join("$").inspect    # => "a$b$c$d"

# puts [ "a", "b", "c" ].my_reverse.inspect   #=> ["c", "b", "a"]
# puts [ 1 ].my_reverse.inspect               #=> [1]
