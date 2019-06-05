class ChangeStartTimeToBeTimeInCourseDays < ActiveRecord::Migration[5.2]
  def change
    remove_column :course_days, :start_time, :integer
    remove_column :course_days, :end_time, :integer
  end
end
