class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id, null:false
      t.integer :post_id, null:false
      t.string :content, null:false

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :post_id
  end
end