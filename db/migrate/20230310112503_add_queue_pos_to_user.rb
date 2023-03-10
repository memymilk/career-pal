class AddQueuePosToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :queue_pos, :integer
  end
end
