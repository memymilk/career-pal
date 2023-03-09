class ChangeNameToTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :video_calls, :videocalls
  end
end
