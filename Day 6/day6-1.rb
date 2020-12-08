require 'set'
file = File.open("Day 6/day6input.txt")

group_data = file.read.split(/\n\n/)

def yes_answers( group_datum ) 
  group_datum.split('').filter {|c| c =~ /\w/ }.to_set
end
  
# main
tally = 0
group_data.each { |group_datum|
  tally = tally + yes_answers( group_datum ).count
}

puts tally
