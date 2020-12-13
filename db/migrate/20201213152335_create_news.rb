class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :description

      t.belongs_to :park, index: true

      t.timestamps
    end
  end
end
