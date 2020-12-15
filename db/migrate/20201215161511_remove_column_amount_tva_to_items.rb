class RemoveColumnAmountTvaToItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :unit_price_tva
  end
end
