class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|

      t.integer :user_id, null: false
      t.integer :movie_screen_id, null: false
      t.decimal :price, null: false
      t.integer :quantity, default: 1
      t.decimal :sub_total, default: 0.0
      t.decimal :discount_amount, default: 0.0
      t.decimal :total_amount, default: 0.0
      t.string :promo_code
      t.integer :active, default: 1
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :tickets
  end
end
