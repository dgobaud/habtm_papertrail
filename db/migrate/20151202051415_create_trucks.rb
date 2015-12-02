class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.timestamps null: false
    end

    create_join_table(:routes, :trucks) do |t|
      t.index :route_id
      t.index :truck_id
      t.index [:route_id, :truck_id], :unique => true
    end
  end
end
