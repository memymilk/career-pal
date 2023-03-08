class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :video_calls, class_name: "VideoCall", foreign_key: :user_one
  has_many :video_calls, class_name: "VideoCall", foreign_key: :user_two
  has_many :feedbacks_as_giver, class_name: "Feedback", foreign_key: :giver_id
  has_many :feedbacks_as_receiver, class_name: "Feedback", foreign_key: :receiver_id
end
