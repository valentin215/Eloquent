class RemoveStartTimeFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :start_time, :time
  end
end
