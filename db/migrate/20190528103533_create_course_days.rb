class CreateCourseDays < ActiveRecord::Migration[5.2]
  def change
    create_table :course_days do |t|
      t.time :start_time
      t.time :end_time
      t.string :working_day
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
