class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.integer :route_id

    end
  end
end
