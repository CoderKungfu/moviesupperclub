class CreateShowtimesTags < ActiveRecord::Migration
  def change
    create_table :showtimes_tags, :id => false do |t|
      t.references :showtime, :tag
    end
    add_index :showtimes_tags, [:showtime_id, :tag_id]
  end
end
