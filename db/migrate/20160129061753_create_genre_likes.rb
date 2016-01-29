class CreateGenreLikes < ActiveRecord::Migration
  def change
    create_table :genre_likes do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :genre_type
      t.timestamps
    end
  end
end
