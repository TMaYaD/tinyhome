class CreateDeviceConfigurations < ActiveRecord::Migration[6.0]
  def change
    create_table :device_configurations do |t|
      t.string :name
      t.string :location
      t.integer :module_type

      t.timestamps
    end
  end
end
