class AddExperienceToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :teacher_experience, :integer
  end
end
