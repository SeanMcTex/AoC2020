require 'set'
file = File.open("Day 7/day7input.txt")

lines = file.read.split(/\n/)

@rules = {}

lines.each { |line|
  container_name = line.match(/^(.*?) bags/).captures[0]
  contents = {}
  line.scan(/(\d) ([\w\s]*) bag/).each { |quantity, name|
    contents[ name ] = quantity
  }
  @rules[ container_name ] = contents
}

def find_containers( color )
  solutions = Set[]
  @rules.keys.each { |bag_color|
    @rules[bag_color].keys.each { |contained_bag_color|
      if contained_bag_color == color
        solutions = solutions.add( bag_color )
        solutions = solutions.merge( find_containers( bag_color ) )
      end
    }
  }
  return solutions
end

puts find_containers( "shiny gold" ).count