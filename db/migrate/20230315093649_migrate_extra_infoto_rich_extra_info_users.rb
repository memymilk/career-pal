class MigrateExtraInfotoRichExtraInfoUsers < ActiveRecord::Migration[7.0]
  def up
    User.find_each do |user|
      user.update(rich_extra_info: user.extra_info)
    end
  end

  def down
    User.find_each do |user|
      user.update(extra_info: user.rich_extra_info)
      user.update(rich_extra_info: nil)
    end
  end
end
