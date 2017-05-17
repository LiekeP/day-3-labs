#Styling elements
def print_divider
  puts "\n"
  puts "*" * 40
  puts "\n"
end

def print_progress_bar
  print "G"
  10.times { sleep 0.1; print "O" }
  print "!!!"
  puts "\n\n"
end

#Insert data
NUM_POTATOES = 5
NUM_EGGS = 6

ingredients = [
  { name: 'potatoes', quantity: NUM_POTATOES },
  { name: 'eggs', quantity: NUM_EGGS },
  { name: 'onion', quantity: 1 },
  { name: 'oil', quantity: 'some' },
  { name: 'salt', quantity: 'some' },
]

#Call recipe
print_divider
puts "The best recipe for a Spanish Omelette!"
print_divider

puts "Required ingredients:"
ingredients.each do |ingredients|
  puts "#{ingredients[:name]} -> #{ingredients[:quantity]}"
end

#Check with user
print_divider

loop do
  puts "Do you have all required ingredients? Y/N"
  answer = gets.chomp.upcase

  if answer == "Y"
    puts "GOOD WORK! You can start cooking now :)"
    break
  elsif answer == "N"
    puts "You're not ready, go shopping!"
    print_progress_bar
  else
    puts "This is not a valid answer, try again. "
  end
end
