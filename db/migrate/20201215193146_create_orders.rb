class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :number_order
      t.integer :state
      t.string :delivery_mode
      t.string :delivery_address
      t.decimal :amount_ht, precision: 8, scale: 2
      t.decimal :amount_ttc, precision: 8, scale: 2

      t.belongs_to :user, index: true
      t.belongs_to :cart, index: true

      t.timestamps
    end
  end
end
