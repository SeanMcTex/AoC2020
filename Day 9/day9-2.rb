file = File.open("Day 9/day9input.txt")
lines = (file.read.split(/\n/)).map{|item| item.to_i}

def check_validity( data, index, window_size )  
  (index - window_size...index).each { |i|
    (i+1...index).each { |j|
      if data[ i ] + data[ j ] == data[ index ] then
        return
      end
    }
  }
  
  return false
end

def get_invalid( data, preamble_size )
  (preamble_size...data.count).each { |i|
    if check_validity( data, i, preamble_size ) == false then
      return data[i]
    end
  }
end

def find_sum_range( data, target )
  (0...data.size).each { |i|
    (i+1...data.size).each { |j|
      sum = (i..j).reduce(0){|sum, index| sum + data[ index ]}
      if sum == target then
        candidates = data.slice(i..j)
        puts candidates.max + candidates.min
      end
    }
  }
end

invalid_item = get_invalid( lines, 25 ) # part 1
find_sum_range( lines, invalid_item) # part 2