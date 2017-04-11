class AddPaperclipToLocations < ActiveRecord::Migration[5.0]
  def change
    add_attachment :locations, :image
  end
end
