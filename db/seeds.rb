# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "seeding specialisations..."
specialisations_array = [
    'Mathematics',
    'Algebra',
    'Geometry',
    'Science',
    'Geography',
    'History',
    'English',
    'Spanish',
    'German',
    'French',
    'Latin',
    'Greek',
    'Arabic',
    'Computer Science',
    'Art',
    'Economics',
    'Music',
    'Drama',
    'Physical Education']
specialisations_array.each do |spec|
  a = Specialisation.new(name: spec)
  a.save
end

puts "finished!"
