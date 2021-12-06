class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      
      t.integer :area_id, null: false
      t.string :name, null: false
      t.boolean :has_beach, null: false, default: false
      t.boolean :has_boat, null: false, default: false
      t.string :image_id
      t.text :onsen
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
