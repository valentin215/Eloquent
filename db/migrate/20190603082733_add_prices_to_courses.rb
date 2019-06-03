class AddPricesToCourses < ActiveRecord::Migration[5.2]
  def change
    add_monetize :courses, :price, currency: { present: false }
  end
end
