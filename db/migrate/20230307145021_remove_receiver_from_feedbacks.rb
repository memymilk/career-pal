class RemoveReceiverFromFeedbacks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :feedbacks, :receiver, foreign_key: { to_table: :users }
  end
end
