class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.string :image_id
      t.text :caption
      t.integer :grade
      t.string :color
      t.string :wall_type
      t.integer :admin_id

      t.timestamps
    end
  end
end
