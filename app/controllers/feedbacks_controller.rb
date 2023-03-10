class FeedbacksController < ApplicationController

  def new
    @videocall = Videocall.find(params[:videocall_id])
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @videocall = Videocall.find(params[:videocall_id])
    @feedback.videocall = @videocall
    @feedback.giver = current_user
    if @feedback.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @feedback = Feedback.find(params[:feedback_id])
  end

  private

  def feedback_params
    params.require(:feedback).permit(:written_feedback, :overall_impression, :eye_contact, :background_presentation, :problem_solving, :verbal_communication, :body_language, :enthusiasm, :professional_appearance, :hireability, :confidence, :feedback_id)
  end
end
