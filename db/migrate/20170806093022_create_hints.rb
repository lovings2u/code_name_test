class CreateHints < ActiveRecord::Migration[5.0]
  def change
    create_table :hints do |t|
      t.references :stage, foreign_key: true
      t.text :description
      t.string :img_url

      t.timestamps
    end
  end
end
