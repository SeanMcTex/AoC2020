file = File.open("day1input.txt")

lines = file.read.split
lines.each{ |item1|
  lines.each{ |item2|
    lines.each{ |item3| 
      if item1.to_i + item2.to_i + item3.to_i == 2020 then
        puts item1.to_i * item2.to_i * item3.to_i
        exit
      end
    }
  }
}