class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.references :user, foreign_key: true
      t.decimal :distance
      t.integer :start_id
      t.string :name

      t.timestamps null: false
    end
  end
end