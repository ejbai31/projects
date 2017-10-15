
def my_uniq(arr)
  uniq_els = []
  arr.map do |el|
    uniq_els << el unless uniq_els.include?(el)
  end
  uniq_els
end


def two_sum(arr)
  pairs = []
  (0...arr.length).each do |i|
    (1...arr.length).each do |j|
      pairs << [i, j] if arr[i] + arr[j] == 0
    end
  end
  pairs
end

def my_transpose(matrix)
  dims = matrix.count
  cols = Array.new(dims){Array.new(dims)}
  dims.times do |i|
    dims.times do |j|
      cols[j][i] = matrix[j][i]
    end
  end
  cols
end

def stock_picker(stocks)
  best_days = nil
  highest_profit = 0

  stocks[0..-2].each_with_index do |val1, day1|
    stocks[1..-1].each_with_index do |val2, day2|
      next if day1 > day2
      profit = val2 - val1
      if profit > highest_profit
        best_days = [day1, day2]
        highest_profit = profit
      end
    end
  end
  best_days
end
