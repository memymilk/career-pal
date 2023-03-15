class MigrateEducationtoRichEducationUsers < ActiveRecord::Migration[7.0]
  def up
    User.find_each do |user|
      user.update(rich_education: user.education)
    end
  end

  def down
    User.find_each do |user|
      user.update(education: user.rich_education)
      user.update(rich_education: nil)
    end
  end
end
