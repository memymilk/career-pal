class AddExtraFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :work_experience, :text
    add_column :users, :education, :text
    add_column :users, :extra_info, :text
    add_column :users, :ready, :boolean
  end
end
