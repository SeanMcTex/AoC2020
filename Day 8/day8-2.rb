file = File.open("Day 8/day8input.txt")

@lines = file.read.split(/\n/)

Instruction = Struct.new(:operation, :parameter, :has_run)

def original_instructions()
    @lines.map { |line| 
      line.match(/^(\w{3}) ([\+-]\d*)/)
      Instruction.new( $1, $2.to_i, false )
  }
end

def test_program( instructions )
  pointer = 0
  acc = 0
  while pointer < instructions.count && ( instruction = instructions[ pointer ] ).has_run  == false
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
  
  if pointer == instructions.count
    puts acc
    exit
  end  
end

(0...original_instructions().count).each { |i|
  instructions = original_instructions()
  instruction = instructions[i]  
  
  case instruction[ :operation ]
  when "nop"
    instructions[i][:operation] = "jmp"
    test_program( instructions )
  when "jmp"
    instructions[i][:operation] = "nop"
    test_program( instructions )
  end
}