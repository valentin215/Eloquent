class AddAmountToBookings < ActiveRecord::Migration[5.2]
  def change
    add_monetize :bookings, :price, currency: { present: false }
  end
end
