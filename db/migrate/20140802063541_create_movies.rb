class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :rating
      t.text :synopsis
      t.boolean :active

      t.timestamps
    end
  end
end
