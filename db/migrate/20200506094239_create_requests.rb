class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :to, null: false, foreign_key: { to_table: :users }
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
