class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = User.new
  end

  def user_show
  end

  def instructions
  end

  def profile
    @my_array = []
    @overall = []
    @eye_contact = []
    @background_presentation = []
    @verbal_communication = []
    @body_language = []
    @enthusiasm = []
    @professional_appearance = []
    @hireability = []
    @confidence = []
    @problem_solving = []
    @user = current_user

    @user.videocalls.each do |videocall|
      videocall.feedbacks.each do |feedback|
        @my_array << feedback if feedback.giver_id != @user.id
      end
    end
    @feedback_number = @my_array.length

    # user has no feedbacks
    if @feedback_number != 0

      @my_array.each do |feedback|
        @overall << feedback.overall_impression
        @eye_contact << feedback.eye_contact
        @background_presentation << feedback.background_presentation
        @verbal_communication << feedback.verbal_communication
        @body_language << feedback.body_language
        @enthusiasm << feedback.enthusiasm
        @professional_appearance << feedback.professional_appearance
        @hireability << feedback.hireability
        @confidence << feedback.confidence
        @problem_solving << feedback.problem_solving
      end

      @overall = @overall.sum / @feedback_number
      @eye_contact = @eye_contact.sum / @feedback_number
      @background_presentation = @background_presentation.sum / @feedback_number
      @verbal_communication = @verbal_communication.sum / @feedback_number
      @body_language = @body_language.sum / @feedback_number
      @enthusiasm = @enthusiasm.sum / @feedback_number
      @professional_appearance = @professional_appearance.sum / @feedback_number
      @hireability = @hireability.sum / @feedback_number
      @confidence = @confidence.sum / @feedback_number
      @problem_solving = @problem_solving.sum / @feedback_number

    else
      @overall = 0
      @eye_contact = 0
      @background_presentation = 0
      @verbal_communication = 0
      @body_language = 0
      @enthusiasm = 0
      @professional_appearance = 0
      @hireability = 0
      @confidence = 0
      @problem_solving = 0
    end

      @text_overall = compare(@overall)
      @text_eye_contact = compare(@eye_contact)
      @text_background_presentation = compare(@background_presentation)
      @text_verbal_communication = compare(@verbal_communication)
      @text_body_language = compare(@body_language)
      @text_enthusiasm = compare(@enthusiasm)
      @text_professional_appearance = compare(@professional_appearance)
      @text_hireability = compare(@hireability)
      @text_confidence = compare(@confidence)
      @text_problem_solving = compare(@problem_solving)
    end



  # education_editing_below
  def show_education
  end

  def edit_education
  end

  def update_education
    current_user.update(education: params.dig(:user, :education))
    redirect_to show_education_path
  end

  # work_experience_editing_below

  def show_work_experience
  end

  def edit_work_experience
  end

  def update_work_experience
    current_user.update(work_experience: params.dig(:user, :work_experience))
    redirect_to show_work_experience_path
  end

  # extra_info_editing_below

  def show_extra_info
  end

  def edit_extra_info
  end

  def update_extra_info
    current_user.update(extra_info: params.dig(:user, :extra_info))
    redirect_to show_extra_info_path
  end

  # first_name_below

  def show_first_name
  end

  def edit_first_name
  end

  def update_first_name
    current_user.update(first_name: params.dig(:user, :first_name))
    redirect_to show_first_name_path
  end


  private

  def compare(params)
    if params >= 4
      "Way to go, you are nailing it!"
    elsif params < 4 && params >= 3.5
      "You are on the right track, almost there"
    elsif params < 3.5 && params >= 1.5
      "Hmm this is something to pay attention to"
    elsif params < 1.5 && params > 0
      "Hey pal, have a look at this one"
    elsif params == 0
      ""
    end
  end
end
