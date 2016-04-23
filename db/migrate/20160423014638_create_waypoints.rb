class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.decimal :latitude
      t.decimal :longitude
    end
  end
end
