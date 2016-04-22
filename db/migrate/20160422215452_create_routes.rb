class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.references :user, foreign_key: true
      t.float :distance
      t.float :starting_lat
      t.float :starting_lng
      t.string :name

      t.timestamps null: false
    end
  end
end
