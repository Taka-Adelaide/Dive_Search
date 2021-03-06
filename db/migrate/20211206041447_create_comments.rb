class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :spot_id, null: false
      t.string :title, null: false
      t.text :comment, null: false
      t.string :image_id
      t.timestamps
    end
  end
end
