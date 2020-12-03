file = File.open("day3input.txt")

Coordinates = Struct.new( :x, :y )

lines = file.read.split(/\n/)

@matrix = []
lines.each{ |line|
  @matrix << line.scan(/./)
}
# note: this quick-and-dirty parsing leaves us with the data
# in y/x coordinates rather than x/y. Keep this in mind. :)

def tally_trees( slope )
  pos = Coordinates.new( 0, 0 )

  tally = 0
  pos.x = ( pos.x + slope.x ) % @matrix[0].count
  pos.y = pos.y + slope.y

  while pos.y < @matrix.count do  
    tally = tally + 1 if @matrix[pos.y][pos.x] == "\#"
  
    pos.x = ( pos.x + slope.x ) % @matrix[0].count
    pos.y = pos.y + slope.y
  end

  return tally
end

slopes = [ Coordinates.new( 1, 1 ) ]
slopes << Coordinates.new( 3, 1 )
slopes << Coordinates.new( 5, 1 )
slopes << Coordinates.new( 7, 1 )
slopes << Coordinates.new( 1, 2 )

puts slopes.reduce(1) { |product, slope| product * tally_trees( slope ) }
