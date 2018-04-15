# The main file - the directory.

require 'csv'

# The students array - accessible to all methods
@students = []

# Array of all the possible cohorts
@cohorts_list = [
  :January, :Feburary, :March, :April, :May, :June,
  :July, :August, :September, :October, :November, :December
]

# Defining the width of the programme - used later on
@width = 43

def print_menu
  puts "---------------"
  puts "Options:"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "5. Read source code"
  puts "9. Exit"
end

def process(input)
  case input
  when '1' then input_students
  when '2' then show_students
  when '3' then save_students
  when '4' then load_students
  when '5' then read_source_code
  when '9' then exit
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
    process(STDIN.gets.chomp)
  end
end

def load_students(filename = "students.csv")
  return if filename.nil?
  CSV.foreach(filename) do |row|
    name, cohort, hero = row
    student_to_array(name, cohort, hero)
  end
  puts "Loaded #{@students.count} from #{filename}"
end

# Method for adding students through the command line.
def input_students
  puts "Add the students to the directory"
  puts "To finish, just hit return twice"
  # while the name is not empty, repeat this code
  while true do
    print "Name: "
    name = STDIN.gets.strip.capitalize
    if name.empty? == false
      # Then ask for the cohort
      print "Cohort: "
      cohort = STDIN.gets.chomp.capitalize.to_s
      @cohorts_list.push(cohort) if @cohorts_list.include(cohort) == false
      print "Hero: "
      hero = STDIN.gets.chomp
      cohort = :January if cohort.empty?
      hero = "Not provided" if hero.empty?
      student_to_array(name, cohort, hero)
      puts "Now we have #{@students.count} " + (@students.count > 1 ? "students" : "student")
    else
      break
    end
  end
end

def student_to_array(name, cohort, hero)
  @students << { name: name, cohort: cohort.to_sym, hero: hero }
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hero]]
    csv_line = student_data.join(",")
    file.puts csv_line
    print "#{student[:name]} added. "
  end
  file.close
  puts
end

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

  @cohorts_list.each do |month|
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

def read_source_code
  File.open($0, 'r') do |file|
    file.each_line do |line|
      puts line
    end
  end
end

# Calling the menu functions

load_students(ARGV.first)
interactive_menu
