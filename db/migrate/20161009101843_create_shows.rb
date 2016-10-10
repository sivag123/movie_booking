class CreateShows < ActiveRecord::Migration
  def self.up
    create_table :shows do |t|

      t.time :show_time
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :shows
  end
end
