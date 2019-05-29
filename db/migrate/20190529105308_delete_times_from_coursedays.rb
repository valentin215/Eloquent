class DeleteTimesFromCoursedays < ActiveRecord::Migration[5.2]
  def change
    remove_column :course_days, :start_time
    remove_column :course_days, :end_time
  end
end
