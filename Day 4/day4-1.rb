file = File.open("Day 4/day4input.txt")
required_fields = ['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid']

records = file.read.split(/\n\n/)

tally = 0
records.each { |record|
  fields = record.split
  field_hash = fields.reduce( Hash.new ) { |hash, field| 
    components = field.split(':')
    hash.update( components[0] => components[1] )
  }
  
  is_valid = required_fields.reduce( true ) { |result, field_name| result && field_hash.key?(field_name) }
  tally = tally + 1 if is_valid
}

puts tally
