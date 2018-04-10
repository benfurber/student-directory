# The main file - the directory.

# The students array - accessible to all methods
@students = []

# Defining the width of the programme - used later on
@width = 43

def print_menu
  puts "---------------"
  puts "Options:"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def process(input)
  case input
  when "1"
    input_students # Change input_students to dumby_students for quick testing
  when "2"
    show_students
  when "9"
    exit # This will exit the problem... Like you couldn't have worked that out.
  else
    puts "I don't know what you meant, try again."
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

# Method for adding students through the command line.
def input_students
  puts "Add the students to the directory"
  puts "To finish, just hit return twice"
  # while the name is not empty, repeat this code
  while true do
    # Get the name
    print "Name: "
    name = gets.strip.capitalize
    if name.empty? == false
      # Then ask for the cohort
      print "Cohort: "
      cohort = gets.chomp.capitalize.to_s
      # Then ask for their hero
      print "Hero: "
      hero = gets.chomp
      # Adding default values to student info if left blank by the user.
      cohort = :January if cohort.empty?
      hero = "Not provided" if hero.empty?
      # Add the student to the array
      @students << {name: name, cohort: cohort, hero: hero}
      puts "Now we have #{@students.count} " + (@students.count > 1 ? "students" : "student")
    else
      # Break out of the loop if user input is blank
      break
    end
  end
end

# Called for testing rather than the above method
dumby_students = [
  {name: "Dr. Hannibal Lecter", cohort: :November, hero: "Himself"},
  {name: "Darth Vader", cohort: :November, hero: "The empirer"},
  {name: "Nurse Ratched", cohort: :Janurary, hero: "Order"},
  {name: "Michael Corleone", cohort: :November, hero: "His father"},
  {name: "Alex DeLarge", cohort: :Janurary, hero: "Oranges"},
  {name: "The Wicked Witch of the West", cohort: :November, hero: "Sister"},
  {name: "Terminator", cohort: :September, hero: "Guns"},
  {name: "Freddy Krueger", cohort: :Janurary, hero: "Knives"},
  {name: "The Joker", cohort: :Janurary, hero: "Batman"},
  {name: "Joffrey Baratheon", cohort: :November, hero: "Himself"},
  {name: "Norman Bates", cohort: :November, hero: "Alfred Hitchcock"}
]

# Method for the welcome text of the directory.
def print_header
  puts
  puts "The students of Villains Academy".center(@width)
  puts
end

# Method for printing a list to the console.
def print_students_list

  if @students.empty?
    puts "Villains Academy is empty. :(".center(@width)
    puts
    return
  end

  # Array of all the possible cohorts
  cohorts_list = [
    :January, :Feburary, :March, :April, :May, :June,
    :July, :August, :September, :October, :November, :December
  ]
  cohorts_list.each do |month|
    @students.each_with_index do |student, index|
      if student[:cohort] == month
        puts " #{student[:name]} (##{index + 1}) ".center(@width,"-")
        puts "Cohort: #{student[:cohort].capitalize}".center(@width)
        puts "Hero: #{student[:hero]}".center(@width)
        puts
      end
    end
  end

end

# Method for footer of the directory
def print_footer
  puts "Overall, we have #{@students.count} great students".center(@width, "-")
  puts
end

# Calling the menu function
interactive_menu
