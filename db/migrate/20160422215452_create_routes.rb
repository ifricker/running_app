class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.references :user, foreign_key: true
      t.string :distance
      t.string :name
      t.string :map_url
      t.integer :start_id

      t.timestamps null: false
    end
  end
end
