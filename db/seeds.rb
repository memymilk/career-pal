require "faker"

puts "Cleaning database..."
Feedback.destroy_all
VideoCall.destroy_all
User.destroy_all

puts "Creating database..."

20.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    education: Faker::Job.education_level,
    work_experience: Faker::Job.title,
    extra_info: Faker::Quote.famous_last_words
  )

end

20.times do
  call = VideoCall.create!(
    user_one_id: User.first.id,
    user_two_id: User.last.id
  )
end

20.times do
  feedback = Feedback.create!(
    video_call_id: VideoCall.last.id,
    giver_id: User.first.id,
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
