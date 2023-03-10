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
      redirect_to profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @feedback = Feedback.find(params[:id])
    @scores = current_user.average_impression

  end

  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    redirect_to profile_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:written_feedback, :overall_impression, :eye_contact, :background_presentation, :problem_solving, :verbal_communication, :body_language, :enthusiasm, :professional_appearance, :hireability, :confidence)
  end
end
