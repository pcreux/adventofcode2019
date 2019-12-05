matches = (156218..652527)
  .map(&:to_s)
  .select { |number| number.split(//).each_cons(2).to_a.all? { |a, b| a <= b } }
  .select { |number| number[/(.)\1/] }

puts "Part 1"
puts matches.size

puts "---"

puts "Part 2"

# attempt 1: 780 is too low - any password with digits not repeating or exactly pairs.
# puts matches.reject { |number| number[/(.)\1+/].map(&:size).any? { |size| size % 2 != 0 } }.size

# attempt 2: 1000 is too low - any password with an even number of repeating digits
# p matches.select { |number| number.scan(/((.)\2+)/).all? { |group, _| group.size.even? } }.size

# attempt 3: 1148. correct! - any password with at least one digit repeating exactly once
p matches.select { |number| number.scan(/((.)\2+)/).any? { |group, _| group.size == 2 } }.size
