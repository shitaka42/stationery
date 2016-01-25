class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.integer :user_id
      t.integer :total_rate
      t.integer :use_rate
      t.integer :design_rate
      t.integer :cp_rate
      t.text :review
      t.integer :genre
      t.timestamps
    end
  end
end
