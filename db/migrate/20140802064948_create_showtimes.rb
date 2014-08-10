class CreateShowtimes < ActiveRecord::Migration
  def change
    create_table :showtimes do |t|
      t.references :cinema, index: true
      t.references :movie, index: true
      t.datetime :showtime
      t.boolean :active

      t.timestamps
    end
  end
end
