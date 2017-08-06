class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :recipient_id
      t.integer :player_id
      t.string :action
      t.integer :stage_num
      t.string :notifiable_type
      t.integer :notifiable_id

      t.timestamps
    end
  end
end
