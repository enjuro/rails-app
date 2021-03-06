class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :post_image_id

      t.timestamps
    end
    add_index :favorites, :user_id
    add_index :favorites, :post_image_id
    add_index :favorites, [:user_id, :post_image_id], unique: true
  end
end
