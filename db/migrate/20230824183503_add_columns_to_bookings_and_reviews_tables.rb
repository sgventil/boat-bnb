class AddColumnsToBookingsAndReviewsTables < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :booking_date
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date
    add_column :reviews, :rating, :integer
  end
end
