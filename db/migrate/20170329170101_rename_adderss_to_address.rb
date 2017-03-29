class RenameAdderssToAddress < ActiveRecord::Migration[5.0]
  def change
    rename_column :locations, :adderss, :address
  end
end
