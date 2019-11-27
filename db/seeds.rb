# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying bookings..."
Booking.destroy_all
puts "destroying tutors..."
Tutor.destroy_all
puts "destroying users..."
User.destroy_all
puts "destroying specialisations..."
Specialisation.destroy_all

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


puts "seeding 10 users..."
names_array = %w(one two three four five six seven eight nine ten)
names_array.each do |number|
  string = number + "@lewagon.com"
  a = User.new(email: string, password: "helloworld")
  a.save
end

puts "seeding 5 tutors..."
allusers = User.all.sort
r = 0
5.times {
  b = Tutor.new(user: allusers[r], age: 20, gender: "male", bio: "helloworld", activity_status: true)
  b.save
  r += 1
}

puts "seeding 10 bookings"
allusers = User.all.sort
tutors = allusers.slice(0..4)
10.times {
  a = Booking.new(user: allusers.sample, tutor: tutors.sample.tutor, start_datetime: DateTime.now, end_datetime: DateTime.now, location: "To Be Confirmed", comments: "No Comments Yet")
  a.save
}

puts "finished!"
