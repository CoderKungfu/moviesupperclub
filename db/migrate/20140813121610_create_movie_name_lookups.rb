class CreateMovieNameLookups < ActiveRecord::Migration
  def change
    create_table :movie_name_lookups do |t|
      t.string :name
      t.string :misspelt

      t.timestamps
    end
  end
end
