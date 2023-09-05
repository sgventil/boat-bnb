class RemoveImageFilePathFromBoats < ActiveRecord::Migration[7.0]
  def change
    remove_column :boats, :image_filepath, :string
  end
end
