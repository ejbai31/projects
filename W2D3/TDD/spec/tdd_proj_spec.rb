require 'rspec'
require 'tdd_proj'

describe "#my_uniq" do
  it "returns uniq elements" do
    expect(my_uniq([1,2,1,3,3])).to eq([1,2,3])
  end

  it "returns original array if no repeats" do
    expect(my_uniq([1,2,3,4]).count).to eq(4)
  end
end

describe "#two_sum" do
  it "returns positions of two els that sum to zero" do
    expect(two_sum([1,2,-1])).to eq([[0,2]])
  end

  it "returns empty array if no pairs exist" do
    expect(two_sum([1,2,3])).to be_empty
  end
end

describe "#my_transpose" do
  it "transposes matrix" do
    matrix = [
      [1,2,1],
      [2,1,2],
      [1,2,1]
    ]
    expect(my_transpose(matrix)).to eq ([
      [1,2,1],
      [2,1,2],
      [1,2,1]
      ])
  end
end

describe "#stock_picker" do
  it "doesn't buy if not profitable to buy" do
    expect(stock_picker([3,2,1])).to be_nil
  end

  it "picks the most profitable stocks" do
    expect(stock_picker([3,2,1,0,2])).to eq([3,4])
  end
end
