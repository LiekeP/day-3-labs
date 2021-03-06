#Styling elements
def print_divider
  puts "\n"
  puts "*" * 40
  puts "\n"
end

def print_go_bar
  print "G"
  10.times { sleep 0.1; print "O" }
  print "!!!"
  puts "\n\n"
end

def print_progress_bar
  5.times { sleep 0.1; print "." }
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
    print_go_bar
  else
    puts "This is not a valid answer, try again. "
  end
end

#Recipe steps
print_divider

steps = [
  { description: "Scrape potatoes", action: "scrape_potatoes" },
  { description: "Cut potatoes into thick slices", action: "cut_potatoes" },
  { description: "Chop the onion", action: "generic_recipe_step" },
  { description: "Heat the oil in a large frying pan", action: "generic_recipe_step" },
  { description: "Add potatoes to the pan", action: "add_potatoes_to_pan" },
  { description: "Add onion to the pan", action: "generic_recipe_step" },
  { description: "Strain potatoes and onions through a colander into a large bowl", action: "generic_recipe_step" },
  { description: "Break the eggs", action: "break_eggs" },
  { description: "Beat the eggs separately", action: "generic_recipe_step" },
  { description: "Stir into the bowl the potatoes with plenty of salt", action: "generic_recipe_step" },
  { description: "Heat a little of the strained oil in a smaller pan", action: "generic_recipe_step" },
  { description: "Tip everything into the pan and cook on a moderate heat", action: "generic_recipe_step"},
  { description: "When almost set, invert on a plate and slide back into the pan", action: "generic_recipe_step" },
  { description: "Cook a few more minutes and slide on to a plate and cool for 10 minutes before serving", action: "generic_recipe_step" }
]

puts "Cooking instructions:"
steps.each_with_index do |step, index|
  puts (index + 1).to_s + ") " + step[:description]
end

#Define methods
def generic_recipe_step
  print "Working on it!"
  print_progress_bar
end

def scrape_potatoes
  counter = 0
  while counter < NUM_POTATOES
    counter += 1
    print "Scraping potato #{counter}"
    print_progress_bar
  end
end

def cut_potatoes
  counter = 0
  while counter < NUM_POTATOES
    counter += 1
    print "Cutting potato #{counter} into thick slices"
    print_progress_bar
  end
end

def add_potatoes_to_pan
  for counter in 1..NUM_POTATOES
    print "Adding potato #{counter} to the pan."
    print_progress_bar
  end
end

def break_eggs
  counter = 0
  while counter < NUM_EGGS
    counter += 1
    print "Breaking egg #{counter}"
    print_progress_bar
  end
end

def ready_next_step(step, index)
  puts "Are you ready for step #{index + 1}?\n(#{step[:description]})"
  answer = gets.chomp.upcase

  answer == "Y"
end

#Go through recipe
steps.each_with_index do |step, index|
  print_divider

  loop do
    ready = ready_next_step(step, index)
    break if ready

    puts "OK, I will give you some extra time."
    print_progress_bar
  end

  send(step[:action])
end

#end message
print_divider
puts "Hurray you just finished! Enjoy your omelette :)"
print_divider
