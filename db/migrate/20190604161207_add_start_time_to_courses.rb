class AddStartTimeToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :start_time, :time
  end
end
