class AddFeeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :fee, :string
  end
end
