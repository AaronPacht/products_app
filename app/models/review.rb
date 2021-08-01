class Review < ApplicationRecord
    belongs_to :product
    validates :user, presence: true
    validates :stars, presence: true
end
