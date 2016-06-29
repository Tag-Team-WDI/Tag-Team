class AddVisionDataToArts < ActiveRecord::Migration
  def change
    add_column :arts, :vision, :string
  end
end
