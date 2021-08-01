class Review < ApplicationRecord
    belongs_to :product
    validates :user, presence: {message: "can not be empty"}
    validates :stars, presence: {message: "can not be empty"}
end
