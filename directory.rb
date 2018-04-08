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

# Welcome text for the directory.
puts "The students of Villains Academy"
puts "----------"

# Printing the list of students to the console.
students.each do |student|
  puts student
end

# Then printing the total number of students.
puts "Overall, we have #{students.count} great students"
