require "./hanoi_towers.rb"

RSpec.describe "hanoi_towers" do 
  let (:towers) {[ 
                  [5, 4, 3, 2, 1 ],
                  [],
                  []
                ]}
  let(:completed) {[
                  [],
                  [],
                  [5, 4, 3, 2, 1]
                ]}

  it "gets the best move" do
    expect(best_move(towers, 0)).to eql(createMoveHash(0,2))
  end
  it "solves hanoi towers for 5 stack" do
    expect(hanoi_towers(towers)).to eql completed
  end
  it "solves hanoi towers for 4 stack" do
    towers[0].shift
    completed[2].shift
    expect(hanoi_towers(towers)).to eql completed
  end
  it "solves hanoi towers for 6 stack" do
    towers[0].unshift(6)
    completed[2].unshift(6)
    expect(hanoi_towers(towers)).to eql completed
  end
  it "solves hanoi towers for 1 stack" do
    towers[0].shift(4)
    completed[2].shift(4)
    expect(hanoi_towers(towers)).to eql completed
  end
end