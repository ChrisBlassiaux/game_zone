class AddSlugToNews < ActiveRecord::Migration[6.0]
  def change
    add_column :news, :slug, :string
    add_index :news, :slug, unique: true
  end
end
