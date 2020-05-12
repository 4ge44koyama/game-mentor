class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :to, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
