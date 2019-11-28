# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying TutorSpecialisation..."
TutorSpecialisation.destroy_all
puts "destroying specialisations..."
Specialisation.destroy_all
puts "destroying reviews..."
Review.all.destroy_all
puts "destroying bookings..."
Booking.destroy_all
puts "destroying tutors..."
Tutor.destroy_all
puts "destroying users..."
User.destroy_all

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

puts "seeding 100 users..."
names_array = [*"1".."100"]
names_array.each do |number|
  string = number + "@lewagon.com"
  array = %w[Audrina Courtney Angelique Meaghan Dior Adalee Palmer Oaklynn Haisley Keily Novah Yara Ensley Liam Noah William James Oliver Benjamin Elijah Lucas Mason Logan Austin Alva Acacius Tate Diego Adah Reese Mika Paisley Amina Ellis Phoenix Remy Marlowe Shea Ava Isabella Sophia Charlotte Mia Amelia Harper Evelyn Benjamin Brayden Bryson Brandon Braxton Brody Bennett Olivia Oliver Amelia George Isla Harry Ava Noah Emily Jack Sophia Charlie Grace Leo Mia Jacob Poppy Freddie Ella Alfie]
  space = " "
  name2 = array.sample + space
  name3 = name2 + array.sample
  a = User.new(email: string, password: "password", name: name3, preference: "No Preferences!", phone_number: "12345678")
  a.save
end

puts "seeding 50 tutors..."
allusers = User.all.sort
r = 0
50.times {
  b = Tutor.new(user: allusers[r], bio: "helloworld", activity_status: "true", remote_photo_url: 'https://i.pravatar.cc/300')
  b.age = rand(12..90)
  b.gender = ["Male", "Female", "Male", "Female", "Male", "Female", "Nonbinary", "Genderfluid"].sample
  b.specialisations << Specialisation.all.sample
  b.activity_status = %w[Active Inactive].sample
  b.save
  r += 1
}

puts "seeding 100 bookings..."
allusers = User.all.sort
tutors = allusers.slice(0..4)
100.times {
  a = Booking.new(user: allusers.sample, tutor: tutors.sample.tutor, start_datetime: DateTime.now, end_datetime: DateTime.now, location: "To Be Confirmed", comments: "No Comments Yet")
  a.save
}

puts "seeding 80 reviews..."
allbookings = Booking.all.sort
r = 0
80.times{
  a = Review.new(booking: allbookings[r], content: "Meh it was fine but i've seen better tutors!", stars: rand(0..5))
  a.save
  r += 1
}

puts "finished!"
