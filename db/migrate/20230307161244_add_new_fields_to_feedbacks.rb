class AddNewFieldsToFeedbacks < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :written_feedback, :text
    add_column :feedbacks, :overall_impression, :integer
    add_column :feedbacks, :eye_contact, :integer
    add_column :feedbacks, :background_presentation, :integer
    add_column :feedbacks, :problem_solving, :integer
    add_column :feedbacks, :verbal_communication, :integer
    add_column :feedbacks, :body_language, :integer
    add_column :feedbacks, :enthusiasm, :integer
    add_column :feedbacks, :professional_appearance, :integer
    add_column :feedbacks, :hireability, :integer
    add_column :feedbacks, :confidence, :integer
  end
end
