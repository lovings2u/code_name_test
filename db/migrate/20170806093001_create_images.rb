class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :stage, foreign_key: true
      t.string :stage_type
      t.string :img_url

      t.timestamps
    end
  end
end
