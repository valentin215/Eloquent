class ChangeBookingReviewRelationship < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bookings, :review, index: true, foreign_key: true
    add_reference :reviews, :booking, index: true, foreign_key: true
  end
end
