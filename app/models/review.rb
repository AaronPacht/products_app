class Review < ApplicationRecord
    belongs_to :product
    belongs_to :user
    validates :user, presence: {message: "can not be empty"}
    validates :stars, presence: {message: "can not be empty"}
end
