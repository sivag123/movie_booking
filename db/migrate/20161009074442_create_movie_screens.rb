class CreateMovieScreens < ActiveRecord::Migration
  def self.up
    create_table :movie_screens do |t|

      t.integer :movie_id, null: false
      t.integer :theater_id, null: false
      t.integer :show_id, null: false
      t.date :show_date, null: false
      t.integer :total_seats, null: false
      t.integer :booked_seats, null: false
      t.integer :remaining_seats, null:false
      t.timestamps null: false
    end

    add_index :movie_screens, [:movie_id, :theater_id]
  end

  def self.down
    drop_table :movie_screens
  end
end
