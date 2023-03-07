require "open-uri"
require "faker"

puts "Cleaning database..."
Feedback.destroy_all
User.destroy_all

puts "Creating database..."

# i = 0
20.times do
  user = User.create(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    education: Faker::Job.education_level,
    work_experience: Faker::Job.title
  )
  #What about the 20 photos from unsplash?
  # This is what we had for our angry_cats project.
  # cat.photo.attach(io: URI.open("https://cataas.com/cat"), filename: "test")
  # cat.user = User.all[i]
  # cat.save!

  # i += 1
end

puts "Finished!"
