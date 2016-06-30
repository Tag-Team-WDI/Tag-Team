class AddPaperClipToArt < ActiveRecord::Migration
  def change
    remove_column :arts, :image, :string
    add_attachment :arts, :image 
  end
end
