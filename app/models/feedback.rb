class Feedback < ApplicationRecord
  belongs_to :giver, class_name: "User"
  belongs_to :videocall, class_name: "VideoCall"


  # def stars(rating)
  #   feedback.rating do
  #     image_tag "star_filled.svg"
  #   end
  #   (5 - feedback.rating).times do
  #     image_tag "star_empty.svg"
  #   end
  # end
end
