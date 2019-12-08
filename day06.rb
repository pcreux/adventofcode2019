def output_digraph
  orbits = File.read('input-day-6.txt').split("\n").map { |line| line.split(")") }
  puts "digraph D {"
  orbits.each do |from, to|
    puts "#{to.inspect} -> #{from.inspect}"
  end
  puts "}"
end


def count_orbits
  orbits = File.read('input-day-6.txt').split("\n").map { |line| line.split(")").reverse }.to_h

  count = 0

  orbits.keys.each do |object|
    loop do
      object = orbits[object]
      count += 1
      break if object == "COM"
    end
  end
end

def path(from, to)
  orbits = File.read('input-day-6.txt').split("\n").map { |line| line.split(")").reverse }.to_h
  path = [from]

  object = from
  loop do
    object = orbits.fetch(object)
    path << object
    break if object == to
  end

  path
end

def you_to_san
  orbits = File.read('input-day-6.txt').split("\n").map { |line| line.split(")").reverse }.to_h

  san_to_com = path("SAN", "COM")
  you_to_com = path("YOU", "COM")

  common = (san_to_com & you_to_com).first

  san_to_common = path("SAN", common)
  you_to_common = path("YOU", common)

  p san_to_common & you_to_common == ["ZCZ"]

  # 362 was too high... 361 worked :shrug:
  p san_to_common.size + you_to_common.size - 4
end

you_to_san
