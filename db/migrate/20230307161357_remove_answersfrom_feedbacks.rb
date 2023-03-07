class RemoveAnswersFromFeedbacks < ActiveRecord::Migration[7.0]
  def change
    remove_column :feedbacks, :answers
  end
end
