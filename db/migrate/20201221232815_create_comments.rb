class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :attraction_id

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :attraction_id
  end
end
