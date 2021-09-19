class Product < ApplicationRecord
    has_many :reviews
    belongs_to :user

    validates :name, presence: {message: "can not be empty"}
    validates :price, presence: {message: "can not be empty"}

    scope :search, ->(input){where("lower(name) LIKE ?", "#{input.downcase}%").order(:name)}
end
