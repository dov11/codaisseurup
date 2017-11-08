puts "Number?"
number = gets.to_i
for egg in (0..number).to_a.reverse
  puts egg
end
