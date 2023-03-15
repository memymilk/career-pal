class MigrateWorkExperiencetoRichWorkExperienceUsers < ActiveRecord::Migration[6.0]
  def up
    User.find_each do |user|
      user.update(rich_work_experience: user.work_experience)
    end
  end

  def down
    User.find_each do |user|
      user.update(work_experience: user.rich_work_experience)
      user.update(rich_work_experience: nil)
    end
  end
end
