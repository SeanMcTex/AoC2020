require 'set'
file = File.open("Day 7/day7input.txt")

lines = file.read.split(/\n/)

@rules = {}

lines.each { |line|
  container_name = line.match(/^(.*?) bags/).captures[0]
  contents = {}
  line.scan(/(\d) ([\w\s]*) bag/).each { |quantity, name|
    contents[ name ] = quantity.to_i
  }
  @rules[ container_name ] = contents
}

def find_contained_count( color )
  @rules[ color ].keys.reduce(0) { |count, bag_color| 
    count + ( @rules[ color ][ bag_color ] * find_contained_count( bag_color ) )
    } + 1
end

puts find_contained_count( "shiny gold" ) - 1