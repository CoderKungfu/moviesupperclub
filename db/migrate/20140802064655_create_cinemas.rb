class CreateCinemas < ActiveRecord::Migration
  def change
    create_table :cinemas do |t|
      t.string :name
      t.string :group
      t.string :cinema_code
      t.boolean :active

      t.timestamps
    end
  end
end
