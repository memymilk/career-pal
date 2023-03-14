class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :videocalls, class_name: "Videocall", foreign_key: :user_one, dependent: :destroy
  has_many :videocalls, class_name: "Videocall", foreign_key: :user_two, dependent: :destroy
  has_many :feedbacks_as_giver, class_name: "Feedback", foreign_key: :giver_id
  # has_many :feedbacks_as_receiver, through: :videocalls, source: :feedbacks
  # has_many :feedbacks_as_receiver, class_name: "Feedback", foreign_key: :receiver_id

  def feedbacks_as_receiver
    @videocalls = Videocall.where(user_one_id: id).or(Videocall.where(user_two_id: id))
    @feedbacks = @videocalls.map(&:feedbacks).flatten.reject { |feedback| feedback.giver_id == id }
  end

  def average_impression
    results = {}
    scores = feedbacks_as_receiver.pluck(*Feedback::AVERAGE_PROPERTIES).transpose.map do |scores|
      scores.sum.fdiv(scores.length)
    end
    Feedback::AVERAGE_PROPERTIES.each_with_index do |property, index|
      results[property] = scores[index].nil? ? 0 : scores[index]
    end
    results
  end
end
