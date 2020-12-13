class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      
      t.decimal :unit_price_ht, precision: 8, scale: 2
      t.decimal :unit_price_tva, precision: 8, scale: 2
      t.decimal :unit_price_ttc, precision: 8, scale: 2
      
      t.integer :tva

      t.timestamps
    end
  end
end
