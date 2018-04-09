# The main file - the directory.

# Defining the width of the programme - used later on
@width = 43

# Method for adding students through the command line.
def input_students
  puts "Add the students to the directory"
  puts "To finish, just hit return twice"
  # Create empty array
  students = []
  # while the name is not empty, repeat this code
  while true do
    # Get the name
    print "Name: "
    name = gets.chomp.capitalize
    if name.empty? == false
      # Then ask for the cohort
      print "Cohort: "
      cohort = gets.chomp.to_s
      # Then ask for their hero
      print "Hero: "
      hero = gets.chomp
      # Adding default values to student info if left blank by the user.
      cohort = :Janurary if cohort.empty?
      hero = "Not provided" if hero.empty?
      # Add the student to the array
      students << {name: name, cohort: cohort, hero: hero}
      puts "Now we have #{students.count} students"
    else
      # Break out of the loop if user input is blank
      break
    end
  end
  students
end

# Called for testing rather than the above method
dumby_students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, hero: "Himself"},
  {name: "Darth Vader", cohort: :november, hero: "The empirer"},
  {name: "Nurse Ratched", cohort: :november, hero: "Order"},
  {name: "Michael Corleone", cohort: :november, hero: "His father"},
  {name: "Alex DeLarge", cohort: :november, hero: "Oranges"},
  {name: "The Wicked Witch of the West", cohort: :november, hero: "Sister"},
  {name: "Terminator", cohort: :november, hero: "Guns"},
  {name: "Freddy Krueger", cohort: :november, hero: "Knives"},
  {name: "The Joker", cohort: :november, hero: "Batman"},
  {name: "Joffrey Baratheon", cohort: :november, hero: "Himself"},
  {name: "Norman Bates", cohort: :november, hero: "Alfred Hitchcock"}
]

# Method for the welcome text of the directory.
def print_header
  puts
  puts "The students of Villains Academy".center(@width)
  puts
end

# Method for printing a list to the console.
def print_students(students)
  students.each_with_index do |student, index|
    puts " #{student[:name]} (##{index + 1}) ".center(@width,"-")
    puts "Cohort: #{student[:cohort].capitalize}".center(@width)
    puts "Hero: #{student[:hero]}".center(@width)
    puts
  end
end

# Method for footer of the directory
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print_students(students)
print_footer(students)
