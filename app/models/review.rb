class Review < ApplicationRecord
    belongs_to :product
    belongs_to :user
    validates :user, presence: {message: "can not be empty"}
    validates :stars, presence: {message: "can not be empty"}
    validates :stars, numericality: {greater_than_or_equal_to: 0,less_than_or_equal_to: 5}
end
