class User < ApplicationRecord
    has_many :reviews
    has_many :products, through: :reviews
    has_secure_password
    validates :password, length: { in: 7..15 }
    validates :username, length: { in: 7..15 }
    validates :username, uniqueness: true
end
