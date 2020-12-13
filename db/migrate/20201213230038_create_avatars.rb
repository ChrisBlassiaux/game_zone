class CreateAvatars < ActiveRecord::Migration[6.0]
  def change
    create_table :avatars do |t|
      t.string :url, default: "https://res.cloudinary.com/gamezonestorage/image/upload/v1607901465/avatars1.png"

      t.timestamps
    end
  end
end
