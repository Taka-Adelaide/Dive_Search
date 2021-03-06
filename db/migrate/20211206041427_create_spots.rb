class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|

      t.integer :area_id, null: false
      t.string :name, null: false
      t.text :caption, null: false
      t.boolean :has_beach, null: false, default: false
      t.boolean :has_boat, null: false, default: false
      t.boolean :for_beginners, null: false, default: false
      t.float :latitude, null: false
      t.float :longtitude, null: false
      t.string :image_id
      t.text :onsen
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
