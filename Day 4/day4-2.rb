file = File.open("Day 4/day4input.txt")
required_key_patterns = {
  'byr' => /^(\d{4}$)/,
  'iyr' => /^(\d{4}$)/,
  'eyr' => /^(\d{4}$)/,
  'hgt' =>  /^(\d*)(cm|in)$/,
  'hcl' => /^#([0-9a-f]{6})$/,
  'ecl' => /^amb|blu|brn|gry|grn|hzl|oth$/,
  'pid' => /^(\d{9})$/
  
}

records = file.read.split(/\n\n/)

tally = 0
records.each { |record|
  fields = record.split
  field_hash = fields.reduce( Hash.new ) { |hash, field| 
    components = field.split(':')
    hash.update( components[0] => components[1] )
  }
  
  is_valid = true
  required_key_patterns.keys.each { |field_name|
    # is required key present?
    if !field_hash.key?(field_name) then
      is_valid = false
      break
    end
    
    value = field_hash[ field_name ]
    pattern = required_key_patterns[ field_name ]
    
    match = value.match( pattern )
    
    if !match then
      # didn't match the regular expression for this type
      is_valid = false
    else
      case field_name
      when 'byr'
        year = $1.to_i
        is_valid = year >= 1920 && year <= 2002
      when 'iyr'
        year = $1.to_i
        is_valid = year >= 2010 && year <= 2020
      when 'eyr'
        year = $1.to_i
        is_valid = year >= 2020 && year <= 2030
      when 'hgt'
        units = $2
        value = $1.to_i
        case units
        when 'cm'
          is_valid = value >= 150 && value <= 193
        when 'in'
          is_valid = value >= 59 && value <= 76
        end
      end      
    end
    
    break if !is_valid
  }

  tally = tally + 1 if is_valid
}

puts tally
