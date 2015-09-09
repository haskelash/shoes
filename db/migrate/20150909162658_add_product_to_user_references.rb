class AddProductToUserReferences < ActiveRecord::Migration
  def change
    add_column :products, :seller_id, :int
    add_column :products, :buyer_id, :int

    add_index :products, :seller_id
    add_index :products, :buyer_id
  end
end
