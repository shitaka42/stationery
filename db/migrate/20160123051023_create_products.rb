class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :detail
      t.integer :price
      t.text :image_url
      t.string :maker
      t.timestamps 
    end
  end
end
