class User < ApplicationRecord
    has_secure_password
    validates :password, length: { in: 7..15 }
    validates :username, length: { in: 7..15 }
    validates :username, uniqueness: true
end
