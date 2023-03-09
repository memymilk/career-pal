class FeedbacksController < ApplicationController

  def new
    @videocall = VideoCall.find(params[:videocall_id])
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @videocall = VideoCall.find(params[:videocall_id])
    @feedback.videocall = @videocall
    @feedback.giver = current_user
    if @feedback.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def feedback_params

  end
end
