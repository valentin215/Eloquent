class AddStartTimeToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :start_time, :string
    add_column :courses, :integer, :string
  end
end
