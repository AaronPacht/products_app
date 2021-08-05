class Product < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    validates :name, presence: {message: "can not be empty"}
    validates :price, presence: {message: "can not be empty"}
end
