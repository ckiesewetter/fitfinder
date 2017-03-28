class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :user_id
      t.string :website
      t.text :description
      t.datetime :next_at
      t.references :location, foreign_key: true
      t.text :schedule

      t.timestamps
    end
  end
end
