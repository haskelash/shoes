class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name

  validates :first_name, presence: true, length: { maximum: 50}
  validates :last_name, presence: true, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  before_create :downcase

  has_many :sales, class_name: 'Product', foreign_key: 'seller_id'
  has_many :purchases, class_name: 'Product', foreign_key: 'buyer_id'

  private
    def downcase
      self.email.downcase!
    end
end
