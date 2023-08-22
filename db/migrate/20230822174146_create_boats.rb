class CreateBoats < ActiveRecord::Migration[7.0]
  def change
    create_table :boats do |t|
      t.integer :price
      t.integer :rating
      t.string :name
      t.string :description
      t.string :location
      t.string :availability
      t.integer :user_d

      t.timestamps
    end
  end
end
