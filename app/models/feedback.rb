class Feedback < ApplicationRecord
  belongs_to :giver, class_name: "User"
  belongs_to :video_call, class_name: "VideoCall"
end
