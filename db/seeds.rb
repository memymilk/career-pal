require "faker"

puts "Cleaning database..."
Videocall.destroy_all
Feedback.destroy_all
User.destroy_all

puts "Creating database..."


user_one = User.create!(
  email: Faker::Internet.email,
  password: "123456",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  education: Faker::Job.education_level,
  work_experience: Faker::Job.title,
  extra_info: Faker::Quote.famous_last_words
)

User.create!(
  email: "a@a.com",
  password: "123456",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  education: Faker::Job.education_level,
  work_experience: Faker::Job.title,
  extra_info: Faker::Quote.famous_last_words
)

20.times do

  user_two = User.create!(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    education: Faker::Job.education_level,
    work_experience: Faker::Job.title,
    extra_info: Faker::Quote.famous_last_words
  )
  
  videocall = Videocall.create!(
    user_one_id: user_one.id,
    user_two_id: user_two.id
  )

  Feedback.create!(
    videocall_id: videocall.id,
    giver_id: [user_two.id, user_one.id].sample,
    overall_impression: Faker::Number.within(range: 1..5),
    eye_contact: Faker::Number.within(range: 1..5),
    background_presentation: Faker::Number.within(range: 1..5),
    problem_solving: Faker::Number.within(range: 1..5),
    verbal_communication: Faker::Number.within(range: 1..5),
    body_language: Faker::Number.within(range: 1..5),
    enthusiasm: Faker::Number.within(range: 1..5),
    professional_appearance: Faker::Number.within(range: 1..5),
    hireability: Faker::Number.within(range: 1..5),
    confidence: Faker::Number.within(range: 1..5),
    written_feedback: Faker::Quote.famous_last_words
  )

  feedback_user_two = Feedback.create!(
    videocall_id: Videocall.all.sample.id,
    giver_id: User.all.sample.id,
    overall_impression: Faker::Number.within(range: 1..5),
    eye_contact: Faker::Number.within(range: 1..5),
    background_presentation: Faker::Number.within(range: 1..5),
    problem_solving: Faker::Number.within(range: 1..5),
    verbal_communication: Faker::Number.within(range: 1..5),
    body_language: Faker::Number.within(range: 1..5),
    enthusiasm: Faker::Number.within(range: 1..5),
    professional_appearance: Faker::Number.within(range: 1..5),
    hireability: Faker::Number.within(range: 1..5),
    confidence: Faker::Number.within(range: 1..5),
    written_feedback: Faker::Quote.famous_last_words
  )
end

puts "Finished!"
