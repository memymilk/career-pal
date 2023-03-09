require "faker"

puts "Cleaning database..."
VideoCall.destroy_all
Feedback.destroy_all
VideoCall.destroy_all
User.destroy_all

puts "Creating database..."
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
  user_one = User.create!(
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
  video_call = VideoCall.create!(
    user_one_id: User.all.first.id,
    user_two_id: User.all.last.id
  )
end

  user_two = User.create!(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    education: Faker::Job.education_level,
    work_experience: Faker::Job.title,
    extra_info: Faker::Quote.famous_last_words
  )


  call = VideoCall.create!(
    user_one_id: user_one.id,
    user_two_id: user_two.id
  )

  feedback_user_one = Feedback.create!(
    video_call_id: call.id,
    giver_id: user_one.id,
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
    video_call_id: call.id,
    giver_id: user_two.id,
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
    giver_id: User.first.id,
    video_call_id: VideoCall.sample.id,
    written_feedback: Faker::Quote.famous_last_words
  )
end

puts "Finished!"
