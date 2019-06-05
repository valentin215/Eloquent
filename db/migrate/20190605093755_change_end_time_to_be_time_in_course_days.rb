class ChangeEndTimeToBeTimeInCourseDays < ActiveRecord::Migration[5.2]
  def change
    add_column :course_days, :start_time, :time
    add_column :course_days, :end_time, :time
  end
end
