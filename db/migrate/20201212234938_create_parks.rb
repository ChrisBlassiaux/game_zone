class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :first_part_schedules
      t.string :second_part_schedules
      t.string :last_part_schedules

      t.timestamps
    end
  end
end
