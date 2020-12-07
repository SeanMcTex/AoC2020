file = File.open("Day 5/day5input.txt")
records = file.read.split

def partition_value( s, lower_value )
  min = 0
  max = 2 ** s.length - 1
  
  s.split('').each { |c|
    mid = ( max - min ) / 2 + min
    if c == lower_value
      max = mid
    else
      min = mid
    end
  }
  return max  
end

def seat_id( assignment ) 
  row = assignment[0..6]
  seat = assignment[7..9]
  
  return partition_value( row, "F" ) * 8 + partition_value( seat, "L")
end

# main
seat_ids = records.map{ |record| seat_id( record )}
highest_seat_id = seat_ids.max

puts highest_seat_id
