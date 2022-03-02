class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :admin_id

      t.timestamps
    end
    add_index :relationships, :user_id
    add_index :relationships, :admin_id
    add_index :relationships, [:user_id, :admin_id], unique: true
  end
end
