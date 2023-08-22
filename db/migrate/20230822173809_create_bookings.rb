class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :boat_id
      t.integer :user_id
      t.string :content

      t.timestamps
    end
  end
end
