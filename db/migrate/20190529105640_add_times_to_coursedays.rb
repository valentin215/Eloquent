class AddTimesToCoursedays < ActiveRecord::Migration[5.2]
  def change
    add_column :course_days, :start_time, :integer
    add_column :course_days, :end_time, :integer
  end
end
