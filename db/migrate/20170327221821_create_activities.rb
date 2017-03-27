class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.time :time
      t.date :date
      t.string :location_name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
