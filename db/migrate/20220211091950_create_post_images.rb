class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.string :preview_image_id
      t.string :title
      t.text :caption
      t.string :grade
      t.string :color
      t.string :tape
      t.string :wall_type
      t.integer :admin_id
      t.date :duration

      t.timestamps
    end
  end
end
