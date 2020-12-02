file = File.open("day2input.txt")

lines = file.read.split(/\n/)

tally = 0
lines.each{ |line|
  min, max, char, pass = line.match(/(\d*)-(\d*) (\w): (\w*)/).captures
  count = pass.scan(char).count
  tally = tally + 1 if ( count >= min.to_i ) && ( count <= max.to_i )
}

puts tally