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

preamble = 25
(preamble...lines.count).each { |i|
  if check_validity( lines, i, preamble ) == false then
    puts("#{lines[i]} failed")
    exit
  end
}