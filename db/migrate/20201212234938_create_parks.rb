class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :opening_times
      t.string :closing_times

      t.timestamps
    end
  end
end
