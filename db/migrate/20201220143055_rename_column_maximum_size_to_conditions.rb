class RenameColumnMaximumSizeToConditions < ActiveRecord::Migration[6.0]
  def change
    rename_column :attractions, :maximum_size, :conditions
    change_column :attractions, :conditions, :string
  end
end
