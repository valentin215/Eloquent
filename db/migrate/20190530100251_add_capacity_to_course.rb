class AddCapacityToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :capacity, :integer
  end
end
