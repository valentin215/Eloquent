class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.float :total_price
      t.string :user_references
      t.references :course, foreign_key: true
      t.references :review, foreign_key: true

      t.timestamps
    end
  end
end
