class CreateThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :themes do |t|
      t.string :title
      t.text :description
      t.integer :difficulty
      t.integer :price
      t.integer :playtime
      t.integer :player_count
      t.string :img_url

      t.timestamps
    end
  end
end
