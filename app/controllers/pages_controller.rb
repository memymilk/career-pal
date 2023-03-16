class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = User.new
    # redirect_to profile_path if user_signed_in?
  end

  def user_show
  end

  def instructions
  end

  def test
  end

  def profile
    @scores = current_user.average_impression
    @text_overall = compare(@scores[:overall_impression])
    @text_eye_contact = compare(@scores[:eye_contact])
    @text_background_presentation = compare(@scores[:background_presentation])
    @text_verbal_communication = compare(@scores[:verbal_communication])
    @text_body_language = compare(@scores[:body_language])
    @text_enthusiasm = compare(@scores[:enthusiasm])
    @text_professional_appearance = compare(@scores[:professional_appearance])
    @text_hireability = compare(@scores[:hireability])
    @text_confidence = compare(@scores[:confidence])
    @text_problem_solving = compare(@scores[:problem_solving])
    points_per_category
  end

  # education_editing_below
  def show_education
  end

  def edit_education
  end

  def update_education
    current_user.update(rich_education: params.dig(:user, :rich_education))
    redirect_to show_education_path
  end

  # work_experience_editing_below

  def show_work_experience
  end

  def edit_work_experience
  end

  def update_work_experience
    current_user.update(rich_work_experience: params.dig(:user, :rich_work_experience))
    redirect_to show_work_experience_path
  end

  # extra_info_editing_below

  def show_extra_info
  end

  def edit_extra_info
  end

  def update_extra_info
    current_user.update(rich_extra_info: params.dig(:user, :rich_extra_info))
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

  def points_per_category
    @scatter = {
      overall_each: [],
      eye_contact_each: [],
      background_presentation_each: [],
      verbal_communication_each: [],
      body_language_each: [],
      enthusiasm_each: [],
      professional_appearance_each: [],
      hireability_each: [],
      confidence_each: [],
      problem_solving_each: []
    }
    current_user.feedbacks_as_receiver.each do |feedback|
      @scatter[:overall_each] << feedback[:overall_impression]
      @scatter[:eye_contact_each] << feedback[:eye_contact]
      @scatter[:background_presentation_each] << feedback[:background_presentation]
      @scatter[:verbal_communication_each] << feedback[:verbal_communication]
      @scatter[:body_language_each] << feedback[:body_language]
      @scatter[:enthusiasm_each] << feedback[:enthusiasm]
      @scatter[:professional_appearance_each] << feedback[:professional_appearance]
      @scatter[:hireability_each] << feedback[:hireability]
      @scatter[:confidence_each] << feedback[:confidence]
      @scatter[:problem_solving_each] << feedback[:problem_solving]
    end
  end


  private

  def compare(params)
    if params
      if params >= 4
        "Nailing it!"
      elsif params < 4 && params >= 3.7
        "Way to go, yout mum can be proud"
      elsif params < 3.7 && params >= 3.2
        "You are on the right track, almost there"
      elsif params < 3.2 && params >= 2.5
        "A bit more love for this"
      elsif params < 2.5 && params >= 2
        "Hmm a bit more attention here"
      elsif params < 2 && params >= 1.7
        "Hey pal, have a look at this one"
      else
        "Let's really look into this!"
      end
    end
  end
end
