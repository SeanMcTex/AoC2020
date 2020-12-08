require 'set'
file = File.open("Day 6/day6input.txt")

group_data = file.read.split(/\n\n/)

# for part 1
def yes_answers( group_datum ) 
  group_datum.split('').filter {|c| c =~ /\w/ }.to_set
end

# for part 2
def unanimous_yes_answers( group_datum ) 
  individual_answer_lists = group_datum.split(/\n/).map{|answers| answers.split('')}
  return individual_answer_lists.reduce(individual_answer_lists[0]) { |answers_in_common, current_answers| answers_in_common & current_answers }
end
  
# main
tally = 0
group_data.each { |group_datum|
  tally = tally + unanimous_yes_answers( group_datum ).count
}

puts tally
