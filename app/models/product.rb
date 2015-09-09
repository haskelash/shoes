class Product < ActiveRecord::Base
  attr_accessible :name, :price, :seller_id, :buyer_id

  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
end
