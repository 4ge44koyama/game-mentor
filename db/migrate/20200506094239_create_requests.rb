class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :to_id, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
