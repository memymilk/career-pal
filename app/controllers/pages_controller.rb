class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def user_show
  end

  def profile
    @my_array = []
    user = User.last
    user.video_calls.each do |videocall|
      videocall.feedbacks.each do |feedback|
        @my_array << feedback if feedback.giver_id != user.id
      end
    end
  end
end
