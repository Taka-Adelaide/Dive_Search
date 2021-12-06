class CreateSpotFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :spot_favorites do |t|
      t.integer :user_id, null: false
      t.integer :spot_id, null: false
      t.timestamps
    end
  end
end
