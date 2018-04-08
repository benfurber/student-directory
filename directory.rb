# The main file - the directory.

# Array of the students.
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

# Method for the welcome text of the directory.
def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

# Method for printing a list to the console.
def print(names)
  names.each do |name|
    puts name
  end
end

# Method for footer of the directory
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)
