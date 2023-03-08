class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def user_show
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
    @user = User.last

    @user.video_calls.each do |videocall|
      videocall.feedbacks.each do |feedback|
        @my_array << feedback if feedback.giver_id != @user.id
      end
    end
    @feedback_number = @my_array.length
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

  private

  def compare(params)

    if params >= 4
      "Way to go, you are nailing it!"
    elsif params < 4 && params >= 3.5
       "You are on the right track, almost there"
    elsif params < 2.5 && params >= 1.5
       "Hmm this is something to pay attention to"
    else
       "Hey pal, have a look at this one"
    end



  end




end
