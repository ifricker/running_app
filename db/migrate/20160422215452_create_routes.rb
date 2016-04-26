class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.references :user, foreign_key: true
      t.string :distance
      t.string :name

      t.timestamps null: false
    end
  end
end
