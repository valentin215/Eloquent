class DeleteUserReferencesFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :user_references
  end
end
