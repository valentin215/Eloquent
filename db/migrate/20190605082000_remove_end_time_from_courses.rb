class RemoveEndTimeFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :end_time, :time
  end
end
