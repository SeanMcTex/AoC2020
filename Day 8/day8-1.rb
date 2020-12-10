file = File.open("Day 8/day8input.txt")

lines = file.read.split(/\n/)

Instruction = Struct.new(:operation, :parameter, :has_run)

instructions = lines.map { |line| 
  line.match(/^(\w{3}) ([\+-]\d*)/)
  Instruction.new( $1, $2.to_i, false )
}

pointer = 0
acc = 0
while ( instruction = instructions[ pointer ] ).has_run  == false
  puts "Executing: #{instruction}"
  instruction[:has_run] = true
  case instruction[ :operation ]
  when "nop"
    pointer += 1
  when "acc"
    acc += instruction[ :parameter ]
    pointer += 1
  when "jmp"
    pointer += instruction[ :parameter ]
  end
end

puts acc