class AddFieldsToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :question, :text
    add_column :questions, :answer, :text
    add_column :questions, :question_type, :boolean
  end
end
