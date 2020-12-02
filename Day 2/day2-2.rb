file = File.open("day2input.txt")

lines = file.read.split(/\n/)

tally = 0
lines.each{ |line|
  pos1, pos2, char, pass = line.match(/(\d*)-(\d*) (\w): (\w*)/).captures
  
  pos1_index = pos1.to_i - 1
  pos2_index = pos2.to_i - 1
    
  count = 0
  count = count + 1 if pass[pos1_index] == char
  count = count + 1 if pass[pos2_index] == char
  
  tally = tally + 1 if count == 1
}

puts tally