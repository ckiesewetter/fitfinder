class AddFieldsToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :requirement, :text
    add_column :activities, :fitness_level, :string
    add_column :activities, :pricing, :string
  end
end
