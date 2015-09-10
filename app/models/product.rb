class Product < ActiveRecord::Base
  attr_accessible :name, :price, :seller_id, :buyer_id

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true
  validates :seller_id, presence: true

  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
end
