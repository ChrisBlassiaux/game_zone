class CreateAttractions < ActiveRecord::Migration[6.0]
  def change
    create_table :attractions do |t|
      t.string :name
      t.integer :experience_points
      t.integer :maximum_size
      t.text :description
      t.string :video_pesentation

      t.timestamps
    end
  end
end
