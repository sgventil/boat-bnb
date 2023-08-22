class DropBookingTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :bookings
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
