class Videocall < ApplicationRecord
  belongs_to :user_one, class_name: "User"
  belongs_to :user_two, class_name: "User", optional: true
  has_many :feedbacks #foreign_key: true
end
