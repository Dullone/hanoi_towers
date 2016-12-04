#moves tower from first to last rod using rules for the game Towers of Hanoi
def hanoi_towers(towers)
  last_move = createMoveHash(nil, nil)
  
  until win_condition(towers)
    move = find_move(towers, last_move)
    from = towers[move[:from_tower]]
    to   = towers[move[:to_tower]]
    make_move from, to
    last_move = move
  end

  towers
end

def empty(tower)
  tower.length == 0
end

def win_condition(towers)
  #if the first two rows empty, we are done
  return empty(towers[0]) && empty(towers[1])
end

def find_move(towers, last_move)
  towers.length.times do |i|
    unless last_move[:to_tower] == i #don't move the same piece twice
      move = best_move(towers, i)
      if move then return move end
    end
  end
  #if we cannot find a move it means we are at the halfway point of this 
  #solution with the tower stacked in the middle, so make the only move 
  #that isn't a repeat of the last.
  createMoveHash(last_move[:to_tower], 0)
end

def make_move(from_tower, to_tower)
  to_tower.push(from_tower.pop)
end

def can_move(from_tower, to_tower)
   from_tower.length > 0  && (
              to_tower.length == 0 || 
              (to_tower[-1] > from_tower[-1]))
end

def best_move(towers, from_tower)
  dest_towers = []
  #create an aray to look for moves that doesn't inlcude our from_tower
  towers.map.with_index { |e,i| 
                          unless i == from_tower 
                            dest_towers.push i  
                          end
                        }
  #We want to move farthest to the left as possible, given the way we constucted
  #the dest_towers array, this will loop from highest index to lowest, so the 
  #first match will be the best
  dest_towers.reverse_each do |i|
    if can_move towers[from_tower], towers[i]
      return createMoveHash(from_tower, i)
    end
  end
  false
end

def createMoveHash(from, to)
  return { from_tower: from, to_tower: to }
end