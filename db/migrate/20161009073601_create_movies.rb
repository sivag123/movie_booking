class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :name, null: false
      t.integer :language, null:false
      t.decimal :ticket_fee, null: false
      t.integer :currency, null: false, default: 1
      t.text :crew_info

      t.timestamps null: false
    end
    add_index :movies, :name
  end
  def self.down
    drop_table :movies
  end
end
