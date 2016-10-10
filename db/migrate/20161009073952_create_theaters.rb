class CreateTheaters < ActiveRecord::Migration
  def self.up
    create_table :theaters do |t|

      t.string :name, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null:false
      t.string :show_ids, null: false
      t.timestamps null: false
    end

    add_index :theaters, :name
  end

  def self.down
    drop_table :theaters
  end
end
