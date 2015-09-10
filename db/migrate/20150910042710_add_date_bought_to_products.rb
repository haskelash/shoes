class AddDateBoughtToProducts < ActiveRecord::Migration
  def change
    add_column :products, :bought_at, :datetime
  end
end
