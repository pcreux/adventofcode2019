INPUT = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,6,1,19,1,5,19,23,1,13,23,27,1,6,27,31,2,31,13,35,1,9,35,39,2,39,13,43,1,43,10,47,1,47,13,51,2,13,51,55,1,55,9,59,1,59,5,63,1,6,63,67,1,13,67,71,2,71,10,75,1,6,75,79,1,79,10,83,1,5,83,87,2,10,87,91,1,6,91,95,1,9,95,99,1,99,9,103,2,103,10,107,1,5,107,111,1,9,111,115,2,13,115,119,1,119,10,123,1,123,10,127,2,127,10,131,1,5,131,135,1,10,135,139,1,139,2,143,1,6,143,0,99,2,14,0,0].freeze

def run(state, position: 0)
  #display(state)

  opcode, input_1_pos, input_2_pos, output_pos = state[position..position + 3]
  input_1 = state[input_1_pos]
  input_2 = state[input_2_pos]

  output = case opcode
  when 1
    input_1 + input_2
  when 2
    input_1 * input_2
  when 99
    return state[0]
  else
    raise "invalid opcode #{opcode.inspect}"
  end

  state[output_pos] = output
  run(state, position: position + 4)
end

def display(state)
  puts state.inspect
end

def init_run(input: INPUT, noun: 12, verb: 2)
  input = INPUT.dup
  input[1] = noun
  input[2] = verb

  run(input)
end

# 1 star
init_run

# 2 stars
loop do
  noun = rand(INPUT.size)
  verb = rand(INPUT.size)
  r = init_run(noun: noun, verb: verb)
  if r == 19690720
    puts "YAS!"
    p noun
    p verb
    p 100 * noun + verb
    break
  end
end

