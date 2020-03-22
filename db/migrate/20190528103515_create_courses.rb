class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.date :end_date
      t.date :start_date
      t.text :teacher_description
      t.string :years_of_experience
      t.string :qualifications
      t.string :level
      t.string :address
      t.string :area
      t.string :city
      t.float :latitude
      t.float :longitude
      t.float :price
      t.string :video_url
      t.references :user, foreign_key: true
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
